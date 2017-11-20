package com.fomagic.module.sys.service;

import java.util.List;
import java.util.Map;

import com.fomagic.module.sys.entity.SysRole;


/**
 * 角色
 * 
 * @author FOM
 *
 */
public interface SysRoleService {

	
	/**
	 * 查询用户创建的角色ID列表
	 * @param createUserId
	 * @return
	 */
	List<Long> listRoleId(Long createUserId);
	
	
	
	
	/**
	 * 根据角色ID获取角色列表
	 * @param roleId
	 * @return
	 */
	SysRole getByObject(Long roleId);
	
	/**
	 * 查询角色列表
	 * @param map
	 * @return
	 */
	List<SysRole> listObject(Map<String, Object> map);
	
	/**
	 * 查询角色总数
	 * @param map
	 * @return
	 */
	int countTotal(Map<String, Object> map);
	
	/**
	 * 保存角色
	 * @param role
	 */
	void save(SysRole role);
	
	/**
	 * 更新角色
	 * @param role
	 */
	void update(SysRole role);
	
	/**
	 * 批量删除角色
	 * @param roleIds
	 */
	void deleteBatch(Long[] roleIds);
	
}
