package com.cugb.javaee.starbucks.test;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.Before;
import org.junit.Test;

import com.cugb.javaee.starbucks.bean.Customer;
import com.cugb.javaee.starbucks.utils.DAOFactory;
import com.cugb.javaee.starbucks.dao.CustomerDAO;

class CustomerDAOImplTest {
	CustomerDAO cusDAO = null;
	
	@Before
	void setUp() throws Exception {
		cusDAO = (CustomerDAO)DAOFactory.newInstance("CustomerDAO");
	}
	
	@Test
	void test() throws SQLException {
		Customer cus = new Customer();
		cus.setUsername("1003");
		cus.setPassword("admin");
		cus.setEmail("cus1003");
		assertEquals(1, cusDAO.addCustomer(cus));
	}

}
