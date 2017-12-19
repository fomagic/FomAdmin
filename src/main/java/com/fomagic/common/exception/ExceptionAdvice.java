package com.fomagic.common.exception;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 全局异常处理
 *
 */
@ControllerAdvice
public class ExceptionAdvice {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@ExceptionHandler(DuplicateKeyException.class)
	@ResponseBody
	public Map<String, Object> handleDuplicateKeyException(DuplicateKeyException e){
		Map<String, Object> map = new HashMap<String,Object>();
		logger.error("数据库记录重复添加:"+e.getMessage());
		map.put("msg", "数据库已存在该记录");
		return map;
	}
	
	@ExceptionHandler(AuthorizationException.class)
	@ResponseBody
	public Map<String, Object> handleAuthorizationException(AuthorizationException e){
		Map<String, Object> map = new HashMap<String,Object>();
		logger.error("权限不足:"+e.getMessage());
		map.put("msg", "权限不足，联系管理员");
		return map;
	}
}
