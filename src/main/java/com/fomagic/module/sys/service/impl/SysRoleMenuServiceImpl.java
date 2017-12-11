package com.fomagic.module.sys.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fomagic.module.sys.dao.SysRoleMenuDao;
import com.fomagic.module.sys.service.SysRoleMenuService;

@Service
public class SysRoleMenuServiceImpl implements SysRoleMenuService {

	@Autowired
	private SysRoleMenuDao sysRoleMenuDao;
	
	@Override
	public void saveRoleMenu(Long roleId, List<Long> menuIdList) {
		
		//先删除角色菜单关系
		sysRoleMenuDao.deleteRoleMenu(roleId);
		
		if (menuIdList.size()==0) {
			return;
		}
		//保存角色菜单关系
		Map<String, Object> map = new HashMap<>();
		map.put("roleId", roleId);
		map.put("menuIdList", menuIdList);
		sysRoleMenuDao.saveRoleMenu(map);
	}

	@Override
	public List<Long> listRoleMenuId(Long roleId) {
		return sysRoleMenuDao.listRoleMenuId(roleId);
	}

}
