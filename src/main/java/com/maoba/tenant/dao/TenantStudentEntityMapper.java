package com.maoba.tenant.dao;

import com.maoba.tenant.domain.TenantStudentEntity;

public interface TenantStudentEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TenantStudentEntity record);

    int insertSelective(TenantStudentEntity record);

    TenantStudentEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TenantStudentEntity record);

    int updateByPrimaryKey(TenantStudentEntity record);
}