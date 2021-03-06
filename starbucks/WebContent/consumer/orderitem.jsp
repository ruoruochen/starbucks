<%@page import="com.cugb.javaee.starbucks.bean.OrderItem"%>
<%@page import="com.cugb.javaee.starbucks.bean.Order"%>
<%@page import="com.cugb.javaee.starbucks.bean.CartItem"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.starbucks.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.starbucks.bean.Dish"%>
<%@page import="com.cugb.javaee.starbucks.bean.Customer"%>
<%@page import="com.cugb.javaee.starbucks.dao.*"%>
<%@page import="com.cugb.javaee.starbucks.biz.*"%>
<%@page import="com.cugb.javaee.starbucks.utils.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>订单详情</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link href="../css/prettyPhoto.css" rel="stylesheet">
<link href="../css/price-range.css" rel="stylesheet">
<link href="../css/animate.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
<link href="../css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="../images/ico/favicon.ico">
<link rel="./apple-touch-icon-precomposed" sizes="144x144"
	href="../images/ico/apple-touch-icon-144-precomposed.png">
<link rel="./apple-touch-icon-precomposed" sizes="114x114"
	href="../images/ico/apple-touch-icon-114-precomposed.png">
<link rel="./apple-touch-icon-precomposed" sizes="72x72"
	href="../images/ico/apple-touch-icon-72-precomposed.png">
<link rel="./apple-touch-icon-precomposed"
	href="../images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->
<style>
	.comment:hover{
	text-decoration:underline;
	color:#006439;
	}
	.comment{
	font-size:16px;
	}
</style>
<body>
	 <jsp:include page="customerHeader.jsp"></jsp:include>
	
	<section id="cart_items" style="margin-bottom: 20px">
	<script>
    function linkClick(linkObject) {
        
    	     var formObject = document.createElement('form');  
    	      document.body.appendChild(formObject);  
    	       formObject.setAttribute('method', 'post');  
    	       var url = linkObject.href;  
    	       var uri = '';  
    	       var i = url.indexOf('?');  
    	               
    	      if(i == -1) {
        
    	        formObject.action = url;  
    	      } else {
        
    	         formObject.action = url.substring(0, i);  
    	      }  
    	               
    	      if( i >= 0 && url.length >= i + 1) {
        
    	         uri = url.substring(i + 1, url.length);  
    	      }  
    	   
          var sa = uri.split('&');  
    	               
    	      for(var i = 0; i < sa.length; i++) {
        
    	        var isa = sa[i].split('=');        
    	        var inputObject = document.createElement('input');  
    	        inputObject.setAttribute('type', 'hidden');  
    	        inputObject.setAttribute('name', isa[0]);  
    	        inputObject.setAttribute('value', isa[1]);  
    	        formObject.appendChild(inputObject);  
    	      }  
    	               
    	      formObject.submit();  
    	              
    	      return false;  
    	 }  
    </script>
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">Shopping Cart</li>
				</ol>
			</div>

			<div class="table-responsive cart_info">
				
				<table class="table table-condensed">
				<thead align="center">
				<tr class="cart_menu">
				<td class="description">订单号</td>
				<td class="image"></td>
				<td class="description">商&nbsp;&nbsp;品</td>
				<td class="total" >总&nbsp;&nbsp;数</td>
				<td class="total" >价&nbsp;&nbsp;格</td>
				<td class="total" >总&nbsp;&nbsp;价</td>
				<td class="total" >评&nbsp;&nbsp;论</td>
				</tr>
				</thead>
				<tbody>
					<%
						OrderItemDAO orderitemdao = (OrderItemDAO) DAOFactory.newInstance("OrderItemDAO");
						DishDAO dishdao = (DishDAO) DAOFactory.newInstance("DishDAO"); 
						String orderid=request.getParameter("orderid");		
						ArrayList<OrderItem> arr =orderitemdao.findOrderItems(orderid) ;
						System.out.println("orderid的orderitem:"+arr);
							float totalPrice = 0.0f;
							int totalNum = 0;
							for(OrderItem orderitem:arr) {		
								out.println("<tr align=\"center\">");
								out.println(" <td class=\"description\">");
								out.println("  <h4>");
								out.println(orderid);
								out.println("  </h4>");
								out.println(" </td>");
								
								Dish cur = dishdao.findDish(orderitem.getDishid());
								out.println(" <td class=\"cart_product\">");
								out.println("  <a href=\"\">");
								out.println("   <img alt=\"\" src=\"" + cur.getImgurl() + "\" width=\"200px\"/>");
								out.println("  </a>");
								out.println(" </td>");
								
								out.println(" <td class=\"cart_description\">");
								out.println("  <h4>");
								out.println(" <a onclick=\"return linkClick(this)\" href=\"action?actiontype=detail&dishid=" + String.valueOf(orderitem.getDishid()) + "\">");
								out.println(cur.getDishname());
								out.println("   </a>");
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"total\">");
								out.println("  <h4>");
								out.println(orderitem.getCount());
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"total\">");
								out.println("  <h4>¥");
								out.println(orderitem.getPrice());
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"total\">");
								out.println("  <h4>¥");
								out.println(orderitem.getFinalprice());
								out.println("  </h4>");
								out.println(" </td>");
								
								out.println(" <td class=\"total\">");
								out.println("<a class=\"comment\" onclick=\"return linkClick(this)\" href=\"action?actiontype=comment&dishid=" + String.valueOf(orderitem.getDishid())+ "\">");
								out.println("评论</a>");			 
								//out.println("1");
								out.println(" </td>");
								out.println("</tr>");
							}
						%>	
				</tbody>
				</table>
			</div>
		</div>
	</section>
	<!--/#cart_items-->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>