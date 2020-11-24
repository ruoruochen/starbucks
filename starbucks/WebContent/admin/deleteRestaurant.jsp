<%@page import="com.cugb.javaee.starbucks.utils.ConfigFactory"%>
<%@page import="com.cugb.javaee.starbucks.bean.Customer"%>
<%@page import="com.cugb.javaee.starbucks.bean.Category"%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.cugb.javaee.starbucks.utils.JSPOutput"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.starbucks.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.starbucks.bean.Restaurant"%>
<%@page import="com.cugb.javaee.starbucks.dao.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>星巴克-用户删除</title>
 <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/prettyPhoto.css" rel="stylesheet">
    <link href="../css/price-range.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<link href="../css/responsive.css" rel="stylesheet">

<body>
	
 
 	<jsp:include page="adminHeader.jsp"></jsp:include>
	<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<ol class="breadcrumb">
				<li><a href="#">Admin</a></li>
				<li class="active">餐厅管理</li>
				<li class="active">删除餐厅</li>
			</ol>
		</div>
		

		<!--/register-req-->


		<div class="review-payment">
			<h2>餐厅管理</h2>
		</div>
		<div class="step-one">
			<h2 class="heading">删除餐厅信息</h2>
		</div>

		<div class="register-req" style="background-color: #FFC0CB;">
			<p class="bg-danger">
				<%
				String check = request.getParameter("check");
				if(check == null){
					out.println("请注意，删除之后分类信息无法恢复");
				}
				else{
					out.println("已删除");
				}
			%>
			</p>
		</div>
		<div class="table-responsive cart_info">


			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<div class="shopper-info">
							<br>
							<p>餐厅信息</p>
							<%
							Customer admin = (Customer)session.getAttribute("loginuser") ;
							if(admin == null || !admin.getUsername().equals(ConfigFactory.readProperty("username"))){
								response.sendRedirect("login.jsp");
							}
							
							String restaurantid = request.getParameter("restaurantid");
							
							if(restaurantid == null){
								response.sendRedirect("manageRestaurant.jsp");
							}
							
							%>
							<form action="deleteRestaurant.jsp?restaurantid=<%=restaurantid %>" method="post">
								<%
									
									RestaurantDAO restaurantDAO = (RestaurantDAO)DAOFactory.newInstance("RestaurantDAO");
									Restaurant restaurant = restaurantDAO.findRestaurant(Integer.parseInt(restaurantid));
									JSPOutput.outputRestaurantDelete(out, restaurant);
								%>


								<input name="check" value="1" hidden=1></input>

								<%
								if(check == null){
									out.println("<button type=\"submit\" class=\"btn btn-danger\" width=\"80\" padding=\"20\">确认删除</button>");
								}
								else{
									
									restaurantDAO.removeRestaurant(Integer.parseInt(restaurantid));
								}
								%>

							</form>


							<br>
						</div>
					</div>
					<div class="col-sm-4"></div>


				</div>


			</div>
		</div>



	</div>

	</div>
	</section>
	<!--/#cart_items-->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>