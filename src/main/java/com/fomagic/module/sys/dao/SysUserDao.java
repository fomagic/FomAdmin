package com.fomagic.module.sys.dao;


import java.util.List;
import java.util.Map;

import com.fomagic.module.sys.entity.SysUser;


public interface SysUserDao {
	
	
	/**
	 * 根据用户名获取用户信息
	 * @param userName
	 * @return
	 */
	SysUser getByUserName(String userName);
	
	/**
	 * 修改密码
	 * @param map
	 * @return
	 */
	int updatePassword(Map<String, Object> map);
	
	/**
	 * 查询用户所有的权限
	 * @param userId
	 * @return
	 */
	List<String> listAllperms(Long userId);

	/**
	 * 查询用户的所有菜单ID
	 * @param userId
	 * @return
	 */
	List<Long> listAllMenuId(Long userId);

	
	/**
	 * 保存用户
	 * @param sysUser
	 */
	void saveUser(SysUser sysUser);

	/**
	 * 批量删除用户
	 * @param userIds
	 */
	void deleteBatchByUserIds(Long[] userIds);

	/**
	 * 更新用户信息
	 * @param sysUser
	 */
	void updateUser(SysUser sysUser);

	/**
	 * 根据用户ID获取用户信息
	 * @param userId
	 * @return
	 */
	SysUser getByUserId(Long userId);

	/**
	 * 获取用户列表
	 * @param map
	 * @return
	 */
	List<SysUser> listUser(Map<String, Object> map);

	/**
	 * 获取总用户数
	 * @param map
	 * @return
	 */
	int countUser(Map<String, Object> map);
	
	

}
