package org.gbif.portal.action.network;

import org.gbif.api.model.registry2.Network;
import org.gbif.api.service.registry2.NetworkService;
import org.gbif.portal.action.member.MemberBaseAction;
import org.gbif.portal.action.member.MemberType;

import com.google.inject.Inject;

public class DetailAction extends MemberBaseAction<Network> {

  private NetworkService networkService;

  @Inject
  public DetailAction(NetworkService networkService) {
    super(MemberType.NETWORK, networkService);
    this.networkService = networkService;
  }
}
