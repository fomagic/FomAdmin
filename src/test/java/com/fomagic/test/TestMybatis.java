package com.fomagic.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fomagic.module.sys.entity.User;
import com.fomagic.module.sys.service.UserService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-config.xml"})
public class TestMybatis {
	
	@Autowired
	private UserService userService;
	
	@Test
	public void test1(){
		User user = userService.getByUserName("magic");
		System.out.println("user: " + user);
	}

}
