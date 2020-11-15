package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.OrderItem;
import com.cugb.javaee.starbucks.dao.OrderItemDAO;
import com.cugb.javaee.starbucks.utils.DAOFactory;
import com.cugb.javaee.starbucks.bean.Order;

public class OrderDAOImpl extends baseDAO implements OrderDAO {
	
	@Override
	public int addOrder(Order order) throws SQLException {
		String sql = "insert into Orders values (?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] params = {order.getOrderid(), order.getUsername(), order.getTime(), order.getCount(), order.getTotalprice(), 
				order.getPaystatus(), order.getAddress(), order.getTel()};
		OrderItemDAO orderItemDAO = (OrderItemDAO) DAOFactory.newInstance("OrderItemDAO");
		ArrayList<OrderItem> items = order.getItems();
		for (int i = 0; i < items.size(); i++) {
			OrderItem item = items.get(i);
			orderItemDAO.addOrderItem(item);
		}
		return modifyObj(sql, params);
	}
	
	@Override
	public int modifyOrder(String orderId, String paystatus) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update Orders set paystatus = ? where orderid = ?";
		Object[] params = {paystatus, orderId};
		return modifyObj(sql, params);
	}

	@Override
	public ArrayList findOrders(String userId) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		// TODO Auto-generated method stub
		String sql = "select orderid Orderid,  username Username, time Time, count Count, totalprice Totalprice, paystatus Paystatus,"
				+ "address Address, tel Tel ,restaurantid Restaurantid from orders where username = \"" + userId + "\" order by time DESC";
		ArrayList<Order> arr = findObjs(sql, Order.class);
		for(int i = 0; i < arr.size(); i++){
			Order ord = arr.get(i);
			OrderItemDAO orderitemdao = (OrderItemDAO) DAOFactory.newInstance("OrderItemDAO");
			ArrayList<OrderItem> oit = orderitemdao.findOrderItems(ord.getOrderid());
			arr.get(i).setItems(oit);
		}
		return arr;
	}


}
