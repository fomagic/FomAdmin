package com.fomagic.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前端视图控制器
 * 
 * @author FOM
 *
 */

@Controller
public class PageController {
	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("")
	public String indexi(){
		return "redirect:/index";
	}
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	/**
	 * 404页面
	 * @return
	 */
	@RequestMapping("/404")
	public String error404() {    
		return "404";
	}
	
	/**
	 * 405页面
	 * @return
	 */
	@RequestMapping("/405")
	public String error405() {
		return "405";
	}
	
	/** 
	 * 500页面
	 * @return
	 */
	@RequestMapping("/500")
	public String error500() {
		return "500";
	}

}
