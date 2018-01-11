package com.fomagic.module.sys.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fomagic.common.controller.BaseController;
import com.fomagic.common.util.QueryUtil;
import com.fomagic.common.util.Constant;
import com.fomagic.common.util.PageUtil;
import com.fomagic.common.util.Result;
import com.fomagic.module.sys.entity.SysUser;
import com.fomagic.module.sys.service.SysUserRoleService;
import com.fomagic.module.sys.service.SysUserService;
import com.fomagic.module.sys.shiro.ShiroUtil;

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
	 * 管理员列表
	 * 
	 * @return
	 */
	@RequestMapping({ "", "/", "/index" })
	public String user() {

		return "sys/user";
	}


	/**
	 * 用户列表
	 * @param params
	 * @return
	 */
	@RequiresPermissions("sys:user:list")
	@RequestMapping("/list")
	@ResponseBody
	public Map<String, Object> list(@RequestParam(required = true) Map<String, Object> params) {
		
		if (params.isEmpty()) {
			return Result.error("参数不能为空");
		}
		
		if (getSysUserId() != Constant.SUPER_ADMIN) {
			params.put("createUserId", getSysUserId());
		}
		
		QueryUtil query = new QueryUtil(params);
		List<SysUser> sysUserList = sysUserService.listUser(query);
		int total = sysUserService.countUser(query);
		PageUtil pageUtil = new PageUtil(sysUserList, total, query.getLimit(), query.getPage());
		
		return Result.success().put("page", pageUtil);
	}

	
	/**
	 * 用户信息
	 * @param userId
	 * @return
	 */
	@RequiresPermissions("sys:user:info")
	@RequestMapping("/info/{userId}")
	@ResponseBody
	public Map<String,Object> info(@PathVariable("userId") Long userId) {
		
		SysUser sysUser = sysUserService.getByUserId(userId);
		List<Long> roleIdList = sysUserRoleService.listUserRoleId(userId);
		sysUser.setRoleIdList(roleIdList);
		sysUser.setPassword(null);
		sysUser.setSalt(null);
	
		return Result.success().put("user", sysUser);
	}
	
	
	/**
	 * 新增用户
	 * @param user
	 * @return
	 */
	@RequiresPermissions("sys:user:save")
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,Object> save(@RequestBody SysUser user) {
		
		sysUserService.saveUser(user);
		
		return Result.success();
	} 
	
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	@RequiresPermissions("sys:user:update")
	@RequestMapping("/update")
	@ResponseBody
	public Map<String,Object> update(@RequestBody SysUser user) {
		
		SysUser sysUser = sysUserService.getByUserId(user.getUserId());
		user.setSalt(sysUser.getSalt());
		sysUserService.updateUser(user);
		
		return Result.success();
	} 
	
	/**
	 * 批量删除用户
	 * @param userIds
	 * @return
	 */
	@RequiresPermissions("sys:user:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestBody Long[] userIds) {
		
		if (ArrayUtils.contains(userIds, 1L)) {
			return Result.error("系统管理员不能删除");
		}
		if (ArrayUtils.contains(userIds, getSysUserId())) {
			return Result.error("不能删除当前用户");
		}
		sysUserService.deleteBatchByUserIds(userIds);
		return Result.success();
	}
	
	/**
	 * 修改密码
	 * @param password
	 * @param newPassword
	 * @return
	 */
	@RequestMapping("/password")
	@ResponseBody
	public Map<String, Object> password(String password, String newPassword) {
		
		if (StringUtils.isEmpty(password) || StringUtils.isEmpty(newPassword)) {
			return Result.error("密码不能为空");
		}
		SysUser sysUser = getSysUser();
		// 原密码
		password = ShiroUtil.shiroMD5(password, sysUser.getSalt());
		// 新密码
		newPassword = ShiroUtil.shiroMD5(newPassword, sysUser.getSalt());
		// 更新密码
		int count = sysUserService.updatePassword(sysUser.getUserId(), password, newPassword);
		
		if (count == 0) {
			return Result.error("原密码不正确,重新输入");
		}
		return Result.success();
	}

}