package com.fomagic.module.job.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/sys/schedule")
public class ScheduleJobController {
	
	
	/**
	 * 定时任务界面
	 * @return
	 */
	@RequestMapping({"","/","index"})
	public String sechdule(){
		
		return "job/schedule";
	}
	
	public Map<String, Object> listSchedule(@RequestParam Map<String, Object> params){
		
		
		return null;
	}
	
}
