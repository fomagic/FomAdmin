package com.fomagic.module.sys.dao;


import java.util.List;
import java.util.Map;

import com.fomagic.module.sys.entity.SysMenu;


public interface SysMenuDao{
	

	/**
	 * 根据父菜单，查询子菜单
	 * @param parentId 父菜单ID
	 */
	List<SysMenu> listMenuIdByParentId(Long parentId);
	
	/**
	 * 获取不包含按钮的菜单列表
	 */
	List<SysMenu> listNotButton();
	
	/**
	 * 查询用户的权限列表
	 */
	List<SysMenu> listUserPerm(Long userId);

	/**
	 * 根据菜单ID获取菜单信息
	 * @param menuId
	 * @return
	 */
	SysMenu getByMenuId(Long menuId);

	/**
	 * 查询菜单列表
	 * @param map
	 * @return
	 */
	List<SysMenu> listMenu(Map<String, Object> map);

	/**
	 * 查询总数
	 * @param map
	 * @return
	 */
	int countMenu(Map<String, Object> map);

	/**
	 * 保存菜单
	 * @param menu
	 */
	void saveMenu(SysMenu menu);

	/**
	 * 更新菜单
	 * @param menu
	 */
	void updateMenu(SysMenu menu);

	/**
	 * 根据菜单ID删除菜单
	 * @param menuIds
	 */
	void deleteBatchByMenuIds(Long[] menuIds);
	

}
