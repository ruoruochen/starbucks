package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Dish;


/**
 * 菜品信息处理接口，主要功能包括： 1.增加菜品信息。 2.修改菜品信息。 3.删除菜品信息。 4.查询所有菜品信息。
 *
 */
public interface DishDAO {
	/**
	 * 增加菜品信息。
	 * 
	 * @param Dish
	 *            包含菜品信息的对象。
	 * @return 增加的菜品的数量。
	 * @throws SQLException
	 *             执行操作发生任何异常时。
	 */
	public int addDish(Dish dish) throws SQLException;

	/**
	 * 删除指定的菜品信息。
	 * 
	 * @param dishid为要删除的菜品的ID。
	 * @return 已经删除的菜品的数量。
	 * @throws SQLException
	 *             执行操作发生任何异常时。
	 */
	public int removeDish(int dishid) throws SQLException;

	/**
	 * 修改指定的菜品信息，可以修改的信息包括： 原菜品id 欲改成的菜品全部信息。
	 * 
	 * @param Dish
	 *            包含菜品信息的对象。
	 * @return 被修改的菜品的数量。
	 * @throws SQLException
	 *             执行操作发生任何异常时。
	 */
	public int modifyDish(Dish dish) throws SQLException;

	/**
	 * 查询所有的菜品信息。
	 * 
	 * @return 包含菜品信息的数据结构，如果没有返回NULL。
	 * @throws SQLException
	 *             执行操作发生任何异常时。
	 */
	public ArrayList findDishs() throws SQLException;

	/**
	 * 查询单一的菜品信息。
	 * 
	 * @param Dish
	 *            的id
	 * @return 该菜品的所有信息
	 * @throws SQLException
	 *             执行操作发生任何异常时。
	 */
	public Dish findDish(int dishid) throws SQLException;

	/**
	 * 查询编号最大的菜品信息。
	 * 
	 * @param
	 * @return 最新菜品的信息
	 * @throws SQLException
	 *             执行操作发生任何异常时。
	 */
	public Dish findMaxDish() throws SQLException;

	/**
	 * 返回菜品总数
	 */
	public int getTotalDishs(String strsql);

	ArrayList<Dish> findDishs(String sql, Object[] params);

	ArrayList<Dish> findDishbyCategoryid(int categoryid) throws SQLException;


}
