package com.wls.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FilterSession implements Filter {

	private String encoding;
	
	
    public FilterSession() {}
	
	@Override
	public void destroy() {
		System.out.println("-----------------------------------WLS-WEB 服务器已经关闭了-----------------------------------");
	}

	@Override
	public void doFilter(ServletRequest servletrequest, ServletResponse servletresponse,FilterChain filterchain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)servletrequest;
		HttpServletResponse response=(HttpServletResponse) servletresponse;
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		filterchain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		this.encoding = "UTF-8";
		System.out.println("-----------------------------------WLS-WEB 服务器已经开启了-----------------------------------"+this.encoding);
	}

}
