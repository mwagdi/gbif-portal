package org.gbif.portal.action.country;

import org.gbif.portal.action.BaseAction;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DetailAction extends BaseAction {

  private final static Logger LOG = LoggerFactory.getLogger(DetailAction.class);

  // detail
  private Integer id;

  @Override
  public String execute() {
    if (id != null) {
      LOG.debug("Getting detail for country id [{}]", id);
      /** TODO: implement country lookup */
      return SUCCESS;
    }
    return HTTP_NOT_FOUND;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getId() {
    return id;
  }
}
