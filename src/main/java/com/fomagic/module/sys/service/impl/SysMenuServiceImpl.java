package com.fomagic.module.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fomagic.module.sys.dao.SysMenuDao;
import com.fomagic.module.sys.entity.SysMenu;
import com.fomagic.module.sys.service.SysMenuService;



/**
 * 菜单
 * 
 * @author FOM
 *
 */
@Service
public class SysMenuServiceImpl implements SysMenuService {
	
	
	@Autowired
	private SysMenuDao sysMenuDao;

	@Override
	public List<SysMenu> listMenuIdByParentId(Long parentId, List<Long> menuIdList) {
		return null;
	}

	@Override
	public List<SysMenu> listMenuIdByParentId(Long parentId) {
		return sysMenuDao.listMenuIdByParentId(parentId);
	}

	@Override
	public List<SysMenu> listNotButton() {
		return sysMenuDao.listNotButton();
	}

	@Override
	public List<SysMenu> listUser(Long userId) {
		return sysMenuDao.listUser(userId);
	}

	@Override
	public List<SysMenu> listUserMenu(Long userId) {
		return null;
	}

	@Override
	public SysMenu getByMenuId(Long menuId) {
		return sysMenuDao.getByMenuId(menuId);
	}

	@Override
	public List<SysMenu> listMenu(Map<String, Object> map) {
		return sysMenuDao.listMenu(map);
	}

	@Override
	public int countMenu(Map<String, Object> map) {
		return sysMenuDao.countMenu(map);
	}

	@Override
	public void saveMenu(SysMenu menu) {
		sysMenuDao.saveMenu(menu);
	}

	@Override
	public void updateMenu(SysMenu menu) {
		sysMenuDao.updateMenu(menu);
	}

	@Override
	public void deleteBatchByMenuIds(Long[] menuIds) {
		sysMenuDao.deleteBatchByMenuIds(menuIds);
	}
}
