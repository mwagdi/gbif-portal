package org.gbif.portal.action.occurrence;

import org.gbif.occurrencestore.api.model.Occurrence;
import org.gbif.occurrencestore.ws.client.OccurrenceWsClient;
import org.gbif.portal.action.BaseAction;


import com.google.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SearchAction extends BaseAction {

  private static final Logger LOG = LoggerFactory.getLogger(SearchAction.class);

  // search
  private String q;

  @Inject
  private OccurrenceWsClient occurrenceClient;

  @Override
  public String execute() {
    // testing new ws integration
    LOG.debug("Trying fake occurrence search for q [{}]", q);
    // TODO this call is wrong, proper API call not available yet
    Occurrence occ = occurrenceClient.get(1);
    LOG.debug("Got occurrence with id [{}]", occ == null ? null : occ.getId());

    return SUCCESS;
  }

  public String getQ() {
    return q;
  }

  public void setQ(String q) {
    this.q = q;
  }
}
