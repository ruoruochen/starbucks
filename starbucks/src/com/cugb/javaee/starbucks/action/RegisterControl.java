package com.cugb.javaee.starbucks.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cugb.javaee.starbucks.bean.Customer;
import com.cugb.javaee.starbucks.biz.CustomerService;
import com.cugb.javaee.starbucks.dao.CustomerDAOImpl;

@WebServlet("/register")
public class RegisterControl extends baseControl {

	public RegisterControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取参数
				super.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = req.getParameter("registerName");
		String password = req.getParameter("registerPass");
		String password2 = req.getParameter("registerconfirmPass");
		String email = req.getParameter("registerEmail");
		Customer customer = new Customer();
		customer.setUsername(username);
		customer.setPassword(password);
		customer.setEmail(email);
		//判断是否冲突后，将用户存储到数据库中
		CustomerService cService = new CustomerService();
		RequestDispatcher rd = null;
		try {
			if(password.equals(password2))
			{
				if(cService.isExistCustomer(username)){
					//如果用户已存在
					PrintWriter out = resp.getWriter();
					String a = URLEncoder.encode("用户已经存在，请登录！", "UTF-8");  
			        out.print("<script>alert(decodeURIComponent('"+a+"') );window.location.href='customerLogin.jsp'</script>"); 		
				}
				else{
					//注册成功
					CustomerDAOImpl cuMySqlImpl = new CustomerDAOImpl();
					cuMySqlImpl.addCustomer(customer);
					String a = URLEncoder.encode("注册成功，请登陆！", "UTF-8");  
					resp.getWriter().print("<script>alert(decodeURIComponent('"+a+"') );window.location.href='customerLogin.jsp'</script>");
				}
			}
			else {
				PrintWriter out = resp.getWriter();
				String a = URLEncoder.encode("两次密码不一致，请重新输入！", "UTF-8");  
		        out.print("<script>alert(decodeURIComponent('"+a+"') );window.location.href='customerLogin.jsp'</script>"); 		
			}
			
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
