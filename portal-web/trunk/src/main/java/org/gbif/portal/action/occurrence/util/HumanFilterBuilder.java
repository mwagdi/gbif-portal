/*
 * Copyright 2012 Global Biodiversity Information Facility (GBIF)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.gbif.portal.action.occurrence.util;

import org.gbif.api.model.occurrence.predicate.ConjunctionPredicate;
import org.gbif.api.model.occurrence.predicate.DisjunctionPredicate;
import org.gbif.api.model.occurrence.predicate.EqualsPredicate;
import org.gbif.api.model.occurrence.predicate.GreaterThanOrEqualsPredicate;
import org.gbif.api.model.occurrence.predicate.GreaterThanPredicate;
import org.gbif.api.model.occurrence.predicate.InPredicate;
import org.gbif.api.model.occurrence.predicate.LessThanOrEqualsPredicate;
import org.gbif.api.model.occurrence.predicate.LessThanPredicate;
import org.gbif.api.model.occurrence.predicate.LikePredicate;
import org.gbif.api.model.occurrence.predicate.NotPredicate;
import org.gbif.api.model.occurrence.predicate.Predicate;
import org.gbif.api.model.occurrence.predicate.SimplePredicate;
import org.gbif.api.model.occurrence.predicate.WithinPredicate;
import org.gbif.api.model.occurrence.search.OccurrenceSearchParameter;
import org.gbif.api.service.checklistbank.NameUsageService;
import org.gbif.api.service.registry.DatasetService;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * This class builds a human readable filter from a {@link org.gbif.api.model.occurrence.predicate.Predicate} hierarchy.
 * This class is not thread safe, create a new instance for every use if concurrent calls to {#humanFilter} is expected.
 * The IN predicate is not yet supported and you'll get an IllegalArgumentException.
 *
 * This builder only supports predicates that follow our search query parameters style with multiple values for the same
 * parameter being logically disjunct (OR) while different search parameters are logically combined (AND). Therefore
 * the {#humanFilter(Predicate p)} result is a map of OccurrenceSearchParameter (AND'ed) to a list of values (OR'ed).
 */
public class HumanFilterBuilder {

  private static final Logger LOG = LoggerFactory.getLogger(HumanFilterBuilder.class);
  private static final String EQUALS_OPERATOR = "";
  private static final String GREATER_THAN_OPERATOR = " > ";
  private static final String GREATER_THAN_EQUALS_OPERATOR = " >= ";
  private static final String LESS_THAN_OPERATOR = " < ";
  private static final String LESS_THAN_EQUALS_OPERATOR = " <= ";
  private static final String LIKE_OPERATOR = " LIKE ";
  private static final String IN_OPERATOR = " IN ";
  private static final String WITHIN_OPERATOR = " WITHIN ";
  private static final String BETWEEN_OPERATOR = " BETWEEN ";

  private Map<OccurrenceSearchParameter, LinkedList<String>> filter;
  private enum State { ROOT, AND, OR };
  private State state;
  private OccurrenceSearchParameter lastParam;
  private boolean lookupValues = true;
  private Joiner VALUE_JOINER = Joiner.on(", ").skipNulls();
  private final DatasetService datasetService;
  private final NameUsageService nameUsageService;

  public HumanFilterBuilder(DatasetService datasetService, NameUsageService nameUsageService) {
    this.datasetService = datasetService;
    this.nameUsageService = nameUsageService;
  }

  /**
   * @param p the predicate to convert
   * @return a list of anded parameters with multiple values to be combined with OR
   * @throws IllegalStateException if more complex predicates than the portal handles are supplied
   */
  public Map<OccurrenceSearchParameter, LinkedList<String>> humanFilter(Predicate p) {
    return filter(p, true);
  }

  public String queryFilter(Predicate p) {
    StringBuilder b = new StringBuilder();
    Map<OccurrenceSearchParameter, LinkedList<String>> filter = filter(p, false);
    for (OccurrenceSearchParameter param : filter.keySet()) {
      for (String val : filter.get(param)) {
        b.append(param.name());
        b.append("=");
        b.append(URLEncoder.encode(val));
        b.append("&");
      }
    }
    return b.toString();
  }

  private Map<OccurrenceSearchParameter, LinkedList<String>> filter(Predicate p, boolean lookupValues) {
    this.lookupValues = lookupValues;
    filter = Maps.newHashMap();
    state = State.ROOT;
    lastParam = null;
    visit(p);
    return filter;
  }

  private void visit(ConjunctionPredicate and) throws IllegalStateException {
    // ranges are allowed underneath root - try first
    try {
      visitRange(and);
      return;
    } catch (IllegalArgumentException e) {
      // must be a root AND
    }

    if (state != State.ROOT) {
      throw new IllegalStateException("AND must be a root predicate or a valid range");
    }
    state = State.AND;

    for (Predicate p : and.getPredicates()) {
      lastParam = null;
      visit(p);
    }
    state = State.ROOT;
  }

  private void visitRange(ConjunctionPredicate and){
    if (and.getPredicates().size() != 2){
      throw new IllegalArgumentException("no valid range");
    }
    GreaterThanOrEqualsPredicate lower = null;
    LessThanOrEqualsPredicate upper = null;
    for (Predicate p : and.getPredicates()) {
      if (p instanceof GreaterThanOrEqualsPredicate) {
        lower = (GreaterThanOrEqualsPredicate) p;
      } else if (p instanceof LessThanOrEqualsPredicate) {
        upper = (LessThanOrEqualsPredicate) p;
      }
    }
    if (lower == null || upper == null || lower.getKey() != upper.getKey()) {
      throw new IllegalArgumentException("no valid range");
    }
    addParamValues(lower.getKey(), BETWEEN_OPERATOR, Lists.newArrayList(lower.getValue(), upper.getValue()));
  }

  private void visit(DisjunctionPredicate or) throws IllegalStateException {
    State oldState = state;
    if (state == State.OR) {
      throw new IllegalStateException("OR within OR filters not supported");
    }
    state = State.OR;

    for (Predicate p : or.getPredicates()) {
      visit(p);
    }
    state = oldState;
  }

  private void visit(EqualsPredicate predicate) {
    visitSimplePredicate(predicate, EQUALS_OPERATOR);
  }

  private void visit(LikePredicate predicate) {
    visitSimplePredicate(predicate, LIKE_OPERATOR);
  }

  private void visit(GreaterThanPredicate predicate) {
    visitSimplePredicate(predicate, GREATER_THAN_OPERATOR);
  }

  private void visit(GreaterThanOrEqualsPredicate predicate) {
    visitSimplePredicate(predicate, GREATER_THAN_EQUALS_OPERATOR);
  }

  private void visit(LessThanPredicate predicate) {
    visitSimplePredicate(predicate, LESS_THAN_OPERATOR);
  }

  private void visit(LessThanOrEqualsPredicate predicate) {
    visitSimplePredicate(predicate, LESS_THAN_EQUALS_OPERATOR);
  }

  private void visit(WithinPredicate within) {
    addParamValues(OccurrenceSearchParameter.GEOMETRY, WITHIN_OPERATOR, Lists.newArrayList(within.getGeometry()));
  }

  private void visit(InPredicate in) {
    addParamValues(in.getKey(), IN_OPERATOR, in.getValues());
  }

  private void visit(NotPredicate not) throws IllegalStateException {
    if (not.getPredicate() instanceof SimplePredicate) {
      visit(not.getPredicate());
      SimplePredicate sp = (SimplePredicate) not.getPredicate();
      // now prefix the last value with NOT
      String notValue = "NOT (" + filter.get(sp.getKey()).removeLast() + ")";
      filter.get(sp.getKey()).add(notValue);

    } else {
      throw new IllegalArgumentException("NOT predicate must be followed by a simple predicate");
    }
  }

  private void visitSimplePredicate(SimplePredicate predicate, String op) {
    // verify that last param if existed was the same
    if (lastParam != null && predicate.getKey() != lastParam) {
      throw new IllegalArgumentException("Mix of search params not supported");
    }
    addParamValues(predicate.getKey(), op, Lists.newArrayList(predicate.getValue()));
  }

  private void addParamValues(OccurrenceSearchParameter param, String op, Collection<String> values) {
    if (!filter.containsKey(param)) {
      filter.put(param, Lists.<String>newLinkedList());
    }

    List<String> humanValues = Lists.newArrayList();
    for (String val : values) {
      // lookup values
      if (lookupValues) {
        switch (param) {
          case TAXON_KEY:
            humanValues.add(lookupTaxonKey(val));
            break;
          case DATASET_KEY:
            humanValues.add(lookupDatasetKey(val));
            break;
          default:
            humanValues.add(val);
        }
      } else {
        humanValues.add(val);
      }
    }
    filter.get(param).add(op + VALUE_JOINER.join(humanValues));
    lastParam = param;
  }

  private String lookupTaxonKey(String value) {
    try {
      return nameUsageService.get(Integer.parseInt(value), null).getScientificName();
    } catch (Exception e) {
      LOG.warn("Cannot get name for usage {}", value);
    }
    return value;
  }

  private String lookupDatasetKey(String value) {
    try {
      return datasetService.get(UUID.fromString(value)).getTitle();
    } catch (Exception e) {
      LOG.warn("Cannot get title for dataset {}", value);
    }
    return value;
  }

  private void visit(Predicate p) throws IllegalStateException {
    Method method = null;
    try {
      method = getClass().getDeclaredMethod("visit", new Class[] {p.getClass()});
    } catch (NoSuchMethodException e) {
      LOG.warn(
        "Visit method could not be found. That means a Predicate has been passed in that is unknown to this " + "class",
        e);
      throw new IllegalArgumentException("Unknown Predicate", e);
    }
    try {
      method.setAccessible(true);
      method.invoke(this, p);
    } catch (IllegalAccessException e) {
      LOG.error("This should never happen as we set accessible to true explicitly before. Probably a programming error", e);
      throw new RuntimeException("Programming error", e);
    } catch (InvocationTargetException e) {
      LOG.info("Exception thrown while building the Hive Download", e);
      throw new IllegalArgumentException(e);
    }
  }

}
