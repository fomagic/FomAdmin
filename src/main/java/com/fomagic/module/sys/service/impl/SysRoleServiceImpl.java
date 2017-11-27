package com.fomagic.module.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fomagic.module.sys.dao.SysRoleDao;
import com.fomagic.module.sys.entity.SysRole;
import com.fomagic.module.sys.service.SysRoleService;

/**
 * 角色
 * 
 * @author FOM
 *
 */
@Service
public class SysRoleServiceImpl implements SysRoleService {

	@Autowired
	private SysRoleDao sysRoleDao;
	
	
	
	@Override
	public List<Long> listRoleId(Long createUserId) {
		return sysRoleDao.listRoleId(createUserId);
	}
	@Override
	public SysRole getByRoleId(Long roleId) {
		return sysRoleDao.getByRoleId(roleId);
	}
	@Override
	public List<SysRole> listRole(Map<String, Object> map) {
		return sysRoleDao.listRole(map);
	}
	@Override
	public int countRole(Map<String, Object> map) {
		return sysRoleDao.countRole(map);
	}
	@Override
	public void saveRole(SysRole role) {
		sysRoleDao.saveRole(role);
	}
	@Override
	public void updateRole(SysRole role) {
		sysRoleDao.updateRole(role);
	}
	@Override
	public void deleteBatchByRoleIds(Long[] roleIds) {
		sysRoleDao.deleteBatchByRoleIds(roleIds);
	}
	

}
