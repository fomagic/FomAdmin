package com.fomagic.module.sys.dao;


import java.util.List;

import com.fomagic.common.dao.BaseDao;
import com.fomagic.module.sys.entity.SysMenu;


public interface SysMenuDao extends BaseDao<SysMenu> {
	

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
	

}
