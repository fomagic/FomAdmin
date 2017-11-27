package com.fomagic.module.sys.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fomagic.module.sys.dao.SysUserDao;
import com.fomagic.module.sys.entity.SysUser;
import com.fomagic.module.sys.service.SysUserService;

@Service
public class SysUserServiceImpl implements SysUserService {

	@Autowired
	private SysUserDao sysUserDao;

	@Override
	public SysUser getByUserName(String userName) {
		return sysUserDao.getByUserName(userName);
	}

	@Override
	public int updatePassword(Long userId, String password, String newPassword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("password", password);
		map.put("newPassword", newPassword);
		return sysUserDao.updatePassword(map);
	}

	@Override
	public List<String> listAllperms(Long userId) {
		return sysUserDao.listAllperms(userId);
	}

	@Override
	public List<Long> listAllMenuId(Long userId) {
		return sysUserDao.listAllMenuId(userId);
	}

	
	
	//---
	
	@Override
	public void saveUser(SysUser sysUser) {
		sysUserDao.saveUser(sysUser);
	}

	@Override
	public void deleteBatchByUserIds(Long[] userIds) {
		sysUserDao.deleteBatchByUserIds(userIds);
	}

	@Override
	public void updateUser(SysUser sysUser) {
		sysUserDao.updateUser(sysUser);
	}

	@Override
	public SysUser getByUserId(Long userId) {
		return sysUserDao.getByUserId(userId);
	}

	@Override
	public List<SysUser> listUser(Map<String, Object> map) {
		return sysUserDao.listUser(map);
	}

	@Override
	public int countUser(Map<String, Object> map) {
		return sysUserDao.countUser(map);
	}

}
