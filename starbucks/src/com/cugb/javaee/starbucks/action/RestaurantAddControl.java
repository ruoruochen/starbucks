package com.cugb.javaee.starbucks.action;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cugb.javaee.starbucks.bean.Restaurant;
import com.cugb.javaee.starbucks.dao.RestaurantDAO;
import com.cugb.javaee.starbucks.utils.DAOFactory;

public class RestaurantAddControl extends HttpServlet {
	public RestaurantAddControl() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Restaurant restaurant = new Restaurant();
		restaurant.setRestaurantid(0);
		restaurant.setRestaurantname(request.getParameter("restaurantname"));
		RestaurantDAO restaurantdao= (RestaurantDAO) DAOFactory.newInstance("RestaurantDAO");
		try {
			restaurantdao.addRestaurant(restaurant);
			request.getRequestDispatcher("manageRestaurant.jsp").forward(request, response);
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
