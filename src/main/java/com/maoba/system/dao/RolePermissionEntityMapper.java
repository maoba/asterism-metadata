package com.maoba.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.maoba.system.domain.RolePermissionEntity;

public interface RolePermissionEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(RolePermissionEntity record);

    int insertSelective(RolePermissionEntity record);

    RolePermissionEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(RolePermissionEntity record);

    int updateByPrimaryKey(RolePermissionEntity record);

	List<RolePermissionEntity> queryRolePermissionByRoleId(@Param(value="roleId") Long roleId);

	void deleteByRoleId(@Param(value="roleId") Long roleId);
  
	void deleteByPermissionId(@Param(value="permissionId")Long permissionId);
}