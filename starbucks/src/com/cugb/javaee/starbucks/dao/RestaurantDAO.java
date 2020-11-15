package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Restaurant;

/**
 * 餐厅信息处理接口，主要功能包括：
 * 1.增加餐厅信息。
 * 2.修改餐厅信息。
 * 3.删除餐厅信息。
 * 4.根据餐厅id获取餐厅对象
 */
public interface RestaurantDAO {
	
	public int addRestaurant(Restaurant res) throws SQLException;

	public int removeRestaurant(int restaurantid) throws SQLException; 

	public int modifyDish(Restaurant res) throws SQLException; 

	public Restaurant findRestaurant(int restaurantid) throws SQLException; 

	public ArrayList findRestaurants() throws SQLException;
}
