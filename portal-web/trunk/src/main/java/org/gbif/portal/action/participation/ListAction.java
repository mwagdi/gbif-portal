package org.gbif.portal.action.participation;

import org.gbif.api.model.common.paging.PagingRequest;
import org.gbif.api.model.common.paging.PagingResponse;
import org.gbif.api.model.registry.Node;
import org.gbif.api.service.registry.NodeService;
import org.gbif.api.vocabulary.NodeType;
import org.gbif.portal.action.BaseAction;

import java.util.List;
import javax.annotation.Nullable;

import com.google.common.base.Function;
import com.google.common.base.Predicate;
import com.google.common.collect.FluentIterable;
import com.google.common.collect.Ordering;
import com.google.inject.Inject;

/**
 * Landing page for non country nodes.
 */
public class ListAction extends BaseAction {

  private List<Node> voting;
  private List<Node> associate;
  private List<Node> other;

  @Inject
  private NodeService nodeService;

  @Override
  public String execute() throws Exception {
    PagingResponse<Node> resp = nodeService.list(new PagingRequest(0, 5));
    associate = resp.getResults();
    other = resp.getResults();
    voting = FluentIterable.from(resp.getResults())
      // filter out country nodes
      .filter(new Predicate<Node>() {
        @Override
        public boolean apply(@Nullable Node n) {
          return NodeType.COUNTRY != n.getType();
        }
      })

      // sort alphabetically
      .toSortedList(Ordering.natural().onResultOf(new Function<Node, String>() {
        @Nullable
        @Override
        public String apply(@Nullable Node n) {
          return n == null ? null : n.getTitle();
        }
      }));

    return SUCCESS;
  }

  public List<Node> getVoting() {
    return voting;
  }

  public List<Node> getAssociate() {
    return associate;
  }

  public List<Node> getOther() {
    return other;
  }
}