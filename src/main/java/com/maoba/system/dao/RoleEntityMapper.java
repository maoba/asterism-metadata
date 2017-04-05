package com.maoba.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.maoba.system.domain.RoleEntity;

public interface RoleEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(RoleEntity record);

    int insertSelective(RoleEntity record);

    RoleEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(RoleEntity record);

    int updateByPrimaryKey(RoleEntity record);
    
	List<RoleEntity> queryRolesByName(@Param(value="name") String name,@Param(value="tenantId") Long tenantId);
}