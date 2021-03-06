package com.fomagic.module.sys.service;

import java.util.List;
import java.util.Map;

import com.fomagic.module.sys.entity.SysUser;

/**
 * 
 * @author FOM
 *
 */
public interface SysUserService {

	/**
	 * 根据用户名获取用户信息
	 * @param userName
	 * @return
	 */
	SysUser getByUserName(String userName);
	
	/**
	 * 修改密码
	 * @param userId       用户ID
	 * @param password     原密码
	 * @param newPassword  新密码
	 * @return
	 */
	int updatePassword(Long userId, String password, String newPassword);
	
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
	
	
	
	
	//----
	

	
	/**
	 * 保存用户
	 * @param sysUser
	 */
	void saveUser(SysUser sysUser);
	
	/**
	 * 删除用户
	 * @param userIds
	 */
	void deleteBatchByUserIds(Long[] userIds);
	
	/**
	 * 修改用户
	 * @param sysUser
	 */
	void updateUser(SysUser sysUser);
	
	/**
	 * 根据用户ID查询用户
	 * @param userId
	 * @return
	 */
	SysUser getByUserId(Long userId);
	
	/**
	 * 查询用户列表
	 * @param map
	 * @return
	 */
	List<SysUser> listUser(Map<String, Object> map);
	
	/**
	 * 查询总数
	 * @param map
	 * @return
	 */
	int countUser(Map<String, Object> map);
	
}
