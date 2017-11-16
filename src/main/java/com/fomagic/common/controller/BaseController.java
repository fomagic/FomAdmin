package com.fomagic.common.controller;

import java.text.MessageFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

/**
 * 基础类 ，Controller的基类
 * 
 * @author FOM
 *
 */
public class BaseController {

	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 重定向方法
	 * 
	 * @param format
	 *            url
	 * @param arguments
	 * @return
	 */
	protected String redirect(String format, Object... arguments) {
		StringBuffer r = new StringBuffer("redirect:");
		r.append(MessageFormat.format(format, arguments));
		return r.toString();
	}

	/**
	 * 返回JSON格式
	 * 
	 * @param object
	 *            需要转换的对象
	 * @return
	 */
	protected String toJson(Object object) {
		return JSON.toJSONString(object, SerializerFeature.BrowserSecure);
	}

	/**
	 * 
	 * @param object
	 *            需要转换的对象
	 * @param format
	 *            格式化日期
	 * @return
	 */
	protected String toJosn(Object object, String format) {
		if (format == null) {
			return toJson(object);
		}
		return JSON.toJSONStringWithDateFormat(object, format, SerializerFeature.WriteDateUseDateFormat);
	}

}
