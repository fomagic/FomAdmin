package com.fomagic.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fomagic.module.sys.entity.SysMenu;
import com.fomagic.module.sys.entity.SysRole;
import com.fomagic.module.sys.entity.SysUser;
import com.fomagic.module.sys.service.SysMenuService;
import com.fomagic.module.sys.service.SysRoleService;
import com.fomagic.module.sys.service.SysUserService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-config.xml"})
public class TestMybatis {
	
	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private SysRoleService sysRoleService;
	
	@Autowired
	private SysMenuService sysMenuService;
	
	@Test
	public void testUser(){
		SysUser user = sysUserService.getByUserName("magic");
		System.out.println("user: " + user.getEmail());
	}
	
	@Test
	public void testRole(){
		SysRole role = sysRoleService.getByRoleId((long) 1);
		System.out.println("role: " + role.getRoleName());
	}
	
	@Test
	public void testMenu(){
		List<SysMenu> menus = sysMenuService.listMenuIdByParentId((long) 2);
		System.out.println("Menu: " + menus.get(1).getName());
	}
	
}
