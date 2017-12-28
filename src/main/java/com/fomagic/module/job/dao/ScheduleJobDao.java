package com.fomagic.module.job.dao;

import java.util.List;
import java.util.Map;

import com.fomagic.module.job.entity.ScheduleJob;


/**
 * 定时任务
 * @author FOM
 *
 */
public interface ScheduleJobDao{
	
	/**
	 * 批量更新状态
	 */
	int updateBatch(Map<String, Object> map);


	ScheduleJob queryObject(Long jobId);

	int queryTotal(Map<String, Object> map);

	List<ScheduleJob> queryList(Map<String, Object> map);


	void save(ScheduleJob scheduleJob);


	void update(ScheduleJob scheduleJob);


	void deleteBatch(Long[] jobIds);
}
