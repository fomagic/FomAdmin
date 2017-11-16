package com.fomagic.module.sys.dao;

import java.util.Set;


import com.fomagic.module.sys.entity.User;


public interface UserDao {
	
	
	/**
	 * 根据用户名获取用户信息
	 * @param userName
	 * @return
	 */
	public User getByUserName(String userName);
	
	
	/**
	 * 根据用户名获取角色信息
	 * @param userName
	 * @return
	 */
	public Set<String> getRoles(String userName);
	
	
	/**
	 *根据用户名获取权限信息
	 * @param userName
	 * @return
	 */
	public Set<String> getPermissions(String userName);

}
