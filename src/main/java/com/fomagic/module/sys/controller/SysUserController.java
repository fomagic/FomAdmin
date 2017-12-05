package com.fomagic.module.sys.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.fomagic.common.controller.BaseController;
import com.fomagic.module.sys.entity.SysUser;
import com.fomagic.module.sys.service.SysUserService;


/**
 * 系统用户
 * 
 * @author FOM
 *
 */
@Controller
@RequestMapping("/sys/user")
public class SysUserController extends BaseController {

	
	@Autowired
	private SysUserService sysUserService;
	
	
	/**
	 * 登录
	 * @return
	 */
	@RequestMapping({"","/","/index"})
	public String login(){
		
		
		return "sys/user";
	}

	
	@RequestMapping("/password")
	public String password(String password, String newPassword,RedirectAttributesModelMap modelMap){
		SysUser sysUser = (SysUser) SecurityUtils.getSubject().getPrincipal();
		//原密码
		password = new SimpleHash("MD5", password, sysUser.getUserName(),1024).toString();
		//新密码
		newPassword = new SimpleHash("MD5", newPassword, sysUser.getUserName(),1024).toString();
		//更新密码
		int count = sysUserService.updatePassword(sysUser.getUserId(), password, newPassword);
	    modelMap.addFlashAttribute("errMsg", count == 0?"原密码不正确，请重新登陆":"修改成功，请重新登陆");
	    SecurityUtils.getSubject().logout();
		return redirect("/sys/login");
	}

}