package com.fomagic.module.sys.service.impl;

import java.util.List;

import com.fomagic.module.sys.dao.SysRoleMenuDao;
import com.fomagic.module.sys.service.SysRoleMenuService;

public class SysRoleMenuServiceImpl implements SysRoleMenuService {

	private SysRoleMenuDao sysRoleMenuDao;
	
	@Override
	public void saveRoleMenu(Long roleId, List<Long> menuIdList) {
		
		//先删除角色菜单关系
		sysRoleMenuDao.deleteRoleMenu(roleId);
		
		if (menuIdList.size()==0) {
			return;
		}
		
		sysRoleMenuDao.saveRoleMenu(roleId,menuIdList);
		
	}

	@Override
	public List<Long> listRoleMenuId(Long roleId) {
		return sysRoleMenuDao.listRoleMenuId(roleId);
	}

}
