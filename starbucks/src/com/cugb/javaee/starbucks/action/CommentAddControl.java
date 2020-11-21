package com.cugb.javaee.starbucks.action;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cugb.javaee.starbucks.bean.CommentItem;
import com.cugb.javaee.starbucks.dao.CommentDAO;
import com.cugb.javaee.starbucks.utils.DAOFactory;

public class CommentAddControl extends HttpServlet {

	
	public CommentAddControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		java.util.Date today = new java.util.Date();
		Timestamp timestamp = new Timestamp(today.getTime());
		CommentItem commentItem = new CommentItem();
		commentItem.setCommentid(Integer.parseInt(request.getParameter("commentid")));
		commentItem.setUsername(request.getParameter("username"));
		commentItem.setDishid(Integer.parseInt(request.getParameter("dishid")));
		commentItem.setTime(timestamp);
		commentItem.setCommenttext(request.getParameter("commenttext"));
		CommentDAO commentdao= (CommentDAO) DAOFactory.newInstance("CommentDAO");
		try {
			commentdao.addComment(commentItem);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
