package com.cugb.javaee.starbucks.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cugb.javaee.starbucks.bean.Customer;
import com.cugb.javaee.starbucks.biz.CustomerService;
import com.cugb.javaee.starbucks.utils.ConfigFactory;

/**
 * Servlet implementation class LoginContrler
 */
@WebServlet("/LoginContrler")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public LoginControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminUsername = ConfigFactory.readProperty("username");
		String adminPassword = ConfigFactory.readProperty("password");
		
		String username = request.getParameter("loginName");
		String password = request.getParameter("loginPass");
		Customer loginuser = new Customer();
		loginuser.setUsername(username);
		loginuser.setPassword(password);
		
		//数据库验证
		CustomerService cService = new CustomerService();
		try {
			if (username.equals(adminUsername) && password.equals(adminPassword)) {
				//管理员 验证通过
				HttpSession session = request.getSession(true);
				session.setAttribute("loginuser", loginuser);
				session.setAttribute("admin", true);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else if (cService.validateCustomer(loginuser)) {
				//普通用户 验证通过
				HttpSession session = request.getSession(true);
				session.setAttribute("loginuser", loginuser);
				session.setAttribute("admin", false);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else {
				//否则重新登录
				response.sendRedirect("login.jsp");
			}
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
