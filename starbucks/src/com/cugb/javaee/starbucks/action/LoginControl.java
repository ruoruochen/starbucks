package com.cugb.javaee.starbucks.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
//@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public LoginControl() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost( request,response);
		}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request,response);
		String adminUsername = ConfigFactory.readProperty("username");
		String adminPassword = ConfigFactory.readProperty("password");
		
		String username = request.getParameter("loginName");
		String password = request.getParameter("loginPass");
//		HttpSession session = request.getSession(true);
//		String code=session.getAttribute("code").toString();
//		System.out.println(code);
		String inputcode=request.getParameter("code").toLowerCase();
		Customer loginuser = new Customer();
		loginuser.setUsername(username);
		loginuser.setPassword(password);
		
		//数据库验证
		CustomerService cService = new CustomerService();
		try {
			HttpSession session = request.getSession(true);
			String code=session.getAttribute("code").toString().toLowerCase();
			System.out.println(code);
			System.out.println(inputcode);
			if(inputcode.equals(code))
			{
				if (username.equals(adminUsername) && password.equals(adminPassword)) {
					//管理员 验证通过
					session.setAttribute("loginuser", loginuser);
					session.setAttribute("admin", true);
					request.getRequestDispatcher("adminIndex.jsp").forward(request, response);
				} else if (cService.validateCustomer(loginuser)) {
					//普通用户 验证通过
					session.setAttribute("loginuser", loginuser);
					session.setAttribute("admin", false);
					request.getRequestDispatcher("customerIndex.jsp").forward(request, response);
				}
				else {
					//否则重新登录
					PrintWriter out = response.getWriter();
					String a = URLEncoder.encode("用户名或密码错误，请重新登录！", "UTF-8");  
					if (username.equals(adminUsername) )
						out.print("<script>alert(decodeURIComponent('"+a+"') );window.location.href='adminLogin.jsp'</script>");
					else
						out.print("<script>alert(decodeURIComponent('"+a+"') );window.location.href='customerLogin.jsp'</script>");
				}
			}else {
				//否则重新登录
				PrintWriter out = response.getWriter();
				String a = URLEncoder.encode("验证码错误，请重新登录！", "UTF-8");  
				if (username.equals(adminUsername) )
					out.print("<script>alert(decodeURIComponent('"+a+"') );window.location.href='adminLogin.jsp'</script>");
				else
				out.print("<script>alert(decodeURIComponent('"+a+"') );window.location.href='customerLogin.jsp'</script>");
			}
			
			
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

}
