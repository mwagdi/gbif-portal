package org.gbif.user.mybatis;

import org.gbif.api.model.vocabulary.UserRole;
import org.gbif.mybatis.type.BaseEnumTypeHandler;

public class UserRoleTypeHandler extends BaseEnumTypeHandler<Long, UserRole> {

  public UserRoleTypeHandler() {
    super(new UserRoleTypeConverter());
  }
}
