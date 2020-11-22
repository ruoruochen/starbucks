package com.cugb.javaee.starbucks.utils;


import java.io.IOException;

import javax.servlet.jsp.JspWriter;

import org.apache.jasper.runtime.*;

import com.cugb.javaee.starbucks.bean.Customer;
import com.cugb.javaee.starbucks.bean.Dish;
import com.cugb.javaee.starbucks.bean.Order;
import com.cugb.javaee.starbucks.bean.Category;
import com.cugb.javaee.starbucks.bean.CommentItem;
public class JSPOutput {
	public static void outputCategoryAdd(JspWriter out) throws IOException {
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  分类名称");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"categoryname\" placeholder=\"分类名称\" type=\"text\" \">");
		out.println(" </input>");
		out.println("</div>");
	}
	
	public static void outputCategory(JspWriter out,Category category) throws IOException {
		out.println("<tr>");
		
		out.println(" <td class=\"cart_product\" width=\"100\">");
		out.println("  <h4>");
		out.println(String.valueOf(category.getCategoryid()));
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <h4>");
		out.println(category.getCategoryname());
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println("</tr>");
	}
	
	public static void outputOrder(JspWriter out,Order order) throws IOException {
		out.println("<tr>");
		
		out.println(" <td class=\"cart_product\" width=\"100\">");
		out.println("  <h4>");
		out.println(order.getOrderid());
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <h4>");
		out.println(order.getUsername());
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <h4>");
		out.println(order.getTime());
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <h4>");
		out.println(order.getCount());
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <h4>");
		out.println(order.getTotalprice());
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <h4>");
		out.println(order.getPaystatus());
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <h4>");
		out.println(order.getAddress());
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <h4>");
		out.println(order.getTel());
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <h4>");
		out.println(order.getRestaurantid());
		out.println("  </h4>");
		out.println(" </td>");
		
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <a href=\"modifyOrder.jsp?orderid="+order.getOrderid()+"\">");
		out.println("详情…");
		out.println("  </a>");
		out.println(" </td>");
		
		out.println("</tr>");
	}
	
	public static void outputOrderModify(JspWriter out, Order order) throws IOException {
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputEmail1\">");
		out.println("  订单ID");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"orderid\" placeholder=\"菜品ID\" readonly=\"true\"  value=\""
						+ String.valueOf(order.getOrderid()) + "\">");
		out.println(" </input>");
		out.println("</div>");
		
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  用户名");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"name\" readonly=\"true\" type=\"text\" value=\""
				+ order.getUsername() + "\">");
		out.println(" </input>");
		out.println("</div>");
		
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  提交时间");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"category\" readonly=\"true\" value=\""
				+ order.getTime() + "\">");
		out.println(" </input>");
		out.println("</div>");
		
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  餐品数量");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"price\" readonly=\"true\" type=\"text\" value=\""
				+ String.valueOf(order.getCount()) + "\">");
		out.println(" </input>");
		out.println("</div>");
		
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  总价");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"description\" readonly=\"true\" \">"
				+ order.getTotalprice() + "</textarea>");
		out.println(" </input>");
		out.println("</div>");
		
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  支付状态");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"paystatus\" placeholder=\"1.00\" type=\"text\" value=\""
				+ order.getPaystatus() + "\">");
		out.println(" </input>");
		out.println("</div>");
		
		
	}
	
	
	public static void outputComment(JspWriter out,CommentItem comment) throws IOException {
		out.println("<tr>");
		
		out.println(" <td class=\"cart_product\" width=\"100\">");
		out.println("  <h4>");
		out.println(String.valueOf(comment.getCommentid()));
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <h4>");
		out.println(comment.getUsername());
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <h4>");
		out.println(comment.getDishid());
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <h4>");
		out.println(comment.getTime());
		out.println("  </h4>");
		out.println(" </td>");
		
		
		out.println(" <td class=\"category_name\" width=\"100\">");
		out.println("  <h4>");
		out.println(comment.getCommenttext());
		out.println("  </h4>");
		out.println(" </td>");
		
		out.println(" <td width=\"50\">");
		  out.println("  <a class=\"cart_quantity_delete\" href=\"deleteComment.jsp?commentid="+comment.getCommentid()+"\">");
		  out.println("   <i class=\"fa fa-trash-o fa-lg\">");
		  out.println("   </i>");
		  out.println("  </a>");
		  out.println(" </td>");
		  
		  out.println("</tr>");
	}
	
	public static void outputCommentDelete(JspWriter out, CommentItem com) throws IOException{
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputEmail1\">");
		out.println("  评论id");
		out.println(" </label>");
		out.println(
				" <input class=\"form-control\" name=\"dishID\" placeholder=\"用户名\" readonly=\"true\" type=\"email\" value=\""
						+ com.getCommentid() + "\">");
		out.println(" </input>");
		out.println("</div>");
		
}
	
	// dishManage
	public static void outputDish(JspWriter out, Dish dish) throws IOException {
		out.println("<tr>");
		out.println(" <td class=\"cart_product\" width=\"100\">");
		out.println("  <a href=\"action?actiontype=detail&dishid="+String.valueOf(dish.getDishid())+"\">");
		out.println("   <img alt=\"\" src=\"" + dish.getImgurl().replace("80x80", "110x110") + "\"width=\"100\">");
		out.println("   </img>");
		out.println("  </a>");
		out.println(" </td>");
		out.println(" <td class=\"cart_description\">");
		out.println("  <h4>");
		out.println("   <a href=\"action?actiontype=detail&dishid="+String.valueOf(dish.getDishid())+"\">");
		out.println(dish.getDishname());
		out.println("   </a>");
		out.println("  </h4>");
		out.println("  <p>");
		out.println("   Dish ID: " + String.valueOf(dish.getDishid()));
		out.println("  </p>");
		out.println(" </td>");
		out.println(" <td class=\"cart_total\">");
		out.println("  <p class=\"cart_total_price\">");
		out.println("   " + String.valueOf(dish.getCategoryid()));
		out.println("  </p>");
		out.println(" </td>");
		out.println(" <td class=\"cart_total\">");
		out.println("  <p class=\"cart_total_price\">");
		out.println("   ¥" + String.valueOf(dish.getPrice()));
		out.println("  </p>");
		out.println(" </td>");
		out.println(" <td class=\"cart_total\">");
		out.println("  <p class=\"cart_total_price\">");
		out.println("   ¥" + dish.getDiscount());
		out.println("  </p>");
		out.println(" </td>");
		out.println(" <td class=\"cart_total\" width=\"30%\">");
		out.println("  <h5>");
		out.println(dish.getDescri());
		out.println("  </h5>");
		out.println(" </td>");
		out.println(" <td class=\"cart_delete\" width=\"100\">");
		out.println("  <a class=\"cart_quantity_delete\" href=\"modifyDish.jsp?dishid="
				+ String.valueOf(dish.getDishid()) + "\">");
		out.println("   <i class=\"fa fa-pencil\">");
		out.println("   </i>");
		out.println("  </a>");
		out.println(" &nbsp;");
		out.println("  <a class=\"cart_quantity_delete\" href=\"deleteDish.jsp?dishid="
				+ String.valueOf(dish.getDishid()) + "\">");
		out.println("   <i class=\"fa fa-trash-o fa-fw\">");
		out.println("   </i>");
		out.println("  </a>");
		out.println(" </td>");
		out.println("</tr>");
	}

	// dishModify
	public static void outputDishModify(JspWriter out, Dish dish) throws IOException {
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputEmail1\">");
		out.println("  菜品ID");
		out.println(" </label>");
		out.println(
				" <input class=\"form-control\" name=\"dishID\" placeholder=\"菜品ID\" readonly=\"true\" type=\"email\" value=\""
						+ String.valueOf(dish.getDishid()) + "\">");
		out.println(" </input>");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  菜品名称");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"name\" placeholder=\"菜品名称\" type=\"text\" value=\""
				+ dish.getDishname() + "\">");
		out.println(" </input>");
		out.println("</div>");
		
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  菜品分类");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"category\" placeholder=\"菜品分类\" type=\"text\" value=\""
				+ dish.getCategoryid() + "\">");
		out.println(" </input>");
		out.println("</div>");
		
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  原价");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"price\" placeholder=\"原价\" type=\"text\" value=\""
				+ String.valueOf(dish.getPrice()) + "\">");
		out.println(" </input>");
		out.println("</div>");
		
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  描述");
		out.println(" </label>");
		out.println(" <textarea class=\"form-control\" name=\"description\" placeholder=\"描述\" rows=\"3\" \">"
				+ dish.getDescri() + "</textarea>");
		out.println(" <!-- <input type=\"text\" class=\"form-control\" id=\"description\"");
		out.println("										placeholder=\"描述\" rows=\"3\"> -->");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  图片地址");
		out.println(" </label>");
		out.println(
				" <input id=\"imgURL\" class=\"form-control\" name=\"imgURL\" placeholder=\"http://\" type=\"text\" onblur=\"giveURL()\" value=\""
						+ dish.getImgurl() + "\">");
		out.println(" </input>");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  优惠");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"discount\" placeholder=\"1.00\" type=\"text\" value=\""
				+ String.valueOf(dish.getDiscount()) + "\">");
		out.println(" </input>");
		out.println("</div>");
	}

	// dishAdd
	public static void outputDishAdd(JspWriter out) throws IOException {
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  菜品名称");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"name\" placeholder=\"菜品名称\" type=\"text\" \">");
		out.println(" </input>");
		out.println("</div>");
		
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  分类");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"category\" placeholder=\"分类\" type=\"text\" \">");
		out.println(" </input>");
		out.println("</div>");
		
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  原价");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"price\" placeholder=\"原价\" type=\"text\" \">");
		out.println(" </input>");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  描述");
		out.println(" </label>");
		out.println(
				" <textarea class=\"form-control\" name=\"description\" placeholder=\"描述\" rows=\"3\" \"></textarea>");
		out.println(" <!-- <input type=\"text\" class=\"form-control\" id=\"description\"");
		out.println("										placeholder=\"描述\" rows=\"3\"> -->");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  图片地址");
		out.println(" </label>");
		out.println(
				" <input id=\"imgURL\" class=\"form-control\" name=\"imgURL\" placeholder=\"http://\" type=\"text\" onblur=\"giveURL()\">");
		out.println(" </input>");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  优惠");
		out.println(" </label>");
		out.println(" <input class=\"form-control\" name=\"discount\" placeholder=\"1.00\" type=\"text\" value=\"\">");
		out.println(" </input>");
		out.println("</div>");
	}
	
	// dishDelete
	public static void outputDishDelete(JspWriter out, Dish dish) throws IOException {
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputEmail1\">");
		out.println("  菜品ID");
		out.println(" </label>");
		out.println(
				" <input class=\"form-control\" name=\"dishID\" placeholder=\"菜品ID\" readonly=\"true\" type=\"email\" value=\""
						+ String.valueOf(dish.getDishid()) + "\">");
		out.println(" </input>");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  菜品名称");
		out.println(" </label>");
		out.println(
				" <input class=\"form-control\" name=\"name\" placeholder=\"菜品名称\" readonly=\"true\" type=\"text\" value=\""
						+ dish.getDishname() + "\">");
		out.println(" </input>");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  原价");
		out.println(" </label>");
		out.println(
				" <input class=\"form-control\" name=\"price\" placeholder=\"原价\" readonly=\"true\" type=\"text\" value=\""
						+ String.valueOf(dish.getPrice()) + "\">");
		out.println(" </input>");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  描述");
		out.println(" </label>");
		out.println(
				" <textarea class=\"form-control\" name=\"description\" readonly=\"true\" placeholder=\"描述\" rows=\"3\" \">"
						+ dish.getDescri() + "</textarea>");
		out.println(" <!-- <input type=\"text\" class=\"form-control\" id=\"description\"");
		out.println("										placeholder=\"描述\" rows=\"3\"> -->");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  图片地址");
		out.println(" </label>");
		out.println(
				" <input class=\"form-control\" name=\"imgURL\" readonly=\"true\" placeholder=\"http://\" type=\"text\" value=\""
						+ dish.getImgurl() + "\">");
		out.println(" </input>");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputPassword1\">");
		out.println("  优惠");
		out.println(" </label>");
		out.println(
				" <input class=\"form-control\" name=\"discount\" readonly=\"true\" placeholder=\"1.00\" type=\"text\" value=\""
						+ String.valueOf(dish.getDiscount()) + "\">");
		out.println(" </input>");
		out.println("</div>");
	}

	//customerManage
	public static void outputCustomer(JspWriter out, Customer cus) throws IOException{
		out.println("<tr>");
		  out.println(" <td>");
		  out.println(cus.getUsername());
		  out.println(" </td>");
		  out.println(" <td>");
		  out.println(cus.getPassword());
		  out.println(" </td>");
		  out.println(" <td>");
		  out.println(cus.getEmail());
		  out.println(" </td>");
		  out.println(" <td width=\"50\">");
		  out.println("  <a class=\"cart_quantity_delete\" href=\"deleteCustomer.jsp?username="+cus.getUsername()+"\">");
		  out.println("   <i class=\"fa fa-trash-o fa-lg\">");
		  out.println("   </i>");
		  out.println("  </a>");
		  out.println(" </td>");
		  out.println("</tr>");
	}
	//customerDelete
	public static void outputCustomerDelete(JspWriter out, Customer cus) throws IOException{
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputEmail1\">");
		out.println("  用户");
		out.println(" </label>");
		out.println(
				" <input class=\"form-control\" name=\"dishID\" placeholder=\"用户名\" readonly=\"true\" type=\"email\" value=\""
						+ cus.getUsername() + "\">");
		out.println(" </input>");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputEmail1\">");
		out.println("  密码");
		out.println(" </label>");
		out.println(
				" <input class=\"form-control\" name=\"dishID\" placeholder=\"密码\" readonly=\"true\" type=\"email\" value=\""
						+ cus.getPassword() + "\">");
		out.println(" </input>");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println(" <label for=\"exampleInputEmail1\">");
		out.println(" 昵称");
		out.println(" </label>");
		out.println(
				" <input class=\"form-control\" name=\"dishID\" placeholder=\"昵称\" readonly=\"true\" type=\"email\" value=\""
						+ cus.getEmail() + "\">");
		out.println(" </input>");
		out.println("</div>");
	}
}

