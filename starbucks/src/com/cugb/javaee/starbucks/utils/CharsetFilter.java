package com.cugb.javaee.starbucks.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * Servlet Filter implementation class CharsetFilter
 */
@WebFilter("/CharsetFilter")
public class CharsetFilter implements Filter {

	
	public CharsetFilter() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			String method = httpRequest.getMethod().toLowerCase();
			if (method.equals("post")) {
				// 如果是post，即表单方法，直接设置charset即可
				request.setCharacterEncoding("UTF-8");
			} else if (method.equals("get")) {
				// 如果是get方法
				request.setCharacterEncoding("UTF-8");
				request = new HttpServletRequestWrapper((HttpServletRequest) request) {
					public String getParameter(String str) {
						try {
							return new String(super.getParameter(str).getBytes("iso-8859-1"), "GBK");
						} catch (Exception e) {
							return null;
						}

					}
				};
			}

			chain.doFilter(request, response);
		} catch (Exception e) {
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
