package com.fomagic.module.sys.entity;


import java.io.Serializable;

/**
 * 角色菜单
 * @author 
 *
 */
public class SysRoleMenu implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long id;

	/**
	 * 角色ID
	 */
	private Long roleId;

	/**
	 * 菜单ID
	 */
	private Long menuId;


	public void setId(Long id) {
		this.id = id;
	}


	public Long getId() {
		return id;
	}
	

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}


	public Long getRoleId() {
		return roleId;
	}
	

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}


	public Long getMenuId() {
		return menuId;
	}
	
}
