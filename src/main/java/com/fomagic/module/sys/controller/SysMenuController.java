package com.fomagic.module.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fomagic.common.controller.BaseController;
import com.fomagic.module.sys.entity.SysMenu;
import com.fomagic.module.sys.service.SysMenuService;

/**
 * 菜单
 * 
 * @author FOM
 *
 */
@Controller
@RequestMapping("/sys/menu")
public class SysMenuController extends BaseController {

	@Autowired
	SysMenuService sysMenuService;
	
	/**
	 * 菜单列表界面
	 * 
	 * @return
	 */
	@RequestMapping({ "", "/", "/index" })
	public String menu() {

		return "sys/menu";
	}
	
	/**
	 * 获取所有菜单列表
	 * @param params
	 * @return
	 */
	@RequiresPermissions("sys:menu:list")
	@RequestMapping("/list")
	@ResponseBody
	public List<SysMenu> menuList() {
		List<SysMenu> menuList = sysMenuService.listMenu(new HashMap<String,Object>());
		
		return menuList;
	}
}