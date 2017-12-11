package com.fomagic.module.sys.dao;

import java.util.List;
import java.util.Map;

public interface SysRoleMenuDao {

	
	
	
	/**
	 * 根据角色ID，获取菜单ID列表
	 * @param roleId
	 * @return
	 */
	List<Long> listRoleMenuId(Long roleId);
	
	
	/**
	 * 删除角色菜单关系
	 * @param roleId
	 * @return
	 */
	int deleteRoleMenu(Long roleId);


	/**
	 * 保存
	 * @param roleId
	 * @param menuIdList
	 */
	void saveRoleMenu(Map<String, Object> map);

}
