package com.fomagic.module.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.fomagic.common.controller.BaseController;
import com.fomagic.common.util.QueryUtil;
import com.fomagic.common.util.PageUtil;
import com.fomagic.module.sys.entity.SysUser;
import com.fomagic.module.sys.service.SysUserRoleService;
import com.fomagic.module.sys.service.SysUserService;

/**
 * 系统用户
 * 
 * @author FOM
 *
 */
@Controller
@RequestMapping("/sys/user")
public class SysUserController extends BaseController {

	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private SysUserRoleService sysUserRoleService;

	/**
	 * 登录
	 * 
	 * @return
	 */
	@RequestMapping({ "", "/", "/index" })
	public String login() {

		return "sys/user";
	}


	@RequiresPermissions("sys:user:list")
	@RequestMapping("/list")
	@ResponseBody
	public Map<String, Object> list(@RequestParam(required = true) Map<String, Object> params) {
		
		
		if (params.isEmpty()) {
			return params;
		}
		
		QueryUtil query = new QueryUtil(params);
		List<SysUser> sysUserList = sysUserService.listUser(query);
		int total = sysUserService.countUser(query);
		PageUtil pageUtil = new PageUtil(sysUserList, total, query.getLimit(), query.getPage());
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("page", pageUtil);
		return map;
	}

	@RequiresPermissions("sys:user:info")
	@RequestMapping("/info/{userId}")
	@ResponseBody
	public Map<String,Object> info(@PathVariable("userId") Long userId) {
		
		SysUser sysUser = sysUserService.getByUserId(userId);
		List<Long> roleIdList = sysUserRoleService.listUserRoleId(userId);
		sysUser.setRoleIdList(roleIdList);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("user", sysUser);
		return map;
	}
	
	
	@RequiresPermissions("sys:user:save")
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,Object> save(@RequestBody SysUser user) {
		
		user.setCreateUserId(((SysUser) SecurityUtils.getSubject().getPrincipal()).getUserId());
		sysUserService.saveUser(user);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("code", 0);
		return map;
	} 
	
	@RequiresPermissions("sys:user:update")
	@RequestMapping("/update")
	@ResponseBody
	public Map<String,Object> update(@RequestBody SysUser user) {
		
		user.setCreateUserId(((SysUser) SecurityUtils.getSubject().getPrincipal()).getUserId());
		sysUserService.updateUser(user);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("code", 0);
		return map;
	} 
	
	@RequiresPermissions("sys:user:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestBody Long[] userIds) {
		Map<String, Object> map = new HashMap<String,Object>();
		if (ArrayUtils.contains(userIds, 1L)) {
			map.put("msg", "系统管理员不能删除");
			return map;
		}
		if (ArrayUtils.contains(userIds, ((SysUser) SecurityUtils.getSubject().getPrincipal()).getUserId())) {
			map.put("msg", "不能删除当前用户");
			return map;
		}
		sysUserService.deleteBatchByUserIds(userIds);
		map.put("code", 0);
		return map;
	}
	
	
	@RequestMapping("/password")
	public String password(String password, String newPassword, RedirectAttributesModelMap modelMap) {

		if (StringUtils.isEmpty(password) || StringUtils.isEmpty(newPassword)) {
			
		}

		SysUser sysUser = (SysUser) SecurityUtils.getSubject().getPrincipal();
		// 原密码
		password = new SimpleHash("MD5", password, sysUser.getUserName(), 1024).toString();
		// 新密码
		newPassword = new SimpleHash("MD5", newPassword, sysUser.getUserName(), 1024).toString();
		// 更新密码
		int count = sysUserService.updatePassword(sysUser.getUserId(), password, newPassword);
		modelMap.addFlashAttribute("errMsg", count == 0 ? "原密码不正确，请重新登陆" : "修改成功，请重新登陆");
		SecurityUtils.getSubject().logout();
		return redirect("/sys/login");
	}

}