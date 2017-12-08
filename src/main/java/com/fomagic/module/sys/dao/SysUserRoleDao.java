package com.fomagic.module.sys.dao;

import java.util.List;
import java.util.Map;

public interface SysUserRoleDao {

	/**
	 * 根据用户ID保存更新关联角色
	 * @param userId
	 * @param roleIdList
	 */
	void saveUserRole(Map<String, Object> map);

	/**
	 * 根据用户ID获取角色列表
	 * @param userId
	 * @return
	 */
	List<Long> listUserRoleId(Long userId);
	
	/**
	 * 根据用户ID删除用户与角色对应关系
	 * @param userId
	 */
	void deleteUserRole(Long userId);

}
