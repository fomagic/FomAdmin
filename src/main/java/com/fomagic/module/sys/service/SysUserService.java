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
	void save(SysUser sysUser);
	
	/**
	 * 删除用户
	 * @param userIds
	 */
	void deleteBatch(Long[] userIds);
	
	/**
	 * 修改用户
	 * @param sysUser
	 */
	void update(SysUser sysUser);
	
	/**
	 * 根据用户ID查询用户
	 * @param userId
	 * @return
	 */
	SysUser getByObject(Long userId);
	
	/**
	 * 查询用户列表
	 * @param map
	 * @return
	 */
	List<SysUser> listObject(Map<String, Object> map);
	
	/**
	 * 查询总数
	 * @param map
	 * @return
	 */
	int countTotal(Map<String, Object> map);
	
}
