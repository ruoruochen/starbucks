<%@page import="com.cugb.javaee.starbucks.utils.ConfigFactory"%>
<%@page import="com.cugb.javaee.starbucks.bean.Customer"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.cugb.javaee.starbucks.utils.JSPOutput"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.starbucks.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.starbucks.bean.Dish"%>
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
	<%---<header id="header"> <!--header-->
	<div class="header_top">
		<!--header_top-->
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="contactinfo">
						<ul class="nav nav-pills">
							<li><a href=""><i class="fa fa-phone"></i> +2 95 01 88
									821</a></li>
							<li><a href=""><i class="fa fa-envelope"></i>
									info@domain.com</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="social-icons pull-right">
						<ul class="nav navbar-nav">
							<li><a href=""><i class="fa fa-facebook"></i></a></li>
							<li><a href=""><i class="fa fa-twitter"></i></a></li>
							<li><a href=""><i class="fa fa-linkedin"></i></a></li>
							<li><a href=""><i class="fa fa-dribbble"></i></a></li>
							<li><a href=""><i class="fa fa-google-plus"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header_top-->

	<div class="header-middle">
		<!--header-middle-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="logo pull-left">
						<a href="index.html"><img src="images/home/logo.png" alt=""></a>
					</div>
					<div class="btn-group pull-right">
						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle usa"
								data-toggle="dropdown">
								USA <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="">Canada</a></li>
								<li><a href="">UK</a></li>
							</ul>
						</div>

						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle usa"
								data-toggle="dropdown">
								DOLLAR <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="">Canadian Dollar</a></li>
								<li><a href="">Pound</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="shop-menu pull-right">
						<ul class="nav navbar-nav">
							<li><a href=""><i class="fa fa-user"></i> Account</a></li>
							<li><a href=""><i class="fa fa-star"></i> Wishlist</a></li>
							<li><a href="checkout.html" class="active"><i
									class="fa fa-crosshairs"></i> Checkout</a></li>
							<li><a href="cart.html"><i class="fa fa-shopping-cart"></i>
									Cart</a></li>
							<li><a href="login.html"><i class="fa fa-lock"></i>
									Login</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-middle-->

	<div class="header-bottom">
		<!--header-bottom-->
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="mainmenu pull-left">
						<ul class="nav navbar-nav collapse navbar-collapse">
							<li><a href="index.html">Home</a></li>
							<li class="dropdown"><a href="#">Shop<i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="shop.html">Products</a></li>
									<li><a href="product-details.html">Product Details</a></li>
									<li><a href="checkout.html" class="active">Checkout</a></li>
									<li><a href="cart.html">Cart</a></li>
									<li><a href="login.html">Login</a></li>
								</ul></li>
							<li class="dropdown"><a href="#">Blog<i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="blog.html">Blog List</a></li>
									<li><a href="blog-single.html">Blog Single</a></li>
								</ul></li>
							<li><a href="404.html">404</a></li>
							<li><a href="contact-us.html">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="search_box pull-right">
						<input type="text" placeholder="Search">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-bottom--> </header>
	<!--/header-->
 --%>
 
 	<jsp:include page="adminHeader.jsp"></jsp:include>
	<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<ol class="breadcrumb">
				<li><a href="#">Admin</a></li>
				<li class="active">用户管理</li>
				<li class="active">删除用户信息</li>
			</ol>
		</div>
		<!--/breadcrums-->

		<!-- <div class="step-one">
				<h2 class="heading">菜品管理</h2>
			</div> -->
		<!--/checkout-options-->

		<!--/register-req-->


		<div class="review-payment">
			<h2>用户管理</h2>
		</div>
		<div class="step-one">
			<h2 class="heading">删除用户信息</h2>
		</div>

		<div class="register-req" style="background-color: #FFC0CB;">
			<p class="bg-danger">
				<%
				String check = request.getParameter("check");
				if(check == null){
					out.println("请注意，删除之后用户信息无法恢复");
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
							<p>用户信息</p>
							<%
							Customer admin = (Customer)session.getAttribute("loginuser") ;
							if(admin == null || !admin.getUsername().equals(ConfigFactory.readProperty("username"))){
								response.sendRedirect("login.jsp");
							}
							
							String username = request.getParameter("username");
							
							if(username == null){
								response.sendRedirect("customerManage.jsp");
							}
							
							%>
							<form action="customerDelete.jsp?username=<%=username %>" method="post">
								<%
									
									CustomerDAO cusDAO = (CustomerDAO)DAOFactory.newInstance("CustomerDAO");
									OrderDAO ordDAO=(OrderDAO)DAOFactory.newInstance("OrderDAO");
									Customer cus = cusDAO.findCustomer(username);
									JSPOutput.outputCustomerDelete(out, cus);
								%>


								<input name="check" value="1" hidden=1></input>

								<%
								if(check == null){
									out.println("<button type=\"submit\" class=\"btn btn-danger\" width=\"80\" padding=\"20\">确认删除</button>");
								}
								else{
									
									cusDAO.removeCustomer(username);
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