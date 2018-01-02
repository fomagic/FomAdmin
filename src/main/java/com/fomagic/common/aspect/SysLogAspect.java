package com.fomagic.common.aspect;

import java.lang.reflect.Method;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.fomagic.common.annotation.SysLogAnno;
import com.fomagic.common.util.HttpContextUtil;
import com.fomagic.module.sys.entity.SysLog;
import com.fomagic.module.sys.entity.SysUser;
import com.fomagic.module.sys.service.SysLogService;


@Aspect
@Component
public class SysLogAspect {
	
	@Autowired
	private SysLogService sysLogService;
	

	@Pointcut(value = "@annotation(com.fomagic.common.annotation.SysLogAnno)")
	public void logPointcut(){
		
	}
	
	@Around("logPointcut()")
	public Object logAround(ProceedingJoinPoint point) throws Throwable{
		
		long beginTime = System.currentTimeMillis();
		//执行方法
		Object result = point.proceed();
		//执行时长(毫秒)
		long time = System.currentTimeMillis() - beginTime;

		//保存日志
		saveSysLog(point, time);

		return result;
	}

	private void saveSysLog(ProceedingJoinPoint point, long time) {
		MethodSignature signature = (MethodSignature) point.getSignature();
		Method method = signature.getMethod();

		SysLog sysLog = new SysLog();
		SysLogAnno syslog = method.getAnnotation(SysLogAnno.class);
		if(syslog != null){
			//注解上的描述
			sysLog.setOperation(syslog.value());
		}

		//请求的方法名
		String className = point.getTarget().getClass().getName();
		String methodName = signature.getName();
		sysLog.setMethod(className + "." + methodName + "()");

		//请求的参数
		Object[] args = point.getArgs();
		try{
			String params = JSON.toJSONString(args[0]);
			sysLog.setParams(params);
		}catch (Exception e){

		}

		//获取request
		HttpServletRequest request = HttpContextUtil.getHttpServletRequest();
		//设置IP地址
		//sysLog.setIp(IPUtils.getIpAddr(request));
		sysLog.setIp(request.getRemoteAddr());

		//用户名
		String username = ((SysUser) SecurityUtils.getSubject().getPrincipal()).getUserName();
		sysLog.setUserName(username);

		sysLog.setTime(time);
		sysLog.setCreateTime(new Date());
		//保存系统日志
		sysLogService.saveLog(sysLog);
		
	}
	
}
