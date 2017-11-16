package com.fomagic.module.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fomagic.common.controller.BaseController;

/**
 * 登录、管理视图控制器
 * 
 * @author FOM
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {

	/**
	 * 后台首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String getIndex() {
		return "admin/index";
	}

	/**
	 * 后台首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index", method = RequestMethod.POST)
	public String postIndex() {
		return redirect("/admin/index");
	}
}
