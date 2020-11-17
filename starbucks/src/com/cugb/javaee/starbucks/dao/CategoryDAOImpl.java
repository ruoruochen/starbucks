package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Category;
import com.cugb.javaee.starbucks.bean.Dish;

public class CategoryDAOImpl extends baseDAO implements CategoryDAO {

	@Override
	public int addCategory(Category category) throws SQLException {
		String sql = "insert into Category(categoryid,categoryname) values ( ?,?);";
		Object[] params = {category.getCategoryid(),category.getCategoryname()};
		return modifyObj(sql, params);
	}

	@Override
	public int removeCategory(int categoryid) throws SQLException {
		String sql = "delete from Category where categoryid = ?";
		Object[] params = {categoryid};
		return modifyObj(sql, params);
	}

	@Override
	public int modifyCategory(Category category) throws SQLException {
		String sql = "update Category set categoryname = ? where categoryid = ?";
		Object[] params = {category.getCategoryname(),category.getCategoryid()};
		return modifyObj(sql, params);
	}

	@Override
	public ArrayList findCategorys() throws SQLException {
		String sql = "select categoryid Categoryid,categoryname Categoryname from Category";
		return findObjs(sql, Category.class);
	}

	@Override
	public Category findCategory(int categoryid) throws SQLException {
		String sql = "select categoryid Categoryid,categoryname Categoryname from Category where categoryid=?";
		Object[] params = {categoryid};
		return (Category) findObj(sql, params,  Category.class);
	}

}
