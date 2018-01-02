package com.fomagic.module.sys.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fomagic.module.sys.dao.SysLogDao;
import com.fomagic.module.sys.entity.SysLog;
import com.fomagic.module.sys.service.SysLogService;

@Service
public class SysLogServiceImpl implements SysLogService {

	@Autowired
	private SysLogDao sysLogDao;
	
	@Override
	public List<SysLog> listLog(Map<String, Object> map) {
		return sysLogDao.listLog(map);
	}

	@Override
	public int countLog(Map<String, Object> map) {
		return sysLogDao.countLog(map);
	}

	@Override
	public void saveLog(SysLog sysLog) {
		sysLogDao.saveLog(sysLog);
	}

	

}
