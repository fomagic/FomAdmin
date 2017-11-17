package com.fomagic.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fomagic.module.sys.entity.SysUser;
import com.fomagic.module.sys.service.SysUserService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-config.xml"})
public class TestMybatis {
	
	@Autowired
	private SysUserService sysUserService;
	
	@Test
	public void test1(){
		SysUser user = sysUserService.getByUserName("magic");
		System.out.println("user: " + user.getEmail());
	}

}
