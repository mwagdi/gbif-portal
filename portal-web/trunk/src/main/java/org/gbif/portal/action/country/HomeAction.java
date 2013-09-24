package org.gbif.portal.action.country;

import org.gbif.api.service.registry.NodeService;
import org.gbif.api.vocabulary.Continent;
import org.gbif.api.vocabulary.Country;
import org.gbif.portal.action.BaseAction;
import org.gbif.portal.config.ContinentCountryMap;

import java.util.List;
import java.util.Set;

import com.google.common.collect.Sets;
import com.google.inject.Inject;

public class HomeAction extends BaseAction {

  private Set<Country> activeNodes;
  @Inject
  private NodeService nodeService;
  @Inject
  private ContinentCountryMap continentMap;

  @Override
  public String execute() throws Exception {
    activeNodes = Sets.newHashSet(nodeService.listActiveCountries());
    return SUCCESS;
  }

  public Set<Country> getActiveNodes() {
    return activeNodes;
  }

  public ContinentCountryMap getContinentMap() {
    return continentMap;
  }

  public List<Continent> getContinents() {
    return continentMap.alphabeticallyOrderedContinents();
  }
}
