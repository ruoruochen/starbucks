package com.cugb.javaee.starbucks.utils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.cugb.javaee.starbucks.utils.JDBCUtils;

public class JDBCUtils {
	private static String drivername;
	private static String url;
	private static String username;
	private static String password;
	private static DataSource myds = null;
	private JDBCUtils(){
		
	}
	static{
		InputStream in = JDBCUtils.class.getClassLoader().
				getResourceAsStream("druidconfig.properties");
		Properties prop = new Properties();
		try {
			prop.load(in);
			myds = DruidDataSourceFactory.createDataSource(prop);
		}catch(Exception ee){
			ee.printStackTrace();
		}
		
	}
	
	/**
	 * 建立数据库连接
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = myds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * 释放资源
	 * 
	 * @param rs
	 * @param ps
	 * @param conn
	 */
	public static void free(ResultSet rs, PreparedStatement ps, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
