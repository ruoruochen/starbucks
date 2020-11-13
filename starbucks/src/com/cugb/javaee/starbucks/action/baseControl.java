package com.cugb.javaee.starbucks.action;

import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;

public abstract class baseControl extends HttpServlet {
	/**
	 * 日志工具
	 */
	protected Logger logger = Logger.getLogger(getClass());
}
