/*
 * Copyright 2011 Global Biodiversity Information Facility (GBIF)
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 */
package org.gbif.portal.action;

import org.gbif.api.model.common.paging.PagingRequest;
import org.gbif.api.model.common.paging.PagingResponse;
import org.gbif.api.model.common.search.SearchParameter;
import org.gbif.api.model.common.search.SearchRequest;
import org.gbif.api.model.common.search.SearchResponse;
import org.gbif.api.service.common.SearchService;
import org.gbif.api.util.VocabularyUtils;

import java.util.Map;

import com.google.common.base.Strings;
import org.apache.commons.lang3.StringUtils;


/**
 * Class that encapsulates the basic functionality of free text search and paginated navigation.
 * The class expects a {@link SearchRequest} at creation time and delegates the parsing of search parameters to the
 * concrete subclass that needs to implement
 * {@link #readFilterParams}.
 * 
 * @param <T> the content type of the results
 * @param <P> the search parameter enum
 * @param <R> the request type
 */
public abstract class BaseSearchAction<T, P extends Enum<?> & SearchParameter, R extends SearchRequest<P>>
  extends BaseAction {

  /**
   * Generated serialVersionUID
   */
  private static final long serialVersionUID = -3731894129684841108L;

  /**
   * Maximum # of characters shown in a highlighted field.
   */
  private static final int DEFAULT_HIGHLIGHT_TEXT_LENGTH = 110;
  public static final String HL_PRE = "<em class=\"gbifHl\">";
  public static final String HL_POST = "</em>";

  protected final Class<P> searchType;
  protected final SearchService<T, P, R> searchService;
  protected final R searchRequest;

  protected SearchResponse<T, P> searchResponse;
  protected String q;

  /**
   * Default constructor
   */
  public BaseSearchAction(SearchService<T, P, R> searchService, Class<P> searchType, R searchRequest) {
    this.searchService = searchService;
    this.searchType = searchType;
    this.searchRequest = searchRequest;
  }

  @Override
  public String execute() {
    LOG.info("Search for [{}]", getQ());
    // default query parameters
    searchRequest.setQ(getQ());
    // Turn off highlighting for empty query strings
    searchRequest.setHighlight(!Strings.isNullOrEmpty(q));
    // adds parameters processed by subclasses
    readFilterParams();
    // issues the search operation
    searchResponse = searchService.search(searchRequest);
    LOG.debug("Search for [{}] returned {} results", getQ(), searchResponse.getCount());
    return SUCCESS;
  }

  /**
   * Implement this method to parse the filter parameters from the request and populate the request parameters.
   * Make sure that empty parameters are set too to filter null values!
   */
  public void readFilterParams() {
    final Map<String, String[]> params = request.getParameterMap();

    for (String p : params.keySet()) {
      // recognize facets by enum name
      P param = getSearchParam(p);
      if (param != null) {
        // filter found
        for (String v : params.get(p)) {
          searchRequest.addParameter(param, translateFilterValue(param, v));
        }
      }
    }
  }

  /**
   * @param name
   * @return the search enum or null if it cant be converted
   */
  public P getSearchParam(String name) {
    try {
      return (P) VocabularyUtils.lookupEnum(name, searchType);
    } catch (Exception e) {
      return null;
    }
  }
  public P getSearchParam() {
    try {
      return (P) VocabularyUtils.lookupEnum("RANK", searchType);
    } catch (Exception e) {
      return null;
    }
  }
  /**
   * Optional hook for concrete search actions to define custom translations of filter values
   * before they are send to the search service.
   * For example to enable a simple checklist=nub filter without the need to know the real nub UUID.
   * The values will NOT be translated for the UI and request parameters, only for the search and title lookup service!
   * This method can be overriden to modify the returned value, by default it keeps it as it is.
   *
   * @param param the filter parameter the value belongs to
   * @param value the value to translate or return as is
   */
  protected String translateFilterValue(P param, String value) {
    // dont do anything by default
    return value;
  }

  /**
   * Checks if a parameter value is already selected in the current request filters.
   * Public method used by html templates.
   *
   * @param param the facet name according to
   */
  public boolean isInFilter(P param, String value) {
    if (param != null && searchRequest.getParameters().containsKey(param)) {
      for (String v : searchRequest.getParameters().get(param)) {
        if (v.equals(value)) {
          return true;
        }
      }
    }
    return false;
  }

  /**
   * Takes a highlighted text and trimmed it to show the first highlighted term.
   * The text is found using the HL_PRE and HL_POST tags.
   * Ensure that at least the whole term is shown or else MAX_LONG_HL_FIELD are displayed.
   * 
   * @param text highlighted text to be trimmed.
   * @return a trimmed version of the highlighted text
   */
  public static String getHighlightedText(String text) {
    return getHighlightedText(text, DEFAULT_HIGHLIGHT_TEXT_LENGTH);
  }

  public static String getHighlightedText(String text, final int maxLength) {
    final int firstHlBeginTag = text.indexOf(HL_PRE);
    final int firstHlEndTag = text.indexOf(HL_POST) + HL_POST.length();
    final int hlTextSize = firstHlEndTag - firstHlBeginTag;
    // highlighted text larger than max length - return it all to keep highlighting tags intact
    if (hlTextSize > maxLength) {
      return text.substring(firstHlBeginTag, firstHlEndTag);
    }
    // no highlighted text, return first bit
    if (firstHlBeginTag < 0 || firstHlEndTag < 0) {
      return StringUtils.abbreviate(text, 0, maxLength);
    }
    int sizeBefore = (maxLength - hlTextSize) / 3;
    int start = Math.max(0, firstHlBeginTag - sizeBefore);
    return StringUtils.abbreviate(text, start, maxLength);
  }

  /**
   * The input search pattern used to issue a search operation.
   * 
   * @return the q, input search pattern defaulting to "" if none is provided
   */
  public String getQ() {
    // To enable simple linking without a query as per http://dev.gbif.org/issues/browse/POR-274
    return (q == null) ? "" : q;
  }

  /**
   * Response (containing the list of results) of the request issued.
   * 
   * @return the searchResponse
   * @see PagingResponse
   */
  public SearchResponse<T, P> getSearchResponse() {
    return searchResponse;
  }

  public R getSearchRequest() {
    return searchRequest;
  }

  /**
   * @param offset the offset to set
   * @see PagingRequest#setOffset(long)
   */
  public void setOffset(long offset) {
    this.searchRequest.setOffset(offset);
  }

  /**
   * @param q the input search pattern to set
   */
  public void setQ(String q) {
    this.q = Strings.nullToEmpty(q).trim();
  }


}
