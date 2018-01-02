package com.fomagic.module.job.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	/**
	 * 保存定时任务
	 * @param schedule
	 * @return
	 */
	
	@RequiresPermissions("sys:schedule:save")
	@RequestMapping("/save")
	@ResponseBody
	public Map<String, Object> saveSchedule(@RequestBody ScheduleJob schedule){
		
		scheduleJobService.saveJob(schedule);
		
		return Result.success();
	}
	
	
	/**
	 * 定时任务信息
	 * @return
	 */
	@RequiresPermissions("sys:schedule:info")
	@RequestMapping("/info/{jobId}")
	@ResponseBody
	public Map<String, Object> infoSchedule(@PathVariable("jobId") Long jobId){
		ScheduleJob schedule = scheduleJobService.getByJobId(jobId);
		
		return Result.success().put("schedule", schedule);
	}
	
	/**
	 * 修改定时任务
	 * @param schedule
	 * @return
	 */
	@RequiresPermissions("sys:schedule:update")
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, Object> updateSchedule(@RequestBody ScheduleJob schedule){
				
		scheduleJobService.updateJob(schedule);
		
		return Result.success();
	}
	
	
	/**
	 * 删除任务
	 * @param jobIds
	 * @return
	 */
	@RequiresPermissions("sys:schedule:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> deleteSchedule(@RequestBody Long[] jobIds){
		
		scheduleJobService.deleteBatchByJobIds(jobIds);
		
		return Result.success();
	}
	
	/**
	 * 暂停定时任务
	 * @param jobIds
	 * @return
	 */
	@RequiresPermissions("sys:schedule:pause")
	@RequestMapping("/pause")
	@ResponseBody
	public Map<String, Object> pauseSchedule(@RequestBody Long[] jobIds){
		
		scheduleJobService.pause(jobIds);
		
		return Result.success();
	}
	
	/**
	 * 恢复定时任务
	 * @param jobIds
	 * @return
	 */
	@RequiresPermissions("sys:schedule:resume")
	@RequestMapping("/resume")
	@ResponseBody
	public Map<String, Object> resumeSchedule(@RequestBody Long[] jobIds){
		
		scheduleJobService.resume(jobIds);
		
		return Result.success();
	}
	
	/**
	 * 立即执行任务
	 * @param jobIds
	 * @return
	 */
	@RequiresPermissions("sys:schedule:run")
	@RequestMapping("/run")
	@ResponseBody
	public Map<String, Object> runSchedule(@RequestBody Long[] jobIds){
		
		scheduleJobService.run(jobIds);
		
		return Result.success();
	}
}
