package com.cugb.javaee.starbucks.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cugb.javaee.starbucks.bean.Customer;
import com.cugb.javaee.starbucks.dao.CustomerDAO;
import com.cugb.javaee.starbucks.utils.DAOFactory;

@WebServlet("/modifyCusControl")
public class CustomerModifyControl extends baseControl {

	public CustomerModifyControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = req.getSession(true);
		Customer customer = new Customer();		
		customer = (Customer) session.getAttribute("loginuser");
		
		String password = req.getParameter("modifyPass");
		String email = req.getParameter("modifyEmail");
		
		customer.setPassword(password);
		customer.setEmail(email);		
				
		try {
			CustomerDAO CustomerDAO = (CustomerDAO) DAOFactory.newInstance("CustomerDAO");
			CustomerDAO.modifyCustomer(customer);
			resp.sendRedirect("customerIndex.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
