package com.fomagic.module.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fomagic.common.controller.BaseController;
import com.fomagic.common.util.Constant;
import com.fomagic.common.util.PageUtil;
import com.fomagic.common.util.QueryUtil;
import com.fomagic.common.util.Result;
import com.fomagic.module.sys.entity.SysRole;
import com.fomagic.module.sys.service.SysRoleMenuService;
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

	@Autowired
	private SysRoleMenuService sysRoleMenuService;
	
	/**
	 * 角色列表界面
	 * 
	 * @return
	 */
	@RequestMapping({ "", "/", "/index" })
	public String role() {

		return "sys/role";
	}
	
	/**
	 * 获取角色列表
	 * @param params
	 * @return
	 */
	@RequiresPermissions("sys:role:list")
	@RequestMapping("/list")
	@ResponseBody
	public Map<String, Object> listRole(@RequestParam Map<String, Object> params) {
		
		//如果不是超级管理员，只能查询自己创建的角色列表
		if (getSysUserId() != Constant.SUPER_ADMIN) {
			params.put("createUserId", getSysUserId());
		} 
		
		QueryUtil query = new QueryUtil(params);
		List<SysRole> list = sysRoleService.listRole(query);
		int total = sysRoleService.countRole(query);
		
		PageUtil pageUtil = new PageUtil(list, total, query.getLimit(), query.getPage());
		
		return Result.success().put("page", pageUtil);
	}
	
	/**
	 * 获取角色列表
	 * @return
	 */
	@RequiresPermissions("sys:role:select")
	@RequestMapping("/select")
	@ResponseBody
	public Map<String, Object> getRole() {
	
		Map<String, Object> map = new HashMap<>();
	
		//如果不是超级管理员，只能查询自己创建的角色列表
		if (getSysUserId() != Constant.SUPER_ADMIN) {
			map.put("createUserId", getSysUserId());
		} 
		List<SysRole> list = sysRoleService.listRole(map);
		
		return Result.success().put("list", list);
	}
	
	/**
	 * 保存角色
	 * @param sysRole
	 * @return
	 */
	@RequiresPermissions("sys:role:save")
	@RequestMapping("/save")
	@ResponseBody
	public Map<String, Object> saveRole(@RequestBody SysRole sysRole) {
	
		sysRole.setCreateUserId(getSysUserId());
		sysRoleService.saveRole(sysRole);
		
		return Result.success();
	}
	
	/**
	 * 角色信息
	 * @param roleId
	 * @return
	 */
	@RequiresPermissions("sys:role:info")
	@RequestMapping("/info/{roleId}")
	@ResponseBody
	public Map<String, Object> roleInfo(@PathVariable("roleId") Long roleId){
		
		SysRole sysRole = sysRoleService.getByRoleId(roleId);
		
		//  查询角色对应的菜单
		List<Long> menuIdList = sysRoleMenuService.listRoleMenuId(roleId);
		sysRole.setMenuIdList(menuIdList);
		
		return Result.success().put("role", sysRole);
	}
	
	/**
	 * 角色修改
	 * @param sysRole
	 * @return
	 */
	@RequiresPermissions("sys:role:update")
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, Object> roleUpdate(@RequestBody SysRole sysRole){
		sysRole.setCreateUserId(getSysUserId());
		sysRoleService.updateRole(sysRole);
		
		return Result.success();
	}
	
	
	/**
	 * 删除角色
	 * @param roleIds
	 * @return
	 */
	@RequiresPermissions("sys:role:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> roleDelete(@RequestBody Long[] roleIds){
		sysRoleService.deleteBatchByRoleIds(roleIds);
		
		return Result.success();
	}
	
}