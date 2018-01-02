package com.fomagic.module.sys.dao;

import java.util.List;
import java.util.Map;

import com.fomagic.module.sys.entity.SysLog;


public interface SysLogDao{

	/**
	 * 日志列表
	 * @param map
	 * @return
	 */
	List<SysLog> listLog(Map<String, Object> map);

	/**
	 * 日志总数
	 * @param map
	 * @return
	 */
	int countLog(Map<String, Object> map);

	/**
	 * 保存日志
	 * @param sysLog
	 * @return
	 */
	void saveLog(SysLog sysLog);
	

}
