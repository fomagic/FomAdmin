package com.fomagic.module.job.dao;

import java.util.List;
import java.util.Map;

import com.fomagic.module.job.entity.ScheduleJobLog;


/**
 * 定时任务日志
 * @author FOM
 *
 */
public interface ScheduleJobLogDao{

	ScheduleJobLog queryObject(Long jobId);

	List<ScheduleJobLog> queryList(Map<String, Object> map);

	int queryTotal(Map<String, Object> map);

	void save(ScheduleJobLog log);
	
}
