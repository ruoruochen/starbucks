package com.cugb.javaee.starbucks.action;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cugb.javaee.starbucks.bean.Category;
import com.cugb.javaee.starbucks.dao.CategoryDAO;
import com.cugb.javaee.starbucks.utils.DAOFactory;

public class CategoryAddControl extends HttpServlet {
	public CategoryAddControl() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Category category = new Category();
		category.setCategoryid(0);
		category.setCategoryname(request.getParameter("categoryname"));
		CategoryDAO categorydao= (CategoryDAO) DAOFactory.newInstance("CategoryDAO");
		try {
			categorydao.addCategory(category);
			request.getRequestDispatcher("manageCategory.jsp").forward(request, response);
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
