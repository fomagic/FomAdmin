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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.fomagic.common.controller.BaseController;

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
	@RequestMapping(value = "/login")
	public String login(String username, String password,String captcha, boolean rememberMe,RedirectAttributesModelMap modelMap, HttpServletRequest request) {
		
		Subject curUser = SecurityUtils.getSubject();
		
		if (curUser.isRemembered()) {
			logger.info("rememberMe:" + "用户已经记住");
			return redirect("admin/index");
		}
		
		
		UsernamePasswordToken passwordToken = new UsernamePasswordToken(username, password,rememberMe);

		try {
			curUser.login(passwordToken);
			request.removeAttribute("errMsg");
			logger.info("登录成功:" + username);
			Session session = curUser.getSession();
			logger.info("sessionId:" + session.getId());
			logger.info("sessionHost:" + session.getHost());
			logger.info("sessionTimeout:" + session.getTimeout()); 

		} catch ( UnknownAccountException uae ) {
			//System.out.println(uae.getMessage());
			logger.info("账户不存在" + username);
			request.setAttribute("errMsg", "邮箱/密码不匹配！");
		} catch (IncorrectCredentialsException ice) {
        	logger.info("密码不匹配！" + username);
			request.setAttribute("errMsg", "邮箱/密码不匹配！");
        } catch (LockedAccountException lae) {
        	logger.info("账户已被冻结！ " + username);
			request.setAttribute("errMsg", "账户已被冻结！");
        } catch(ExcessiveAttemptsException eae){
            logger.info("账户验证未通过,错误次数大于5次,账户已锁定");
			request.setAttribute("errMsg", "账户验证未通过,错误次数大于5次,账户已锁定");
        }catch (DisabledAccountException sae){
            logger.info("账户验证未通过,帐号已经禁止登录");
			request.setAttribute("errMsg", "账户验证未通过,帐号已经禁止登录");
        } catch (AuthenticationException ae) {
        	logger.info("登录失败:" + username);
			request.setAttribute("errMsg", "登录失败");
        }
		
		//验证是否登录成功
        if(curUser.isAuthenticated()){
			return redirect("admin/index");
        }else{
        	passwordToken.clear();
            return "login";
        }
		
		
	}

	/**
	 * 退出
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public String logout(){
		SecurityUtils.getSubject().logout();
		return redirect("/login");
	}
	
	

}