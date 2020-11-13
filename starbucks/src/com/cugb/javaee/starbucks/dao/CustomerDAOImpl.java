package com.cugb.javaee.starbucks.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Customer;

public class CustomerDAOImpl extends baseDAO implements CustomerDAO {

	@Override
	public int addCustomer(Customer customer) throws SQLException {
		String sql = "insert into Customer values(?, ?, ?)";
		Object[] params = {customer.getUsername(), customer.getPassword(), customer.getEmail()};
		return modifyObj(sql, params);
	}

	@Override
	public int removeCustomer(String string) throws SQLException {
		String sql = "delete from Customer where username = ?";
		Object[] params = {string};
		return modifyObj(sql, params);
	}

	@Override
	public int modifyCustomer(Customer customer) throws SQLException {
		String sql = "update Customer set password = ?, email = ? where username = ?";
		Object[] params = {customer.getPassword(), customer.getEmail(), customer.getUsername()} ;
		return modifyObj(sql, params);
	}

	@Override
	public ArrayList findCustomers() throws SQLException {
		String sql = "select username Username, email Email, password Password from Customer";
		return findObjs(sql, Customer.class);
	}

	@Override
	public Customer findCustomer(String string) throws SQLException {
		String sql = "select username Username, password Password, email Email from Customer where username = ?";
		Object[] params = {string};
		return (Customer) findObj(sql, params, Customer.class);
	}

}
