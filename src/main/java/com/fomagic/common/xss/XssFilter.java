package com.fomagic.common.xss;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * XSS过滤
 * 
 * @author FOM
 *
 */
public class XssFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		XssHttpServletRequestWrapper_a xssRequest = new XssHttpServletRequestWrapper_a((HttpServletRequest) request);
		chain.doFilter(xssRequest, response);

	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}
	
	public static void main(String[] args) {
		
	}

}
