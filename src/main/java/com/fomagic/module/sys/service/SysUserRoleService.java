package com.fomagic.module.sys.service;

import java.util.List;

public interface SysUserRoleService {

	/**
	 * 根据用户ID保存更新关联角色
	 * @param userId
	 * @param roleIdList
	 */
	void saveUserRole(Long userId,List<Long> roleIdList);

	/**
	 * 根据用户ID获取角色列表
	 * @param userId
	 * @return
	 */
	List<Long> listUserRoleId(Long userId);

}
