package com.fomagic.module.sys.dao;


import java.util.List;
import java.util.Map;

import com.fomagic.common.dao.BaseDao;
import com.fomagic.module.sys.entity.SysUser;


public interface SysUserDao extends BaseDao<SysUser> {
	
	
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
	
	

}
