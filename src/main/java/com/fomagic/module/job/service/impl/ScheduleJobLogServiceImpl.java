package com.fomagic.module.job.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fomagic.module.job.dao.ScheduleJobLogDao;
import com.fomagic.module.job.entity.ScheduleJobLog;
import com.fomagic.module.job.service.ScheduleJobLogService;

@Service
public class ScheduleJobLogServiceImpl implements ScheduleJobLogService {
	@Autowired
	private ScheduleJobLogDao scheduleJobLogDao;
	
	@Override
	public ScheduleJobLog queryObject(Long jobId) {
		return scheduleJobLogDao.queryObject(jobId);
	}

	@Override
	public List<ScheduleJobLog> queryList(Map<String, Object> map) {
		return scheduleJobLogDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return scheduleJobLogDao.queryTotal(map);
	}

	@Override
	public void save(ScheduleJobLog log) {
		scheduleJobLogDao.save(log);
	}

}
