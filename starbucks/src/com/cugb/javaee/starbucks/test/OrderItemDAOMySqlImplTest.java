package com.cugb.javaee.starbucks.test;

import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.cugb.javaee.starbucks.bean.OrderItem;
import com.cugb.javaee.starbucks.dao.OrderItemDAO;
import com.cugb.javaee.starbucks.utils.DAOFactory;

class OrderItemDAOMySqlImplTest {
	OrderItemDAO orderitemdao = null;
	
	@BeforeEach
	void setUp() throws Exception {
		orderitemdao = (OrderItemDAO) DAOFactory.newInstance("OrderItemDAO");
	}

	@Test
	void test() throws SQLException {
		String oid = "1496294184681manyfun711";
		ArrayList<OrderItem> arr = new ArrayList<OrderItem>();
		OrderItem oit = new OrderItem();
		oit.setCount(2);
		oit.setDishid(2);
		oit.setFinalprice(2);
		oit.setOrderid("1577278260968");
		assertEquals(1, orderitemdao.addOrderItem(oit));
	}

}
