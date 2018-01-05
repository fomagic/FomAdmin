package com.fomagic.common.xss;

import org.apache.commons.lang.StringUtils;

import com.fomagic.common.exception.FomException;

/**
 * SQL过滤 防止注入
 * 
 * @author FOM
 *
 */
public class SQLFilter {

	/**
	 * 校验并替换字符串
	 * 
	 * @param str
	 * @return
	 */
	public static String sqlValidate(String str) {

		if (StringUtils.isBlank(str)) {
			return null;
		}

		// 统一为小写
		str = str.toLowerCase();

		String[] badStrs = {"master", "truncate", "insert", "delete", "update", "select", "declare", "alert", "drop"};
		String[] unStrs = {"'", "\"", ";", "\\"};
		
		//非法字符
		for (String key : badStrs) {
			if (str.indexOf(key) != -1) {
				throw new FomException("包含非法字符");
			}
		}
		
		//去掉特殊字符
		for (String key : unStrs) {
			str = StringUtils.replace(str, key, "");
		}
		
		return str;

	}

}
