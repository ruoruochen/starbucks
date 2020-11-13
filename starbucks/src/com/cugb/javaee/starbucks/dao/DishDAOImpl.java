package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Dish;

public class DishDAOImpl extends baseDAO implements DishDAO {

	@Override
	public int addDish(Dish dish) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeDish(int dishid) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyDish(Dish dish) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList findDishs() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Dish findDish(int dishid) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Dish findMaxDish() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalDishs(String strsql) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Dish> findDishs(String sql, Object[] params) {
		// TODO Auto-generated method stub
		return null;
	}

}
