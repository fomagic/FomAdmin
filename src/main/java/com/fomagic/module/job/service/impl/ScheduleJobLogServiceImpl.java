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
	public ScheduleJobLog getByJobLogId(Long jobId) {
		return scheduleJobLogDao.getByJobLogId(jobId);
	}

	@Override
	public List<ScheduleJobLog> listJobLog(Map<String, Object> map) {
		return scheduleJobLogDao.listJobLog(map);
	}

	@Override
	public int countJobLog(Map<String, Object> map) {
		return scheduleJobLogDao.countJobLog(map);
	}

	@Override
	public void saveJobLog(ScheduleJobLog log) {
		scheduleJobLogDao.saveJobLog(log);
	}

}
