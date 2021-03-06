package com.maoba.system.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.maoba.system.domain.UserEntity;

public interface UserMapper {
    int deleteByPrimaryKey(Long id);
    
    int insert(UserEntity record);

    int insertSelective(UserEntity record);

    UserEntity selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserEntity record);

    int updateByPrimaryKey(UserEntity record);

	UserEntity findByName(@Param(value="name") String name);

	UserEntity queryUserById(@Param(value="id") long userId);

	UserEntity queryUserByEmail(@Param(value="email") String email, @Param(value="terminalType") Integer terminalType);
	
	UserEntity queryUserByCellPhone(@Param(value="cellPhoneNum") String cellPhoneNum, @Param(value="terminalType") Integer terminalType);

	List<UserEntity> queryUsersByName(@Param(value="name") String name,@Param(value="status") Integer status,@Param(value="tenantId") Long tenantId);
}