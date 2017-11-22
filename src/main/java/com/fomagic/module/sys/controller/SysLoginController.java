package com.fomagic.module.sys.controller;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.fomagic.common.controller.BaseController;
import com.fomagic.module.sys.entity.SysUser;

/**
 * 登录视图控制器
 * 
 * @author FOM
 *
 */
@Controller
@RequestMapping("/sys")
public class SysLoginController extends BaseController {

	/**
	 * 登录页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(String username, String password,String captcha, boolean rememberMe,RedirectAttributesModelMap modelMap) {
		

		logger.info("login username ============ " +username);
		
		Subject curUser = SecurityUtils.getSubject();
		
		if (curUser.isRemembered()) {
			logger.info("rememberMe:" + "用户已经记住");
			return redirect("/sys/index");
		}
		
		UsernamePasswordToken passwordToken = new UsernamePasswordToken(username, password,rememberMe);

		logger.info("login username == " +username);
		
		try {
			curUser.login(passwordToken);
			modelMap.remove("errMsg");
			logger.info("登录成功:" + username);
			Session session = curUser.getSession();
			logger.info("sessionId:" + session.getId());
			logger.info("sessionHost:" + session.getHost());
			logger.info("sessionTimeout:" + session.getTimeout()); 

		} catch ( UnknownAccountException uae ) {
			//System.out.println(uae.getMessage());
			logger.info("账户不存在" + username);
			modelMap.addAttribute("errMsg", "账户/密码不匹配！");
		} catch (IncorrectCredentialsException ice) {
        	logger.info("密码不匹配！" + username);
        	modelMap.addAttribute("errMsg", "账户/密码不匹配！");
        } catch (LockedAccountException lae) {
        	logger.info("账户已被冻结！ " + username);
        	modelMap.addAttribute("errMsg", "账户已被冻结！");
        } catch(ExcessiveAttemptsException eae){
            logger.info("账户验证未通过,错误次数大于5次,账户已锁定");
            modelMap.addAttribute("errMsg", "账户验证未通过,错误次数大于5次,账户已锁定");
        }catch (DisabledAccountException sae){
            logger.info("账户验证未通过,帐号已经禁止登录");
            modelMap.addAttribute("errMsg", "账户验证未通过,帐号已经禁止登录");
        } catch (AuthenticationException ae) {
        	logger.info("登录失败:" + username);
        	modelMap.addAttribute("errMsg", "登录失败");
        }
		

		 SysUser sysUser = (SysUser) curUser.getPrincipal();
		 logger.info("登录成功: curUser.isAuthenticated : " + sysUser.getUserName());
		
		//验证是否登录成功
        if(curUser.isAuthenticated()){
			return redirect("/sys/index");
        }else{
        	passwordToken.clear();
        	modelMap.addAttribute("user", sysUser);
            return "login";
        }
		
		
	}
	
	/**
	 * 登录
	 * @return
	 */
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String login(Model model){
		
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
		return redirect("sys/login");
	}
	
	/**
	 * 后台首页
	 * 
	 * @return
	 */
	@RequestMapping(value = {"","/","/index"})
	public String sysIndex() {
		return "admin/index";
	}

}