package com.maoba.tenant.dao;

import com.maoba.tenant.domain.TenantTeacherClassEntity;

public interface TenantTeacherClassEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TenantTeacherClassEntity record);

    int insertSelective(TenantTeacherClassEntity record);

    TenantTeacherClassEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TenantTeacherClassEntity record);

    int updateByPrimaryKey(TenantTeacherClassEntity record);
}