package com.fomagic.module.sys.service.impl;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fomagic.module.sys.dao.UserDao;
import com.fomagic.module.sys.entity.User;
import com.fomagic.module.sys.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public User getByUserName(String userName) {
		return userDao.getByUserName(userName);
	}

	@Override
	public Set<String> getRoles(String userName) {
		return userDao.getRoles(userName);
	}

	@Override
	public Set<String> getPermissions(String userName) {
		return userDao.getPermissions(userName);
	}

}
