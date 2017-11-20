package com.fomagic.module.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fomagic.module.sys.dao.SysRoleDao;
import com.fomagic.module.sys.entity.SysRole;
import com.fomagic.module.sys.service.SysRoleService;
import com.fomagic.module.sys.service.SysUserService;

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
	@Autowired
	private SysUserService sysUserService;
	
	
	
	@Override
	public List<Long> listRoleId(Long createUserId) {
		return sysRoleDao.listRoleId(createUserId);
	}
	@Override
	public SysRole getByObject(Long roleId) {
		return sysRoleDao.getByObject(roleId);
	}
	@Override
	public List<SysRole> listObject(Map<String, Object> map) {
		return null;
	}
	@Override
	public int countTotal(Map<String, Object> map) {
		return sysRoleDao.countTotal(map);
	}
	@Override
	public void save(SysRole role) {
		
	}
	@Override
	public void update(SysRole role) {
		
	}
	@Override
	public void deleteBatch(Long[] roleIds) {
		sysRoleDao.deleteBatch(roleIds);
	}
	

}
