package com.fomagic.module.job.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 定时任务
 * 
 * @author FOM
 *
 */
public class ScheduleJob implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 任务调度参数key
	 */
	public static final String JOB_PARAM_KEY = "JOB_PARAM_KEY";

	/**
	 * 任务id
	 */
	private Long jobId;

	/**
	 * spring bean名称
	 */
	private String beanName;

	/**
	 * 方法名
	 */

	private String methodName;

	/**
	 * 参数
	 */
	private String params;

	/**
	 * cron表达式
	 */

	private String cronExpression;

	/**
	 * 任务状态
	 */
	private Integer status;

	/**
	 * 备注
	 */
	private String remark;

	/**
	 * 创建时间
	 */
	private Date createTime;

	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}

	public Long getJobId() {
		return jobId;
	}

	public String getBeanName() {
		return beanName;
	}

	public void setBeanName(String beanName) {
		this.beanName = beanName;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getStatus() {
		return status;
	}

	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}

	public String getCronExpression() {
		return cronExpression;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getCreateTime() {
		return createTime;
	}
}
