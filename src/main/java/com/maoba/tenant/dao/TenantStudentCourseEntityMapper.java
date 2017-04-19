package com.maoba.tenant.dao;

import com.maoba.tenant.domain.TenantStudentCourseEntity;

public interface TenantStudentCourseEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TenantStudentCourseEntity record);

    int insertSelective(TenantStudentCourseEntity record);

    TenantStudentCourseEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TenantStudentCourseEntity record);

    int updateByPrimaryKey(TenantStudentCourseEntity record);
}