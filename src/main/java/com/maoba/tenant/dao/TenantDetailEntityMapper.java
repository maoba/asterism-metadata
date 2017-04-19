package com.maoba.tenant.dao;

import com.maoba.tenant.domain.TenantDetailEntity;

public interface TenantDetailEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TenantDetailEntity record);

    int insertSelective(TenantDetailEntity record);

    TenantDetailEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TenantDetailEntity record);

    int updateByPrimaryKeyWithBLOBs(TenantDetailEntity record);

    int updateByPrimaryKey(TenantDetailEntity record);
}