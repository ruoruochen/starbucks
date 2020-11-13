package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Customer;

public class CustomerDAOImpl extends baseDAO implements CustomerDAO {

	@Override
	public int addCustomer(Customer customer) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeCustomer(String string) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyCustomer(Customer customer) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList findCustomers() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Customer findCustomer(String string) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
