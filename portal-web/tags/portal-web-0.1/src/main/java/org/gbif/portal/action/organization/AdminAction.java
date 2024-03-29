package org.gbif.portal.action.organization;

import org.gbif.api.paging.PagingResponse;
import org.gbif.portal.action.AdminBaseAction;
import org.gbif.registry.api.model.Node;
import org.gbif.registry.api.model.Organization;
import org.gbif.registry.api.service.NodeService;
import org.gbif.registry.api.service.OrganizationService;

import java.util.List;
import java.util.UUID;

import javax.validation.Valid;

import com.google.inject.Inject;

public class AdminAction extends AdminBaseAction<OrganizationService, Organization> {

  @Inject
  NodeService nodeWsClient;

  @Valid
  Organization member;

  /**
   * @return the organization.
   */

  public Organization getMember() {
    if (id != null && member == null) {
      member = loadMember(id);
    }
    return member;
  }

  protected Organization loadMember(UUID id) {
    return wsClient.get(id);
  }

  /**
   * @param organization the organization to set.
   */
  public void setMember(Organization member) {
    this.member = member;
  }

  public List<Node> getNodes() {
    /*
     * new Node();
     * Node n1 = Node.builder().title("Node1").key(UUID.randomUUID()).build();
     * Node n2 = Node.builder().title("Node2").key(UUID.randomUUID()).build();
     * Node n3 = Node.builder().title("Node3").key(UUID.randomUUID()).build();
     * List<Node> nodeList = new ArrayList<Node>();
     * nodeList.add(n1);
     * nodeList.add(n2);
     * nodeList.add(n3);
     * PagingResponse<Node> response = new PagingResponse<Node>();
     * response.setResults(nodeList);
     */
    PagingResponse<Node> response = nodeWsClient.list(null);

    if (response != null) {
      return response.getResults();
    }
    return null;
  }

  public String editEntity() {
    // TODO: add logic required to edit the organization fields (calling WS client)
    return SUCCESS;
  }

  public String addEntity() {
    // first persist the WritableOrganization entity
    // UUID organisationKey = wsClient.create(member);
    // createMembers(organisationKey);
    return SUCCESS;
  }

  public Organization getSessionOrganization() {
    return (Organization) session.get("organization");
  }

  @Override
  public Organization getEntity() {
    // TODO: for some reason if I create an abstract method on AdminBaseAction called getMember and
    // its overriden in this action class, struts returns a null 'member' object when called from the FTLs.
    // need to check further on this.
    return getMember();
  }
}
