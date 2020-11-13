package com.cugb.javaee.starbucks.action;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cugb.javaee.starbucks.bean.CartItem;
import com.cugb.javaee.starbucks.bean.Customer;
import com.cugb.javaee.starbucks.bean.Dish;
import com.cugb.javaee.starbucks.bean.Order;
import com.cugb.javaee.starbucks.bean.OrderItem;
import com.cugb.javaee.starbucks.dao.DishDAO;
import com.cugb.javaee.starbucks.dao.OrderDAO;
import com.cugb.javaee.starbucks.dao.OrderItemDAO;
import com.cugb.javaee.starbucks.utils.DAOFactory;

/**
 * Servlet implementation class OrderAddControl
 */
@WebServlet("/OrderAddControl")
public class OrderAddControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public OrderAddControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
Order order = new Order();
		
		
		//Step1. 取出所有购物车的信息
		HttpSession session = request.getSession();
		Customer cus = (Customer) session.getAttribute("loginuser");
		java.util.Date today = new java.util.Date();
		Timestamp timestamp = new Timestamp(today.getTime());
		String orderID = String.valueOf((new java.util.Date()).getTime());
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		
		Map cart = (Map) session.getAttribute("shopcart");
		Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
		DishDAO ff = null;
		OrderItemDAO oi=null;
		float totalPrice = (float) session.getAttribute("price");
		int count = 0;
		ArrayList<OrderItem> arr = new ArrayList<OrderItem>();
		
	
		
		//Step2. 添加到订单表
				order.setOrderid(orderID);
				order.setUsername(cus.getUsername());
				order.setTime(timestamp);
				order.setPaystatus("未支付");
				order.setItems(arr);
				order.setTel(tel);
				order.setAddress(address);
				order.setCount(3);
				order.updateCount();
				order.setTotalprice(totalPrice);;
				
				OrderDAO orderdao;
				try {
					orderdao = (OrderDAO) DAOFactory.newInstance("OrderDAO");
					orderdao.addOrder(order);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		//Step3. 添加到订单项表
		while(it.hasNext()){
			try {
				ff = (DishDAO)DAOFactory.newInstance("DishDAO");
				oi = (OrderItemDAO) DAOFactory.newInstance("OrderItemDAO");
				Map.Entry entry = (Map.Entry) it.next();
				
				CartItem nc = new CartItem();
				nc = (CartItem) entry.getKey();
				Customer cuss = (Customer) session.getAttribute("loginuser");
				if (!nc.getUsername().equals(cuss.getUsername())) {
					continue;
				}
				
				int dishid = nc.getId();
				int disnumber = (Integer) entry.getValue();
				
				Dish cur = ff.findDish(dishid);
				count += disnumber;
				OrderItem oit = new OrderItem();
				oit.setCount(disnumber);
				oit.setDishid(dishid);
				oit.setFinalprice(cur.getDiscount());
				oit.setOrderid(orderID);
				arr.add(oit);
				oi.addOrderItem(oit);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//Step4.删除购物车信息
		Customer cuss = (Customer) session.getAttribute("loginuser");

		Iterator<Map.Entry<Integer, Integer>> itt = cart.entrySet().iterator();
		while(itt.hasNext())
		{
			
			Map.Entry entry = (Map.Entry) itt.next();
			CartItem ncin = new CartItem();
			ncin = (CartItem)entry.getKey();
			if (ncin.getUsername()==cuss.getUsername()) {
				itt.remove();
			}
		}
		
		response.sendRedirect("mine.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
