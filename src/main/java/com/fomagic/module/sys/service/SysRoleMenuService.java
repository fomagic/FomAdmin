package com.fomagic.module.sys.service;

import java.util.List;

/**
 * 角色与菜单的对应关系
 * 
 * @author 
 *
 */
public interface SysRoleMenuService {

	/**
	 * 保存角色与菜单的对应关系
	 * @param roleId
	 * @param menuList
	 */
	void saveRoleMenu(Long roleId,List<Long> menuIdList);
	
	/**
	 * 根据角色ID，获取菜单ID列表
	 * @param roleId
	 * @return
	 */
	List<Long> listRoleMenuId(Long roleId);
	

	
}
