package com.fomagic.module.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fomagic.common.controller.BaseController;

/**
 * 系统页面
 * @author FOM
 *
 */
@Controller
public class SysPageController extends BaseController  {
	
	@RequestMapping("modules/{module}/{url}")
	public String module(@PathVariable("module") String module, @PathVariable("url") String url){
		return "modules/" + module + "/" + url;
	}

	@RequestMapping("{url}")
	public String url(@PathVariable("url") String url){
		return url;
	}

	@RequestMapping("/")
	public String index(){
		return "index";
	}
}
