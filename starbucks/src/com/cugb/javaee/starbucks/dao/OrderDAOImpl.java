package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.OrderItem;
import com.cugb.javaee.starbucks.dao.OrderItemDAO;
import com.cugb.javaee.starbucks.utils.DAOFactory;
import com.cugb.javaee.starbucks.bean.Dish;
import com.cugb.javaee.starbucks.bean.Order;

public class OrderDAOImpl extends baseDAO implements OrderDAO {
	
	@Override
	public int addOrder(Order order) throws SQLException {
		String sql = "insert into orders(orderid,username,time,count,totalprice,paystatus,address,tel,restaurantid) values (?, ?, ?, ?, ?, ?, ?,?,?)";
		Object[] params = {order.getOrderid(), order.getUsername(), order.getTime(), order.getCount(), order.getTotalprice(), 
				order.getPaystatus(), order.getAddress(), order.getTel(),order.getRestaurantid()};
		OrderItemDAO orderItemDAO = (OrderItemDAO) DAOFactory.newInstance("OrderItemDAO");
		ArrayList<OrderItem> items = order.getItems();
		System.out.println(items);
		if(modifyObj(sql, params)!=0) {
			for (int i = 0; i < items.size(); i++) {
				OrderItem item = items.get(i);
				orderItemDAO.addOrderItem(item);
			}
			return 1;
		}else {
			return 0;
		}
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
	
	@Override
	public Order findOrder(String orderId) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		// TODO Auto-generated method stub
		String sql = "select orderid Orderid,  username Username, time Time, count Count, totalprice Totalprice, paystatus Paystatus,"
				+ "address Address, tel Tel ,restaurantid Restaurantid from orders where orderid =? order by time DESC";
		Object[] params = {orderId};
			OrderItemDAO orderitemdao = (OrderItemDAO) DAOFactory.newInstance("OrderItemDAO");
			return (Order)findObj(sql,params, Order.class);
			
		
	}

	@Override
	public ArrayList findOrders() throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		// TODO Auto-generated method stub
		String sql = "select orderid Orderid,  username Username, time Time, count Count, totalprice Totalprice, paystatus Paystatus,"
				+ "address Address, tel Tel ,restaurantid Restaurantid from orders order by time DESC";
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
