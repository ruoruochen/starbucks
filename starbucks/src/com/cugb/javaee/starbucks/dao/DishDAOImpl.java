package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Dish;

public class DishDAOImpl extends baseDAO implements DishDAO {

	@Override
	public int addDish(Dish dish) throws SQLException {
		int nowdishid = 0;
		nowdishid = getTotalRecords("select * from dish") + 1;
		System.out.print(nowdishid);
		String sql = "insert into Dish(dishid, dishname,categoryid, price, description, imgurl, discount) values (?,?,?, ?, ?, ?, ?);";
		Object[] params = {nowdishid,dish.getDishname(),dish.getCategoryid(), dish.getPrice(), dish.getDescri(), dish.getImgurl(), dish.getDiscount()};
		return modifyObj(sql, params);
	}

	@Override
	public int removeDish(int dishid) throws SQLException {
		String sql = "delete from Dish where dishid = ?";
		Object[] params = {dishid};
		return modifyObj(sql, params);
	}

	@Override
	public int modifyDish(Dish dish) throws SQLException {
		String sql = "update Dish set dishname = ?,categoryid = ? , price = ?, description = ?, imgurl = ?, discount = ? where dishid = ?";
		Object[] params = {dish.getDishname(),dish.getCategoryid(),dish.getPrice(), dish.getDescri(), dish.getImgurl(), dish.getDiscount(), dish.getDishid()};
		return modifyObj(sql, params);
	}

	@Override
	public ArrayList findDishs() throws SQLException {
		String sql = "select dishid Dishid, dishname Dishname,categoryid Categoryid, price Price, description Descri, imgurl Imgurl, discount Discount from Dish";
		return findObjs(sql, Dish.class);
	}

	@Override
	public Dish findDish(int dishid) throws SQLException {
		String sql = "select dishid Dishid, dishname Dishname,categoryid Categoryid, price Price, description Descri, imgurl Imgurl, discount Discount from Dish where dishid = ?";
		Object[] params = {dishid};
		return (Dish) findObj(sql, params,  Dish.class);
	}
	@Override
	public ArrayList<Dish> findDishs(String sql,Object[] params){
		return  this.findObjs(sql, params, Dish.class);
	}
	
	public int getTotalDishs(String strsql) {
		return getTotalRecords(strsql);
	}

	@Override
	public Dish findMaxDish() throws SQLException {
		String sql = "select dishid Dishid, dishname Dishname,categoryid Categoryid, price Price, description Descri, imgurl Imgurl, discount Discount from Dish where dishid = (select max(dishid) from Dish)";
		return (Dish) findObj(sql, null,  Dish.class);
	}

	@Override
	public ArrayList<Dish> findDishbyCategoryid(int categoryid) throws SQLException {
		String sql = "select dishid Dishid, dishname Dishname,categoryid Categoryid, price Price, description Descri, imgurl Imgurl, discount Discount from Dish where categoryid = ?";
		Object[] params = {categoryid};
		return findObjs(sql, params,  Dish.class);
	}

}
