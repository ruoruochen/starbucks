package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Category;
import com.cugb.javaee.starbucks.bean.Dish;

public interface CategoryDAO {

	public int addCategory(Category category) throws SQLException;

	public int removeCategory(int Categoryid) throws SQLException; 

	public int modifyCategory(Category category) throws SQLException; 
	
	public ArrayList findCategorys() throws SQLException;
	
	public Category findCategory(int categoryid) throws SQLException;
	
	public int getTotalCategorys(String strsql);
	
	ArrayList<Category> findCategorys(String sql, Object[] params);
}
