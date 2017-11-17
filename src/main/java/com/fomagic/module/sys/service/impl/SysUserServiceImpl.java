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
	public void save(SysUser sysUser) {
		
		
	}

	@Override
	public void deleteBatch(Long[] userIds) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(SysUser sysUser) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public SysUser getByObject(Long userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SysUser> listObject(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
