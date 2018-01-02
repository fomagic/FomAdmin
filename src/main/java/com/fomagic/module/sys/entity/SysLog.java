package com.fomagic.module.sys.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 日志
 * 
 * @author FOM
 *
 */
public class SysLog implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 日志ID
	 */
	private Long id;

	/**
	 * 用户名
	 */
	private String userName;
	
	/**
	 * 用户操作
	 */
	private String operation;
	
	/**
	 * 请求方法
	 */
	private String method;
	
	/**
	 * 请求参数
	 */
	private String params;
	
	/**
	 * 执行耗时(单位：毫秒)
	 */
	private Long time;
	
	/**
	 * 请求IP
	 */
	private String ip;
	
	/**
	 * 创建时间
	 */
	private Date createTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public Long getTime() {
		return time;
	}

	public void setTime(Long time) {
		this.time = time;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
	
	
}
