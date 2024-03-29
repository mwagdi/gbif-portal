package org.gbif.user.mybatis;

import org.gbif.api.model.vocabulary.UserRole;
import org.gbif.mybatis.type.BaseConverter;

import com.google.common.collect.ImmutableMap;

public class UserRoleTypeConverter extends BaseConverter<Long, UserRole> {

  /**
   * @throws IllegalArgumentException if two keys have the same value
   */
  public UserRoleTypeConverter() {
    super(null, new ImmutableMap.Builder<Long, UserRole>()
    .put(2l, UserRole.USER)
    .put(3l, UserRole.ADMIN)
    .put(4l, UserRole.EDITOR)
    .build());
  };
}
