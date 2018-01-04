package com.fomagic.module.sys.entity;

import java.io.Serializable;
import java.util.List;


/**
 * 角色
 * @author FOM
 *
 */
public class SysMenu implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	/**
	 * 菜单ID
	 */
	private Long menuId;
	
	/**
	 * 父菜单ID
	 */
	private Long parentId;
	
	/**
	 * 父菜单名称
	 */
	private String parentName;
	
	/**
	 * 菜单名称
	 */
	private String name;

	/**
	 * 菜单URL
	 */
	private String url;

	/**
	 * 授权(多个用逗号分隔，如：user:list,user:create)
	 */
	private String perms;

	/**
	 * 类型     0：目录   1：菜单   2：按钮
	 */
	private Integer type;

	/**
	 * 菜单图标
	 */
	private String icon;

	/**
	 * 排序
	 */
	private Integer orderNum;
	
	/**
	 * 子菜单
	 */
	private List<?> list;

	
	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPerms() {
		return perms;
	}

	public void setPerms(String perms) {
		this.perms = perms;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Integer getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}
	
	

}
