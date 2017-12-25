package com.fomagic.common.util;

/**
 * 全局常量
 * 
 * @author FOM
 *
 */
public interface Constant {

	/**
	 * 超级管理员默认ID
	 */
	public static final Long SUPER_ADMIN = 1L;

	/**
	 * 菜单类型
	 */
	public static class MenuType {
		public static final int SYS_MENU_NUM = 1000;  //系统菜单编号预留
		public static final int CATALOG = 0; 	//目录
		public static final int MENU = 1;		//菜单
		public static final int BUTTON = 2;		//按钮
	}
	/**
	 * 管理员状态
	 */
	public static class UserStatus {
		public static final int STATUS_LOCKED  = 0;		//锁定，禁止登录
		public static final int STATUS_NORMAL  = 1;		//正常
	}
}
