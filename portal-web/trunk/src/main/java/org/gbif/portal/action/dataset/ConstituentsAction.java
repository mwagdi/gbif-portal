/*
 * Copyright 2011 Global Biodiversity Information Facility (GBIF) Licensed under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language governing permissions and limitations under the
 * License.
 */
package org.gbif.portal.action.dataset;

import org.gbif.api.model.registry.Dataset;
import org.gbif.api.paging.PagingRequest;
import org.gbif.api.paging.PagingResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ConstituentsAction extends DatasetBaseAction {

  private static final Logger LOG = LoggerFactory.getLogger(ConstituentsAction.class);

  private PagingResponse<Dataset> page;
  private long offset = 0;

  @Override
  public String execute() {
    loadDetail();

    // load constituents
    PagingRequest p = new PagingRequest(offset, 25);
    page = datasetService.listConstituents(key, p);

    return SUCCESS;
  }

  public void setOffset(long offset) {
    this.offset = offset;
  }

  public PagingResponse<Dataset> getPage() {
    return page;
  }

}
