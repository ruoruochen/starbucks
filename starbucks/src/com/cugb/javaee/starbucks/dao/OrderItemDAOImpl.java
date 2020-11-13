package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.OrderItem;

public class OrderItemDAOImpl extends baseDAO implements OrderItemDAO {

	@Override
	public int addOrderItem(OrderItem orderItem) throws SQLException {
		String sql = "insert into OrderItem values(?, ?, ?, ?)";
		Object[] params = {orderItem.getDishid(),orderItem.getOrderid(),orderItem.getCount(),orderItem.getFinalprice()};
		return modifyObj(sql, params);
	}
	
	@Override
	public ArrayList findOrderItems(String orderId) throws SQLException {
		String sql = "select dishid Dishid, orderid Orderid, count Count, finalPrice Finalprice from OrderItem where orderid = '"+orderId+"'";
		return findObjs(sql, OrderItem.class);
	}


}
