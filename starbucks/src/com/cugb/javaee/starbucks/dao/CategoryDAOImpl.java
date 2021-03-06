package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Category;
import com.cugb.javaee.starbucks.bean.Dish;

public class CategoryDAOImpl extends baseDAO implements CategoryDAO {

	@Override
	public int addCategory(Category category) throws SQLException {
		String sql = "insert into category(categoryid,categoryname) values (0,?);";
		Object[] params = {category.getCategoryname()};
		return modifyObj(sql, params);
	}

	@Override
	public int removeCategory(int categoryid) throws SQLException {
		String sql = "delete from category where categoryid = ?";
		Object[] params = {categoryid};
		return modifyObj(sql, params);
	}

	@Override
	public int modifyCategory(Category category) throws SQLException {
		String sql = "update category set categoryname = ? where categoryid = ?";
		Object[] params = {category.getCategoryname(),category.getCategoryid()};
		return modifyObj(sql, params);
	}

	@Override
	public ArrayList findCategorys() throws SQLException {
		String sql = "select categoryid Categoryid,categoryname Categoryname from category";
		return findObjs(sql, Category.class);
	}

	@Override
	public Category findCategory(int categoryid) throws SQLException {
		String sql = "select categoryid Categoryid,categoryname Categoryname from category where categoryid=?";
		Object[] params = {categoryid};
		return (Category) findObj(sql, params,  Category.class);
	}

	@Override
	public int getTotalCategorys(String strsql) {
		// TODO Auto-generated method stub
		return 0;
	}

}
