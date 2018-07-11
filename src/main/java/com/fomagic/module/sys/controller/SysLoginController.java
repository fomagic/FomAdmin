package com.fomagic.module.sys.controller;


import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fomagic.common.controller.BaseController;
import com.fomagic.common.util.Result;
import com.fomagic.module.sys.entity.SysMenu;
import com.fomagic.module.sys.service.SysMenuService;

/**
 * 登录视图控制器
 * 
 * @author FOM
 *
 */
@Controller
@RequestMapping("/sys")
public class SysLoginController extends BaseController {
	
	

	@Autowired
	SysMenuService sysMenuService;
	
	/**
	 * 登录页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> login(String userName, String password,String captcha, boolean rememberMe) {
		
		Subject curUser = SecurityUtils.getSubject();
		

		logger.info("----userName = " + userName);
		logger.info("----password = " + password);
		logger.info("----captcha = " + captcha); 
		logger.info("----rememberMe = " + rememberMe);
		
		
		if (curUser.isRemembered()) {
			logger.info("rememberMe:" + "用户已经记住");
			return Result.success();
		}
		
		UsernamePasswordToken passwordToken = new UsernamePasswordToken(userName, password,rememberMe);
		String errMsg = "";
		String logMsg = "";
		
		try {
			curUser.login(passwordToken);
			logMsg = "登录成功: ";
			Session session = curUser.getSession();
			logger.info("sessionId:" + session.getId());
			logger.info("sessionHost:" + session.getHost());
			logger.info("sessionTimeout:" + session.getTimeout()); 

		} catch ( UnknownAccountException uae ) {
			logMsg = "账户不存在";
			errMsg = "账户/密码不匹配！";
		} catch (IncorrectCredentialsException ice) {
			logMsg = "密码不匹配！";
			errMsg = "账户/密码不匹配！";
        } catch (LockedAccountException lae) {
        	logMsg = "账户已被冻结！ ";
        	errMsg = "账户已被冻结！";
        } catch(ExcessiveAttemptsException eae){
        	logMsg = "账户验证未通过,错误次数大于5次,账户已锁定";
        	errMsg = "账户验证未通过,错误次数大于5次,账户已锁定";
        }catch (DisabledAccountException sae){
        	logMsg = "账户验证未通过,帐号已经禁止登录";
        	errMsg = "账户验证未通过,帐号已经禁止登录";
        } catch (AuthenticationException ae) {
        	logMsg = "登录失败:" + userName;
        	errMsg = "登录失败";
        }
		
		logger.info(logMsg + userName);

		
		//验证是否登录成功
        if(curUser.isAuthenticated()){
        	return Result.success();
        }else{
        	passwordToken.clear();
        	return Result.error(errMsg);
        }
	}
	
	/**
	 * 登录
	 * @return
	 */
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String login(){
		
		Subject curUser = SecurityUtils.getSubject();
		if (curUser.isAuthenticated()||curUser.isRemembered()) {
			return redirect("/sys/index");
		}
		
		return "login";
	}

	/**
	 * 退出
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public String logout(){
		SecurityUtils.getSubject().logout();
        logger.info("退出账号");
		return redirect("/sys/login");
	}
	
	/**
	 * 后台首页
	 * 
	 * @return
	 */
	@RequestMapping(value = {"","/","/index"})
	public String sysIndex(ModelMap modelMap) {
		
		if (getSysUser() == null) {
			return "login";
		}
		
		List<SysMenu> menuList = null;
		menuList = sysMenuService.listUserMenu(getSysUserId());
		modelMap.addAttribute("menuList",menuList);
    	modelMap.addAttribute("sysUser",getSysUser());
		logger.info("跳转到后台首页");
		return "sys/index";
	}
	
	



}