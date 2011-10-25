/*
 * Copyright 2011 Global Biodiversity Information Facility (GBIF) Licensed under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language governing permissions and limitations under the
 * License.
 */
package org.gbif.portal.action.species;

import org.gbif.api.search.facets.Facet;
import org.gbif.api.search.model.SearchRequest;
import org.gbif.api.search.model.SearchResponse;
import org.gbif.checklistbank.api.model.NameUsage;
import org.gbif.checklistbank.api.model.search.ChecklistBankFacetParameter;
import org.gbif.checklistbank.api.service.NameUsageSearchService;
import org.gbif.portal.action.BaseAction;
import static org.gbif.api.paging.PagingConstants.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The action for all species search operations.
 */
public class SearchAction extends BaseAction {
  private static final Logger LOG = LoggerFactory.getLogger(SearchAction.class);

  private String q;
  private List<NameUsage> usages;

  private String[] chk_tile;

  private List<Facet.Count> checkListsFacetCounts;

  @Inject
  private NameUsageSearchService nameUsageSearchService;

  @Override
  public String execute() {
    LOG.info("Species search of [{}]", q);
    SearchRequest req = new SearchRequest(DEFAULT_PARAM_OFFSET, DEFAULT_PARAM_LIMIT);
    req.addFacets(ChecklistBankFacetParameter.CHECKLIST.getFieldName());
    Map<String, String> params = new HashMap<String, String>();
    params.put("q", q);//default query parameter
    if (chk_tile != null) {
      LOG.info("Checklist facet: {}", chk_tile.length);
      for (String chkFacet : chk_tile) {
        params.put("chk_tile", chkFacet);
      }
    }
    req.setParameters(params);
    SearchResponse<NameUsage> results = nameUsageSearchService.search(req);
    Long count = results.getCount();
    this.initializeFacets(results);
    this.usages = results.getResults(); //sets the results
    LOG.info("Species search of [{}] returned {} results", q, count);
    return SUCCESS;
  }

  private void initializeFacets(SearchResponse<NameUsage> results){
    if(results.getFacets() != null && !results.getFacets().isEmpty()){
      for(Facet facet : results.getFacets()){
        if(facet.getField().equals("chk_tile")){
          this.checkListsFacetCounts = facet.getCounts();
        }
      }
    }
  }

  public String getQ() {
    return q;
  }

  /**
   * @return the usages.
   */
  public List<NameUsage> getUsages() {
    return usages;
  }

  /**
   * Return the counts for facet chk_tile
   */
  public List<Facet.Count> getCheckListsFacetCounts() {
    return checkListsFacetCounts;
  }

  public void setQ(String q) {
    this.q = q;
  }

  public String[] getChk_tile() {
    return chk_tile;
  }

  public void setChk_tile(String[] chk_tile) {
    this.chk_tile = chk_tile;
  }
}
