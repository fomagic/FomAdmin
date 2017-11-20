package com.fomagic.module.sys.service;

import java.util.List;
import java.util.Map;

import com.fomagic.module.sys.entity.SysMenu;

/**
 * 菜单
 * 
 * @author FOM
 *
 */
public interface SysMenuService {

	/**
	 * 根据父菜单，查询子菜单
	 * @param parentId 父菜单ID
	 * @param menuIdList  用户菜单ID
	 */
	List<SysMenu> listMenuIdByParentId(Long parentId, List<Long> menuIdList);

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
	List<SysMenu> listUser(Long userId);
	
	/**
	 * 获取用户菜单列表
	 */
	List<SysMenu> listUserMenu(Long userId);
	
	/**
	 * 查询菜单
	 */
	SysMenu getByObject(Long menuId);
	
	/**
	 * 查询菜单列表
	 */
	List<SysMenu> listObject(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int countTotal(Map<String, Object> map);
	
	/**
	 * 保存菜单
	 */
	void save(SysMenu menu);
	
	/**
	 * 修改
	 */
	void update(SysMenu menu);
	
	/**
	 * 删除
	 */
	void deleteBatch(Long[] menuIds);
	

	
	
}
