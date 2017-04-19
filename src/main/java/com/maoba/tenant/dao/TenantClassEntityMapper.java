package com.maoba.tenant.dao;

import com.maoba.tenant.domain.TenantClassEntity;

public interface TenantClassEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TenantClassEntity record);

    int insertSelective(TenantClassEntity record);

    TenantClassEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TenantClassEntity record);

    int updateByPrimaryKey(TenantClassEntity record);
}