package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Order;
import com.cugb.javaee.starbucks.bean.OrderItem;
import com.cugb.javaee.starbucks.utils.DAOFactory;

public class OrderItemDAOImpl extends baseDAO implements OrderItemDAO {

	@Override
	public int addOrderItem(OrderItem orderItem) throws SQLException {
		String sql = "insert into Orderitem(orderid,dishid,count,price,finalprice) values(?, ?, ?, ?, ?)";
		Object[] params = {orderItem.getOrderid(),orderItem.getDishid(),orderItem.getCount(),orderItem.getPrice(),orderItem.getFinalprice()};
		return modifyObj(sql, params);
	}
	
	@Override
	public ArrayList findOrderItems(String orderId) throws SQLException {
		String sql = "select dishid Dishid, count Count,price Price,finalPrice Finalprice from Orderitem where orderid = '"+orderId+"'";
		return findObjs(sql, OrderItem.class);
	}


}
