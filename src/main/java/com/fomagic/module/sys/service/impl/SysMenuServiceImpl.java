package com.fomagic.module.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fomagic.module.sys.dao.SysMenuDao;
import com.fomagic.module.sys.entity.SysMenu;
import com.fomagic.module.sys.service.SysMenuService;
import com.fomagic.module.sys.service.SysUserService;



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
	@Autowired
	private SysUserService sysUserService;

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
	public SysMenu getByObject(Long menuId) {
		return sysMenuDao.getByObject(menuId);
	}

	@Override
	public List<SysMenu> listObject(Map<String, Object> map) {
		return sysMenuDao.listObject(map);
	}

	@Override
	public int countTotal(Map<String, Object> map) {
		return sysMenuDao.countTotal(map);
	}

	@Override
	public void save(SysMenu menu) {
		sysMenuDao.save(menu);
	}

	@Override
	public void update(SysMenu menu) {
		sysMenuDao.update(menu);
	}

	@Override
	public void deleteBatch(Long[] menuIds) {
		sysMenuDao.deleteBatch(menuIds);
	}

	
	

}
