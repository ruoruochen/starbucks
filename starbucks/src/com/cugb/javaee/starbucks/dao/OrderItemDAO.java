package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.OrderItem;


/**
 * 订单项处理接口： 
 * 1.增加订单项 
 * 2.查询订单项详细
 * 3.
 */
public interface OrderItemDAO {
	/**
	 * 	
	 * @param orderItem 插入的一行詳情
	 * @return
	 * @throws SQLException
	 */
	public int addOrderItem(OrderItem orderItem) throws SQLException;

	/**
	 * 
	 * @param string
	 * @return 
	 * @throws SQLException
	 */
	//public int removeOrderItem(String string) throws SQLException;
	
	/**
	 * 
	 * @param orderItem
	 * @return
	 * @throws SQLException
	 */
	//public int modifyOrderItem(OrderItem orderItem) throws SQLException;

	/**
	 * 
	 * @return
	 * @throws SQLException
	 */
	public ArrayList findOrderItems(String orderId) throws SQLException;

	/**
	 * 
	 * @param string
	 * @return
	 * @throws SQLException
	 */
	//public OrderItem findOrderItem(String string) throws SQLException;
}
