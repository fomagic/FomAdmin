package com.fomagic.module.job.service;

import java.util.List;
import java.util.Map;

import com.fomagic.module.job.entity.ScheduleJobLog;

/**
 * 定时任务日志
 * 
 * @author FOM
 *
 */
public interface ScheduleJobLogService {

	/**
	 * 根据ID，查询定时任务日志
	 */
	ScheduleJobLog queryObject(Long jobId);
	
	/**
	 * 查询定时任务日志列表
	 */
	List<ScheduleJobLog> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存定时任务日志
	 */
	void save(ScheduleJobLog log);
	
}
