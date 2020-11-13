package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Order;

public class OrderDAOImpl extends baseDAO implements OrderDAO {

	@Override
	public int addOrder(Order order) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyOrder(String orderId, String paystatus) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList findOrders(String userId)
			throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

}
