package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Dish;
import com.cugb.javaee.starbucks.bean.Restaurant;

public class RestaurantDAOImpl extends baseDAO implements RestaurantDAO {

	@Override
	public int addRestaurant(Restaurant res) throws SQLException {
		String sql = "insert into restaurant(restaurantid, restaurantname) values ( ?, ?);";
		Object[] params = {res.getRestaurantid(), res.getRestaurantname()};
		return modifyObj(sql, params);
	}
	@Override
	public int removeRestaurant(int restaurantid) throws SQLException {
		String sql = "delete from restaurant where restaurantid = ?";
		Object[] params = {restaurantid};
		return modifyObj(sql, params);
	}
	@Override
	public int modifyDish(Restaurant res) throws SQLException {
		String sql = "update restaurant set restaurantname = ? where restaurantid = ?";
		Object[] params = {res.getRestaurantname(),res.getRestaurantid()};
		return modifyObj(sql, params);
	}
	@Override
	public Restaurant findRestaurant(int restaurantid) throws SQLException {
		String sql = "select restaurantid Restaurantid, restaurantname Restaurantname from restaurant where restaurantid = ?";
		Object[] params = {restaurantid};
		return (Restaurant) findObj(sql, params,  Restaurant.class);
	}
	@Override
	public ArrayList findRestaurants() throws SQLException {
		String sql = "select restaurantid Restaurantid, restaurantname Restaurantname from restaurant";
		return findObjs(sql, Restaurant.class);
	}}
