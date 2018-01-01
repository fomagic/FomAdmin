package com.fomagic.module.job.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.quartz.CronTrigger;
import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fomagic.common.util.Constant;
import com.fomagic.module.job.dao.ScheduleJobDao;
import com.fomagic.module.job.entity.ScheduleJob;
import com.fomagic.module.job.quartz.QuartzUtil;
import com.fomagic.module.job.service.ScheduleJobService;

@Service
public class ScheduleJobServiceImpl implements ScheduleJobService {
	@Autowired
    private Scheduler scheduler;
	@Autowired
	private ScheduleJobDao schedulerJobDao;
	
	/**
	 * 项目启动时，初始化定时器
	 */
	//@PostConstruct
	public void init(){
		List<ScheduleJob> scheduleJobList = schedulerJobDao.queryList(new HashMap<String, Object>());
		for(ScheduleJob scheduleJob : scheduleJobList){
			CronTrigger cronTrigger = QuartzUtil.getCronTrigger(scheduler, scheduleJob.getJobId());
            //如果不存在，则创建
            if(cronTrigger == null) {
            	QuartzUtil.createScheduleJob(scheduler, scheduleJob);
            }else {
            	QuartzUtil.updateScheduleJob(scheduler, scheduleJob);
            }
		}
	}
	
	@Override
	public ScheduleJob queryObject(Long jobId) {
		return schedulerJobDao.queryObject(jobId);
	}

	@Override
	public List<ScheduleJob> queryList(Map<String, Object> map) {
		return schedulerJobDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return schedulerJobDao.queryTotal(map);
	}

	@Override
	@Transactional
	public void save(ScheduleJob scheduleJob) {
		scheduleJob.setCreateTime(new Date());
		scheduleJob.setStatus(Constant.ScheduleStatus.STATUS_NORMAL);
        schedulerJobDao.save(scheduleJob);
        
        QuartzUtil.createScheduleJob(scheduler, scheduleJob);
    }
	
	@Override
	@Transactional
	public void update(ScheduleJob scheduleJob) {
		QuartzUtil.updateScheduleJob(scheduler, scheduleJob);
                
        schedulerJobDao.update(scheduleJob);
    }

	@Override
	@Transactional
    public void deleteBatch(Long[] jobIds) {
    	for(Long jobId : jobIds){
    		QuartzUtil.deleteScheduleJob(scheduler, jobId);
    	}
    	
    	//删除数据
    	schedulerJobDao.deleteBatch(jobIds);
	}

	@Override
    public int updateBatch(Long[] jobIds, int status){
    	Map<String, Object> map = new HashMap<>();
    	map.put("list", jobIds);
    	map.put("status", status);
    	return schedulerJobDao.updateBatch(map);
    }
    
	@Override
	@Transactional
    public void run(Long[] jobIds) {
    	for(Long jobId : jobIds){
    		QuartzUtil.run(scheduler, queryObject(jobId));
    	}
    }

	@Override
	@Transactional
    public void pause(Long[] jobIds) {
        for(Long jobId : jobIds){
        	QuartzUtil.pauseJob(scheduler, jobId);
    	}
        
    	updateBatch(jobIds, Constant.ScheduleStatus.STATUS_PAUSE);
    }

	@Override
	@Transactional
    public void resume(Long[] jobIds) {
    	for(Long jobId : jobIds){
    		QuartzUtil.resumeJob(scheduler, jobId);
    	}

    	updateBatch(jobIds, Constant.ScheduleStatus.STATUS_NORMAL);
    }
    
}
