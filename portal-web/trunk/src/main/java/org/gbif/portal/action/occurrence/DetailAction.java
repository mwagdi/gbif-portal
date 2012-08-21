package org.gbif.portal.action.occurrence;

import org.gbif.dwc.terms.DwcTerm;
import org.gbif.occurrencestore.api.model.VerbatimOccurrence;
import org.gbif.occurrencestore.api.service.VerbatimOccurrenceService;
import org.gbif.registry.api.model.Organization;
import org.gbif.registry.api.service.OrganizationService;

import java.util.Map;
import java.util.TreeMap;

import com.google.common.collect.Maps;
import com.google.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DetailAction extends OccurrenceBaseAction {

  private static final Logger LOG = LoggerFactory.getLogger(DetailAction.class);

  @Inject
  private OrganizationService organizationService;
  @Inject
  private VerbatimOccurrenceService verbatimService;

  private Organization publisher;
  private Map<String, Map<String, String>> verbatim;

  @Override
  public String execute() {
    loadDetail();
    // load publisher
    publisher = organizationService.get(dataset.getOwningOrganizationKey());

    return SUCCESS;
  }

  public String verbatim() {
    LOG.debug("Loading raw details for occurrence id [{}]", id);

    loadDetail();

    // prepare verbatim map
    VerbatimOccurrence v = verbatimService.getVerbatim(id);
    verbatim = Maps.newLinkedHashMap();
    for (String group : DwcTerm.GROUPS) {
      for (DwcTerm t : DwcTerm.listByGroup(group)) {
        if (v.getFields().containsKey(t.simpleName())) {
          if (!verbatim.containsKey(group)) {
            verbatim.put(group, new TreeMap<String, String>());
          }
          verbatim.get(group).put(t.simpleName(), v.getFields().get(t.simpleName()));
        }
      }
    }

    return SUCCESS;
  }

  public Organization getPublisher() {
    return publisher;
  }

  public Map<String, Map<String, String>> getVerbatim() {
    return verbatim;
  }

}
