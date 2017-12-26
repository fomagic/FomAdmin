package com.fomagic.module.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fomagic.common.controller.BaseController;
import com.fomagic.common.util.Constant;
import com.fomagic.common.util.Result;
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
	public List<SysMenu> listMenu() {
		List<SysMenu> menuList = sysMenuService.listMenu(getSysUserId());
		
		return menuList;
	}
	
	/**
	 * 保存菜单
	 * @param sysMenu
	 * @return
	 */
	@RequiresPermissions("sys:menu:save")
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,Object> saveMenu(@RequestBody SysMenu sysMenu) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map=verifyForm(sysMenu);
		
		if (map.containsKey("msg")) {
			return map;
		}
		sysMenuService.saveMenu(sysMenu);
		
		return Result.success();
	} 
	
	/**
	 * 更新菜单
	 * @param sysMenu
	 * @return
	 */
	@RequiresPermissions("sys:menu:update")
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, Object> updateMenu(@RequestBody SysMenu sysMenu){
		

		Map<String, Object> map = new HashMap<String,Object>();
		map=verifyForm(sysMenu);
		
		if (map.containsKey("msg")) {
			return map;
		}
		
		sysMenuService.updateMenu(sysMenu);
		
		return Result.success();
	}
	
	
	/**
	 * 删除菜单
	 * @param menuId
	 * @return
	 */
	@RequiresPermissions("sys:menu:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String,Object> deleteMenu(Long menuId) {
		
		//系统菜单不能删除
		if (menuId<=Constant.MenuType.SYS_MENU_NUM) {
			return Result.error("系统菜单，万万不可删除啊");
		}
		List<SysMenu> menuList = sysMenuService.listMenuIdByParentId(menuId);
		if (menuList.size()>0) {
			return Result.error("请先删除子菜单");
		}
		
		sysMenuService.deleteBatchByMenuIds(new Long[]{menuId});
		
		return Result.success();
	}
	
	/**
	 * 选择菜单
	 * @return
	 */
	@RequiresPermissions("sys:menu:select")
	@RequestMapping("/select")
	@ResponseBody
	public Map<String, Object> selectMenu(){
		//查询不包含按钮的菜单列表
		List<SysMenu> menuList = sysMenuService.listNotButton(getSysUserId());
		
		//添加一个顶级菜单目录
		SysMenu root = new SysMenu();
		root.setMenuId(0L);
		root.setName("一级菜单");
		root.setParentId(-1L);
		menuList.add(root);
		
		return Result.success().put("menuList", menuList);
	}

	/**
	 * 单个菜单详情
	 * @return
	 */
	@RequiresPermissions("sys:menu:info")
	@RequestMapping("/info/{menuId}")
	@ResponseBody
	public Map<String, Object> infoMenu(@PathVariable("menuId") Long menuId){
		
		SysMenu menu = sysMenuService.getByMenuId(menuId);
		
		return Result.success().put("menu", menu);
	}
	
	
	/**
	 * 验证参数是否正确
	 */
	private Map<String, Object> verifyForm(SysMenu menu){
		Map<String, Object> map = new HashMap<String,Object>();
		
		if (StringUtils.isBlank(menu.getName())) {
			map.put("msg", "菜单名称不能为空");
			return map;
		} 
		if (menu.getParentId()==null) {
			map.put("msg", "上级菜单不能为空");
			return map;
		} 
		//菜单
		if (menu.getType() == 1) {
			if (StringUtils.isBlank(menu.getUrl())) {
				map.put("msg", "菜单URL不能为空");
				return map;
			} 
		} 
		
		//上级菜单是目录类型
		int parentType = 0;
		if (menu.getParentId() != 0) {
			SysMenu parentMenu = sysMenuService.getByMenuId(menu.getParentId());
			parentType = parentMenu.getType();
		} 
		
		//目录、菜单
		if (menu.getType() == 0 || menu.getType() == 1) {
			if (parentType != 0) {
				map.put("msg", "菜单的上级只能为目录类型");
			}
			return map;
		}
		
		//按钮
		if (menu.getType() == 2) {
			if (parentType != 1) {
				map.put("msg", "按钮的上级只能为菜单类型");
			}
			return map;
		}
		
		return map;
		
	}
	
	
	
	
	
	
	
	
}