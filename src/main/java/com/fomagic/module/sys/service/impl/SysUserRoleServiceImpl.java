package com.fomagic.module.sys.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fomagic.module.sys.dao.SysUserRoleDao;
import com.fomagic.module.sys.service.SysUserRoleService;

@Service
public class SysUserRoleServiceImpl implements SysUserRoleService {

	@Autowired
	private SysUserRoleDao sysUserRoleDao;

	@Override
	public void saveUserRole(Long userId, List<Long> roleIdList) {

		if (roleIdList.size() == 0) {
			return;
		}
		// 先删除用户与角色对应关系
		sysUserRoleDao.deleteUserRole(userId);

		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("roleIdList", roleIdList);
		sysUserRoleDao.saveUserRole(userId, roleIdList);
	}

	@Override
	public List<Long> listUserRoleId(Long userId) {
		return sysUserRoleDao.listUserRoleId(userId);
	}

}
