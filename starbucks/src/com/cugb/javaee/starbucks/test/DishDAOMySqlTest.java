package com.cugb.javaee.starbucks.test;

import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;

import org.junit.Before;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.cugb.javaee.starbucks.bean.Dish;
import com.cugb.javaee.starbucks.utils.DAOFactory;
import com.cugb.javaee.starbucks.dao.DishDAO;

class DishDAOMySqlTest {
	DishDAO dishdao=null;
	
	@BeforeEach
	void setUp() throws Exception {
		dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
	}
	
	@Test
	void test() throws SQLException {
		Dish dish = new Dish();
		dish.setDescri("sdds");
		dish.setDiscount(5);
		dish.setDishname("aa");
		dish.setImgurl("https://www.bkchina.cn/website//productimage/5cc6d33aaf9cb.png");
		dish.setPrice(5);
		assertEquals(1, dishdao.addDish(dish));
	}

}
