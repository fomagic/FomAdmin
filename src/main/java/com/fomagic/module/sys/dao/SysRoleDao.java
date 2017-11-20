package com.fomagic.module.sys.dao;


import java.util.List;

import com.fomagic.common.dao.BaseDao;
import com.fomagic.module.sys.entity.SysRole;


public interface SysRoleDao extends BaseDao<SysRole> {
	
	/**
	 * 查询用户创建的角色ID列表
	 * @param createUserId
	 * @return
	 */
	List<Long> listRoleId(Long createUserId);

}
