/*
 * Copyright 2011 Global Biodiversity Information Facility (GBIF) Licensed under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language governing permissions and limitations under the
 * License.
 */
package org.gbif.portal.action.species;

import org.gbif.api.model.checklistbank.VernacularName;
import org.gbif.api.model.checklistbank.search.NameUsageSearchParameter;
import org.gbif.api.model.checklistbank.search.NameUsageSearchRequest;
import org.gbif.api.model.checklistbank.search.NameUsageSearchResult;
import org.gbif.api.service.checklistbank.NameUsageSearchService;
import org.gbif.api.service.checklistbank.NameUsageService;
import org.gbif.api.service.registry2.DatasetService;
import org.gbif.portal.action.BaseFacetedSearchAction;

import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import com.google.common.base.Function;
import com.google.common.base.Strings;
import com.google.inject.Inject;

import static org.gbif.api.model.Constants.NUB_TAXONOMY_KEY;

/**
 * The action for all species search operations.
 */
public class SearchAction 
  extends BaseFacetedSearchAction<NameUsageSearchResult, NameUsageSearchParameter, NameUsageSearchRequest> {

  private static final long serialVersionUID = -3736915206911951300L;

  // injected
  private final NameUsageService usageService;
  private final DatasetService checklistService;

  private Function<String, String> getChecklistTitle;
  private Function<String, String> getHigherTaxaTitle;
  private Function<String, String> getExtinctTitle;
  private Function<String, String> getHabitatTitle;
  private Function<String, String> getTaxStatusTitle;
  private Function<String, String> getRankTitle;
  private Function<String, String> getThreatStatusTitle;
  private Function<String, String> getNameTypeTitle;

  @Inject
  public SearchAction(NameUsageSearchService nameUsageSearchService, NameUsageService usageService, DatasetService checklistService) {
    super(nameUsageSearchService, NameUsageSearchParameter.class, new NameUsageSearchRequest());
    this.usageService = usageService;
    this.checklistService = checklistService;
    initGetTitleFunctions();
  }


  /**
   * Removes all vernacular names from the given list which are not highlighted, ie matching the query.
   * @param vernacularNames
   */
  private void filterVernacularMatches(List<VernacularName> vernacularNames, boolean removeAll) {
    Iterator<VernacularName> iter = vernacularNames.iterator();
    while (iter.hasNext()) {
      VernacularName vn = iter.next();
      if (removeAll || vn.getVernacularName() == null || !isHighlightedText(vn.getVernacularName())) {
        iter.remove();
      }
    }
  }

  @Override
  public String execute() {

    super.execute();

    // remove all common names not matching the query or all of them in case we have a highlighted canonical name
    for (NameUsageSearchResult u : searchResponse.getResults()) {
      filterVernacularMatches(u.getVernacularNames(), isHighlightedText(u.getCanonicalName()));
    }

    // replace higher taxon ids in facets with real names
    lookupFacetTitles(NameUsageSearchParameter.HIGHERTAXON_KEY, getHigherTaxaTitle);

    // replace checklist key with labels
    lookupFacetTitles(NameUsageSearchParameter.DATASET_KEY, getChecklistTitle);

    // replace taxonomic status keys with labels
    lookupFacetTitles(NameUsageSearchParameter.STATUS, getTaxStatusTitle);

    // replace rank keys with labels
    lookupFacetTitles(NameUsageSearchParameter.RANK, getRankTitle);

    // replace extinct boolean values
    lookupFacetTitles(NameUsageSearchParameter.EXTINCT, getExtinctTitle);

    // replace marine boolean values
    lookupFacetTitles(NameUsageSearchParameter.HABITAT, getHabitatTitle);

    // replace threat status keys values
    lookupFacetTitles(NameUsageSearchParameter.THREAT, getThreatStatusTitle);

    // replace threat status keys values
    lookupFacetTitles(NameUsageSearchParameter.NAME_TYPE, getNameTypeTitle);

    return SUCCESS;
  }

  /**
   * @return true if the checklist facet filter contains a single checklist only.
   */
  public boolean getShowAccordingTo() {
    return !searchRequest.getParameters().containsKey(NameUsageSearchParameter.DATASET_KEY)
      || searchRequest.getParameters().get(NameUsageSearchParameter.DATASET_KEY).size() != 1;
  }

  private String getBooleanTitle(String resourceEntry, String value) {
    if (Strings.isNullOrEmpty(value)) {
      return null;
    }
    if ("true".equalsIgnoreCase(value)) {
      return getText(resourceEntry).toLowerCase();
    }
    return getText("not") + " " + getText(resourceEntry).toLowerCase();
  }
  /**
   * Initializes the getTitle* functions: getChecklistTitle and getHigherTaxaTitle.
   * Because we need the non static resource bundle lookup method getText() these methods
   * unfortuantely cant be static ones and are created here instead for every action.
   */
  private void initGetTitleFunctions() {
    getChecklistTitle = new Function<String, String>() {

      @Override
      public String apply(String name) {
        if (Strings.emptyToNull(name) == null) {
          return null;
        }
        return checklistService.get(UUID.fromString(name)).getTitle();
      }
    };

    getHigherTaxaTitle = new Function<String, String>() {

      @Override
      public String apply(String name) {
        if (Strings.emptyToNull(name) == null) {
          return null;
        }
        return usageService.get(Integer.valueOf(name), null).getCanonicalOrScientificName();
      }
    };

    getExtinctTitle = new Function<String, String>() {
      @Override
      public String apply(String name) {
        return getBooleanTitle("search.facet.EXTINCT", name);
      }
    };

    getHabitatTitle = new Function<String, String>() {
      @Override
      public String apply(String name) {
        return getBooleanTitle("search.facet.MARINE", name);
      }
    };

    getRankTitle = new Function<String, String>() {

      @Override
      public String apply(String name) {
        return getEnumTitle("rank", name);
      }
    };

    getTaxStatusTitle = new Function<String, String>() {

      @Override
      public String apply(String name) {
        return getEnumTitle("taxstatus", name);
      }
    };

    getThreatStatusTitle = new Function<String, String>() {

      @Override
      public String apply(String name) {
        return getEnumTitle("threatstatus", name);
      }
    };

    getNameTypeTitle = new Function<String, String>() {

      @Override
      public String apply(String name) {
        return getEnumTitle("nametype", name);
      }
    };
  }


  /**
   * Exposed to allow easy access in freemarker.
   */
  public UUID getNubDatasetKey() {
    return NUB_TAXONOMY_KEY;
  }

}
