package com.fomagic.module.job.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fomagic.common.util.PageUtil;
import com.fomagic.common.util.QueryUtil;
import com.fomagic.common.util.Result;
import com.fomagic.module.job.entity.ScheduleJob;
import com.fomagic.module.job.service.ScheduleJobService;

@Controller
@RequestMapping("/sys/schedule")
public class ScheduleJobController {

	@Autowired
	private ScheduleJobService scheduleJobService;

	/**
	 * 定时任务界面
	 * 
	 * @return
	 */
	@RequestMapping({ "", "/", "index" })
	public String sechdule() {

		return "job/schedule";
	}

	/**
	 * 定时任务列表
	 * @param params
	 * @return
	 */
	@RequiresPermissions("sys:schedule:list")
	@RequestMapping("/list")
	@ResponseBody
	public Map<String, Object> listSchedule(@RequestParam Map<String, Object> params){
		
		QueryUtil query = new QueryUtil(params);
		List<ScheduleJob> jobList = scheduleJobService.listJob(query);
		int total = scheduleJobService.countJob(query);
		
		PageUtil pageUtil = new PageUtil(jobList, total, query.getLimit(), query.getPage());
		
		return Result.success().put("page", pageUtil);
	}

}
