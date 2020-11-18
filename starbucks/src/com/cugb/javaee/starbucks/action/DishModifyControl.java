package com.cugb.javaee.starbucks.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cugb.javaee.starbucks.bean.Dish;
import com.cugb.javaee.starbucks.dao.DishDAO;
import com.cugb.javaee.starbucks.utils.DAOFactory;

//@WebServlet("/DishModifyControl")
public class DishModifyControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public DishModifyControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dish dish = new Dish();
		dish.setDescri(request.getParameter("description"));
		dish.setDiscount(Float.parseFloat(request.getParameter("discount")));
		dish.setDishid(Integer.parseInt(request.getParameter("dishID")));
		dish.setCategoryid(Integer.parseInt(request.getParameter("category")));
		dish.setImgurl(request.getParameter("imgURL"));
		dish.setPrice(Float.parseFloat(request.getParameter("price")));
		dish.setDishname(request.getParameter("name"));
		try {
			DishDAO disDAO = (DishDAO) DAOFactory.newInstance("DishDAO");
			disDAO.modifyDish(dish);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("aaction?actiontype=detail&dishid="+String.valueOf(dish.getDishid()));
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
		
	}

}
