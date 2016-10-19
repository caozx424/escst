package com.escst.hxgt.service.user;

import com.escst.hxgt.entity.user.UserEntity;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface UserService {
	
	UserEntity getUserById(int id);

	List<UserEntity> getUserAll();

	UserEntity findByUsername(String username);

	Set<String> findPermissions(String username);

	Set<String> findRoles(String username);


	public int queryCount(UserEntity userEntity);

	/**
	 * 分页查询
	 *
	 * */
	public List<UserEntity> queryByPage(UserEntity userEntity,Map<String,Object> map);

	/**
	 * 添加用户信息
	 * @param userEntity
	 */
	public void addUserByUserEntity(UserEntity userEntity);

	/**
	 * 更新用户信息
	 * @param userEntity
	 */
	public void updateUserByUserEntity(UserEntity userEntity);

	/**
	 * 删除用户信息
	 * @param id
	 */
	public void deleteUserById(int id);

}
