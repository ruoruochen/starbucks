<%@page import="com.cugb.javaee.starbucks.utils.JSPOutput"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.starbucks.utils.*"%>
<%@page import="com.cugb.javaee.starbucks.bean.*"%>
<%@page import="com.cugb.javaee.starbucks.dao.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Checkout | E-Shopper</title>
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
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->
<body>
	<jsp:include page="adminHeader.jsp"></jsp:include>

	<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<ol class="breadcrumb">
				<li><a href="#">Admin</a></li>
				<li class="active">菜品管理</li>
				<li class="active">删除菜品信息</li>
			</ol>
		</div>
		<!--/breadcrums-->

		<!-- <div class="step-one">
				<h2 class="heading">菜品管理</h2>
			</div> -->
		<!--/checkout-options-->

		<!--/register-req-->


		<div class="review-payment">
			<h2>菜品管理</h2>
		</div>
		<div class="step-one">
			<h2 class="heading">删除菜品信息</h2>
		</div>
		
		<div class="register-req" style="background-color:#FFC0CB;">
			<p class="bg-danger"><%
				String check = request.getParameter("check");
				if(check == null){
					out.println("请注意，删除之后菜品信息无法恢复");
				}
				else{
					out.println("已删除");
				}
			%></p>
		</div>
		<div class="table-responsive cart_info">


			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-5">
						<div class="shopper-info">
						 <br>
							<p>菜品信息</p>
							<%
							Customer admin = (Customer)session.getAttribute("loginuser") ;
							if(admin == null || !admin.getUsername().equals(ConfigFactory.readProperty("username"))){
								response.sendRedirect("login.jsp");
							}
							String id = request.getParameter("dishid");
							if(id == null) response.sendRedirect("dishManage.jsp");
							%>
							<form action="dishDelete.jsp?dishid=<%=id %>" method="post">
								<%
									
									DishDAO disDAO = (DishDAO) DAOFactory.newInstance("DishDAO");
									//DishDAO disDAO = (DishDAO) DAOFactory.newInstance("com.cugb.javaee.onlinefoodcourt.dao.IDishDAO");
									Dish dish = disDAO.findDish(Integer.parseInt(id));
									JSPOutput.outputDishDelete(out, dish);
								%>
								
							
								<input name="check" value="1" hidden=1></input>
								
								<%
								if(check == null){
									out.println("<button type=\"submit\" class=\"btn btn-danger\" width=\"80\" padding=\"20\">确认删除</button>");
								}
								else{
									disDAO.removeDish(dish.getDishid());
								}
								%>
								
							</form>


							<br>
						</div>
					</div>
					<div class="col-sm-1"></div>
					<div class="col-sm-4">
						<div class="order-message">
						 
							<br>
							<p>图片预览</p>
							<img
								<%
									out.println("src="+dish.getImgurl());
								%>
								height="335" width="335">


						</div>
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