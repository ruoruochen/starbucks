package com.cugb.javaee.starbucks.test;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.cugb.javaee.starbucks.bean.Order;
import com.cugb.javaee.starbucks.dao.OrderDAO;
import com.cugb.javaee.starbucks.utils.DAOFactory;

class OrderDAOMySqlImplTest {
	OrderDAO orderdao = null;
	
	@BeforeEach
	void setUp() throws Exception {
		orderdao = (OrderDAO) DAOFactory.newInstance("OrderDAO");
	}

	@Test
	void test() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		ArrayList<Order> arrayList = null;

		arrayList = orderdao.findOrders("1001");
		for(Order order: arrayList){
		}
	}

}
