package com.fomagic.module.job.service;

import java.util.List;
import java.util.Map;

import com.fomagic.module.job.entity.ScheduleJob;

/**
 * 定时任务
 * 
 * @author FOM
 *
 */
public interface ScheduleJobService {

	/**
	 * 根据ID，查询定时任务
	 */
	ScheduleJob getByJobId(Long jobId);

	/**
	 * 查询定时任务列表
	 */
	List<ScheduleJob> listJob(Map<String, Object> map);

	/**
	 * 查询总数
	 */
	int countJob(Map<String, Object> map);

	/**
	 * 保存定时任务
	 */
	void saveJob(ScheduleJob scheduleJob);

	/**
	 * 更新定时任务
	 */
	void updateJob(ScheduleJob scheduleJob);

	/**
	 * 批量删除定时任务
	 */
	void deleteBatchByJobIds(Long[] jobIds);

	/**
	 * 批量更新定时任务状态
	 */
	int updateBatchJob(Long[] jobIds, int status);

	/**
	 * 立即执行
	 */
	void run(Long[] jobIds);

	/**
	 * 暂停运行
	 */
	void pause(Long[] jobIds);

	/**
	 * 恢复运行
	 */
	void resume(Long[] jobIds);
}
