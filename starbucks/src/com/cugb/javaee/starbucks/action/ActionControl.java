package com.cugb.javaee.starbucks.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cugb.javaee.starbucks.bean.CartItem;
import com.cugb.javaee.starbucks.bean.Customer;
import com.cugb.javaee.starbucks.bean.Dish;
import com.cugb.javaee.starbucks.bean.Order;
import com.cugb.javaee.starbucks.bean.OrderItem;
import com.cugb.javaee.starbucks.biz.DishService;
import com.cugb.javaee.starbucks.dao.DishDAO;
import com.cugb.javaee.starbucks.dao.OrderDAO;
import com.cugb.javaee.starbucks.dao.OrderItemDAO;
import com.cugb.javaee.starbucks.utils.ConfigFactory;
import com.cugb.javaee.starbucks.utils.DAOFactory;
import com.cugb.javaee.starbucks.utils.PageModel;

public class ActionControl extends baseControl {
	private static final long serialVersionUID = 1L;
	private String searchTH;
	private static Properties prop = null;
	private Map cart = new HashMap();
	private int pageSize = 10;
	
	public ActionControl() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actiontype = request.getParameter("actiontype");
		switch (actiontype) {
		case "detail":
			try {
				showdetail(request, response);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		// 显示某一个菜品的详细信息
		case "cart":
			try {
				addCart(request, response);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "del":
			delCart(request, response);
		    break;
		case "addone":
			try {
				addOne(request, response);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "goCart":
			goCart(request,response);
			break;
			// 添加到购物车
		case "logOut":
			logOut(request,response);
			break;
		case "order":
			try {
				order(request,response);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		case "comment":
			try {
				comment(request,response);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		case "search":
			try {
				search(request, response);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NumberFormatException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		String In = request.getParameter("query");
		String kw;
		if(In.equals("-1")){
			kw = searchTH;
		}
		else{
			System.out.println(In+" this is In");
			searchTH = In;
			kw = searchTH;
		}
		// 获取当前页号
		int pageNo = Integer.parseInt(request.getParameter("pageNO"));
		System.out.println(pageNo + "now page");
		// int pageSize = Integer.parseInt(prop.getProperty("pageSize"));
		// 分页查询
		 String pageSize = ConfigFactory.readProperty("pageSize");
		// 生成pageModel对象
		DishService dishserv = new DishService();
		System.out.println(kw + "  111");
		PageModel<Dish> pagemodel = dishserv.findDish5PageList(pageNo, Integer.parseInt(pageSize), kw);
		// 跳转到show页面
		// logger.debug(pagemodel.getList());
		request.setAttribute("dishlist", pagemodel.getList());
		System.out.println(pagemodel.getTotalPages() + " 总页数");
		System.out.println(pagemodel.getList().size() + "大小");
		request.setAttribute("pageModel", pagemodel);
		request.setAttribute("qs", kw);
		RequestDispatcher rd = request
				.getRequestDispatcher("search.jsp?pageNO=" + pageNo + "&totalpages=" + pagemodel.getTotalPages());
		rd.forward(request, response);
	
		
	}
	
	private void showdetail(HttpServletRequest request, HttpServletResponse response) throws InstantiationException,
		    IllegalAccessException, ClassNotFoundException, SQLException, ServletException, IOException {
	
		String Did = request.getParameter("dishid");
		Dish current = new Dish();
		DishDAO dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
		int id = Integer.parseInt(Did);
		current = dishdao.findDish(id);
		request.setAttribute("current", current);
		request.getRequestDispatcher("showdetails.jsp").forward(request, response);
	}

	private void addCart(HttpServletRequest request, HttpServletResponse response) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException, ServletException, IOException {
		HttpSession session = request.getSession(true);
		CartItem nc = new CartItem();
		if (session.getAttribute("loginuser") == null) {
			response.sendRedirect("customerLogin.jsp"); 
		} else {
			String nn = (request.getParameter("number"));
			String Did = request.getParameter("dishid");
			Dish current = new Dish();
		
			DishDAO dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
			int id = Integer.parseInt(Did);
			current = dishdao.findDish(id);
			request.setAttribute("current", current);
			int number = Integer.parseInt(nn);
			Customer now = (Customer) session.getAttribute("loginuser");
			nc.setUsername(now.getUsername());
			nc.setId(id);
			Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
			int flag = 0;
			while(it.hasNext()){
			Map.Entry entry = (Map.Entry) it.next();
			CartItem ncin = new CartItem();
			ncin = (CartItem)entry.getKey();
			if (nc.getId()==ncin.getId()&&nc.getUsername()==ncin.getUsername()) {
				flag = 1;
				cart.put(ncin, (Integer) cart.get(ncin) + number);
			   } 
			}
			if(flag==0){
					cart.put(nc, number);
			}
			session.setAttribute("shopcart", cart);
		    response.sendRedirect("cart.jsp");   
		}
	}


	private void delCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String Did = request.getParameter("dishid");
		Customer now = (Customer) session.getAttribute("loginuser");
		session.setAttribute("shopcart", cart);
		Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
		while(it.hasNext())
		{
			Map.Entry entry = (Map.Entry) it.next();
			CartItem ncin = new CartItem();
			ncin = (CartItem)entry.getKey();
			if (ncin.getId()==Integer.parseInt(Did)&&ncin.getUsername()==now.getUsername()) {
			
				cart.remove(ncin);
				break;
			   } 
			}
		response.sendRedirect("cart.jsp");
	}

	private void addOne(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		HttpSession session = request.getSession(true);
		CartItem nc = new CartItem();
		if (session.getAttribute("loginuser") == null) {
			response.sendRedirect("customerLogin.jsp");
		} else {
			String Did = request.getParameter("dishid");
			Dish current = new Dish();
			DishDAO dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
			int id = Integer.parseInt(Did);
			current = dishdao.findDish(id);
			request.setAttribute("current", current);
			Customer now = (Customer) session.getAttribute("loginuser");
			nc.setUsername(now.getUsername());
			nc.setId(id);
			Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
			int flag = 0;
			while(it.hasNext()){
			Map.Entry entry = (Map.Entry) it.next();
			CartItem ncin = new CartItem();
			ncin = (CartItem)entry.getKey();
			if (nc.getId()==ncin.getId()&&nc.getUsername()==ncin.getUsername()) {
				flag = 1;
				cart.put(ncin, (Integer) cart.get(ncin) + 1);
			   } 
			}
			if(flag==0){
					cart.put(nc, 1);
			}
			session.setAttribute("shopcart", cart);
			response.sendRedirect("cart.jsp");
		}
		
	}
	private void goCart(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession(true);
		if(session.getAttribute("loginuser")==null){
			response.sendRedirect("customerLogin.jsp");
		}
		else{
			response.sendRedirect("cart.jsp");
		}
	}
	
	private void logOut(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession(true);
		session.removeAttribute("loginuser");
		response.sendRedirect("customerIndex.jsp");
	}
	
	private void order(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException{
		//获取订单号
		String orderid=request.getParameter("orderid");
		request.setAttribute("orderid", orderid);
		request.getRequestDispatcher("orderitem.jsp").forward(request, response);
	}
	
	private void comment(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException{
		//获取订单号
		String dishid=request.getParameter("dishid");
		request.setAttribute("dishid", dishid);
		request.getRequestDispatcher("dishcomment.jsp").forward(request, response);
	}
}
