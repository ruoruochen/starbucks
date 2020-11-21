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
<title>评论商品</title>
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

<body>
	<jsp:include page="customerHeader.jsp"></jsp:include>
	
	<section id="cart_items" style="margin-bottom:20px">

		<div class="container">
			<div class="table-responsive cart_info">

				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="img"></td>
							<td class="description">商品</td>
							<td class="price" style="padding-left:200px;">评论</td>
						</tr>
					</thead>
					<tbody>
						<%
								DishDAO ff = (DishDAO) DAOFactory.newInstance("DishDAO");
						CommentDAO cdao = (CommentDAO) DAOFactory.newInstance("CommentDAO");
								Customer cuss = (Customer) session.getAttribute("loginuser");
								int dishid = Integer.parseInt(request.getParameter("dishid"));
								Dish cur = ff.findDish(dishid); 
								
								out.println("<tr>");
								out.println(" <td class=\"cart_product\">");
								out.println("  <a href=\"\">");
								out.println("   <img alt=\"\" src=" + cur.getImgurl() + " width=\"256px\" height=\"256px\"/>");
								out.println("  </a>");
								out.println(" </td>");
								
								
								out.println(" <td class=\"cart_description\">");
								out.println(" <a style=\"color:black;\" href=\"action?actiontype=detail&dishid=" + String.valueOf(dishid) + "\">");
								out.println(cur.getDishname());
								out.println("   </a>");
								out.println(" </td>");
								
								out.println("<td>");
								out.println("<form style=\"margin-right:50px;\" action=\"CommentAdd?username="+cuss.getUsername()+"&dishid="+dishid+"\" method=\"POST\" name=\"commentForm\">");
								out.println("<textarea id=\"texta\"  name=\"commenttext\"   cols=\"45\" rows=\"8\" value=\"请输入您对商品的评论...\">");
								out.println("</textarea>");
								out.println("<input type=\"hidden\" name=\"actiontype\" value=\"addcomment\">");
								out.println("<button onClick=\"test()\" style=\"float:right;margin-top:20px;\" type=\"submit\" class=\"btn btn-default\">提交</button>");
								out.println("</form>");
								out.println("</td>");
								out.println("</tr>");
						%>
						<script>
    				 function test(){
        			 var f = document.getElementsByTagName("form")[1];
       			  f.action=f.action+"&commenttext="+document.getElementById("texta").value;
        			 alert(f.action);
   					  }
 						</script>
					</tbody>
				</table>
			</div>
	</section>
	<!--/#comment_items-->

	
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>