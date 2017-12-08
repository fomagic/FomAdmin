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
import com.fomagic.common.util.PageUtil;
import com.fomagic.common.util.QueryUtil;
import com.fomagic.module.sys.entity.SysRole;
import com.fomagic.module.sys.entity.SysUser;
import com.fomagic.module.sys.service.SysRoleService;

/**
 * 角色
 * 
 * @author FOM
 *
 */
@Controller
@RequestMapping("/sys/role")
public class SysRoleController extends BaseController {

	@Autowired
	private SysRoleService sysRoleService;

	/**
	 * 获取角色列表
	 * @param params
	 * @return
	 */
	@RequiresPermissions("sys:role:list")
	@RequestMapping("/list")
	@ResponseBody
	public Map<String, Object> userList(@RequestParam Map<String, Object> params) {
		
		//如果不是超级管理员，只能查询自己创建的角色列表
		Long userId = ((SysUser)SecurityUtils.getSubject().getPrincipal()).getUserId();
		if (userId != 1) {
			params.put("createUserId", userId);
		} 
		
		QueryUtil query = new QueryUtil(params);
		List<SysRole> list = sysRoleService.listRole(query);
		int total = sysRoleService.countRole(query);
		
		PageUtil pageUtil = new PageUtil(list, total, query.getLimit(), query.getPage());
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("page", pageUtil);
		return map;
	}
	
	
	/**
	 * 获取角色列表
	 * @param params
	 * @return
	 */
	@RequiresPermissions("sys:role:select")
	@RequestMapping("/select")
	@ResponseBody
	public Map<String, Object> userSelect() {
	
		Map<String, Object> map = new HashMap<>();
	
		//如果不是超级管理员，只能查询自己创建的角色列表
		Long userId = ((SysUser)SecurityUtils.getSubject().getPrincipal()).getUserId();
		if (userId != 1) {
			map.put("createUserId", userId);
		} 
		List<SysRole> list = sysRoleService.listRole(map);
		
		Map<String, Object> mapR = new HashMap<String,Object>();
		mapR.put("list", list);
		return mapR;
	}
}