package com.maoba.tenant.dao;

import com.maoba.tenant.domain.TenantCourseEntity;

public interface TenantCourseEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TenantCourseEntity record);

    int insertSelective(TenantCourseEntity record);

    TenantCourseEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TenantCourseEntity record);

    int updateByPrimaryKey(TenantCourseEntity record);
}