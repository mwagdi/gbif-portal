package org.gbif.portal.action.country;

import org.gbif.api.model.metrics.cube.OccurrenceCube;
import org.gbif.api.model.metrics.cube.ReadBuilder;
import org.gbif.api.model.registry.Node;
import org.gbif.api.service.metrics.CubeService;
import org.gbif.api.service.registry.NodeService;
import org.gbif.api.vocabulary.Country;
import org.gbif.portal.exception.NotFoundException;

import com.google.inject.Inject;

public class CountryBaseAction extends org.gbif.portal.action.BaseAction {

  private String id;
  protected Country country;
  protected Node node;
  private long numAbout;
  private long numBy;

  @Inject
  protected NodeService nodeService;
  @Inject
  protected CubeService cubeService;

  @Override
  public String execute() throws Exception {
    country = Country.fromIsoCode(id);
    if (country == null) {
      throw new NotFoundException("No country found with ISO code" + id);
    }

    numAbout = cubeService.get(new ReadBuilder().at(OccurrenceCube.COUNTRY, country));
    numBy = -1;

    //TODO:  see if we have a node for this country
    //node = nodeService.getByCountry(country.getIso2LetterCode());

    return SUCCESS;
  }

  public String getId() {
    return country == null ? null : country.getIso2LetterCode();
  }

  public void setId(String id) {
    this.id = id;
  }

  public Node getNode() {
    return node;
  }

  public Country getCountry() {
    return country;
  }

  public long getNumAbout() {
    return numAbout;
  }

  public long getNumBy() {
    return numBy;
  }
}
