package com.fomagic.common.xss;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;


/**
 * XSS过滤处理
 * 
 * @author FOM
 *
 */
public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {

	//没被包装器处理过的HttpServletRequest对象（保留）
	private HttpServletRequest orgRequest;
	
	public XssHttpServletRequestWrapper(HttpServletRequest request) {
		super(request);
		this.orgRequest = request;
	}

	
	
	
	
	


	
	/**
	 * 获取最原始的request
	 * @param request
	 * @return
	 */
	public static HttpServletRequest getOrgRequest(HttpServletRequest request){
		if (request instanceof XssHttpServletRequestWrapper) {
			return ((XssHttpServletRequestWrapper) request).getOrgRequest();
		}
		
		return request;
	}
	
	public HttpServletRequest getOrgRequest() {
		return orgRequest;
	}

}
