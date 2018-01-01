package com.fomagic.module.job.dao;

import java.util.List;
import java.util.Map;

import com.fomagic.module.job.entity.ScheduleJob;

/**
 * 定时任务
 * 
 * @author FOM
 *
 */
public interface ScheduleJobDao {

	/**
	 * 获取任务信息
	 * 
	 * @param jobId
	 * @return
	 */
	ScheduleJob getByJobId(Long jobId);

	/**
	 * 获取任务列表
	 * 
	 * @param map
	 * @return
	 */
	List<ScheduleJob> listJob(Map<String, Object> map);

	/**
	 * 获取任务数量
	 * 
	 * @param map
	 * @return
	 */
	int countJob(Map<String, Object> map);

	/**
	 * 保存任务
	 * 
	 * @param scheduleJob
	 */
	void saveJob(ScheduleJob scheduleJob);

	/**
	 * 更新任务
	 * 
	 * @param scheduleJob
	 */
	void updateJob(ScheduleJob scheduleJob);

	/**
	 * 批量更新状态
	 * 
	 * @param map
	 * @return
	 */
	int updateBatchJob(Map<String, Object> map);

	/**
	 * 批量删除
	 * 
	 * @param jobIds
	 */
	void deleteBatchByJobIds(Long[] jobIds);
}
