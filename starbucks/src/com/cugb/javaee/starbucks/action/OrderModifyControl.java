package com.cugb.javaee.starbucks.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cugb.javaee.starbucks.bean.Order;
import com.cugb.javaee.starbucks.dao.DishDAO;
import com.cugb.javaee.starbucks.dao.OrderDAO;
import com.cugb.javaee.starbucks.dao.OrderItemDAO;
import com.cugb.javaee.starbucks.utils.DAOFactory;

//@WebServlet("/DishModifyControl")
public class OrderModifyControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public OrderModifyControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			OrderDAO orderDAO = (OrderDAO) DAOFactory.newInstance("OrderDAO");
			orderDAO.modifyOrder(request.getParameter("orderid"),request.getParameter("paystatus"));
			response.sendRedirect("manageOrder.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
		
	}

}
