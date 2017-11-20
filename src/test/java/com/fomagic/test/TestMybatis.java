package com.fomagic.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fomagic.module.sys.entity.SysRole;
import com.fomagic.module.sys.entity.SysUser;
import com.fomagic.module.sys.service.SysRoleService;
import com.fomagic.module.sys.service.SysUserService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-config.xml"})
public class TestMybatis {
	
	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private SysRoleService sysRoleService;
	
	@Test
	public void testUser(){
		SysUser user = sysUserService.getByUserName("magic");
		System.out.println("user: " + user.getEmail());
	}
	
	@Test
	public void testRole(){
		SysRole role = sysRoleService.getByObject((long) 1);
		System.out.println("role: " + role.getRoleName());
	}
	
}
