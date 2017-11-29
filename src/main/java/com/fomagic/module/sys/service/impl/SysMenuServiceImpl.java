package com.fomagic.module.sys.service.impl;

import java.util.ArrayList;
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
		
		List<SysMenu> menuList = listMenuIdByParentId(parentId);
		if (menuIdList == null) {
			return menuList;
		}
		List<SysMenu> userMenuList = new ArrayList<>();
		for (SysMenu sysMenu : menuList) {
			if (menuIdList.contains(sysMenu.getMenuId())) {
				userMenuList.add(sysMenu);
			}
		}
		
		return userMenuList;
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
	public List<SysMenu> listUserPerm(Long userId) {
		return sysMenuDao.listUserPerm(userId);
	}

	@Override
	public List<SysMenu> listUserMenu(Long userId) {
		//系统管理员，最高全部权限
		if (userId == 1) {
			return getAllMenuList(null);
		}
		
		//用户菜单列表
		List<Long> menuIdList = sysUserService.listAllMenuId(userId);
		return getAllMenuList(menuIdList);
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
	
	
	//------
	
	private List<SysMenu> getAllMenuList(List<Long> menuIdList) {
		//查询根菜单列表
		List<SysMenu> menuList = listMenuIdByParentId(0L,menuIdList);
		
		//递归获取子菜单
		getMenuTreeList(menuList,menuIdList);
		
		return menuList;
	}

	private List<SysMenu> getMenuTreeList(List<SysMenu> menuList, List<Long> menuIdList) {
		List<SysMenu> subMenuList = new ArrayList<SysMenu>();
		
		for (SysMenu menu : menuList) {
			//目录
			if (menu.getType() == 0) {
				menu.setList(getMenuTreeList(listMenuIdByParentId(menu.getMenuId(),menuIdList), menuIdList));
			}
			subMenuList.add(menu);
		}
		return subMenuList;
	}
}
