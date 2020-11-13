package com.cugb.javaee.starbucks.utils;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigFactory {
private static Properties prop = null;
	
	private ConfigFactory() {
		// TODO Auto-generated constructor stub
	}
	
	static{
		InputStream in = ConfigFactory.class.getClassLoader().getResourceAsStream("config.properties");
		prop = new Properties();
		try {
			prop.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String readProperty(String property){
		return prop.getProperty(property);
	}
	
}
