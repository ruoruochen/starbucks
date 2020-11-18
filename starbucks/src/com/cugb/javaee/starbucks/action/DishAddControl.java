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

@WebServlet("/DishAddControl")
public class DishAddControl extends HttpServlet {

	public DishAddControl() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dish dish = new Dish();
		dish.setDescri(request.getParameter("description"));
		dish.setDiscount(Float.parseFloat(request.getParameter("discount")));
		dish.setImgurl(request.getParameter("imgURL"));
		dish.setPrice(Float.parseFloat(request.getParameter("price")));
		dish.setDishname(request.getParameter("name"));
		dish.setCategoryid(Integer.parseInt(request.getParameter("category")));
		DishDAO disDAO = null;
		try {
			disDAO = (DishDAO) DAOFactory.newInstance("DishDAO");
			disDAO.addDish(dish);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		doGet(req, resp);
	}

}
