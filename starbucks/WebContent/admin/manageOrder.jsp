<%@page import="com.cugb.javaee.starbucks.bean.Customer"%>
<%@page import="com.cugb.javaee.starbucks.utils.JSPOutput"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.starbucks.utils.*"%>
<%@page import="com.cugb.javaee.starbucks.bean.Order"%>
<%@page import="com.cugb.javaee.starbucks.bean.Dish"%>
<%@page import="com.cugb.javaee.starbucks.bean.OrderItem"%>
<%@page import="com.cugb.javaee.starbucks.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>星巴克-订单管理</title>
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
				<li class="active">订单管理</li>
			</ol>
		</div>
		

		<div class="review-payment">
			<h2>订单管理</h2>
		</div>

		<div class="table-responsive cart_info">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>订单号</th>
						<th>用户名</th>
						<th>提交时间</th>
						<th>数目</th>
						<th>总价</th>
						<th>状态</th>
						<th>地址</th>
						<th>电话</th>
						<th>餐厅id</th>
						<th>详情… </th>
					</tr>
				</thead>
				<tbody>
					<%
						Customer admin = (Customer)session.getAttribute("loginuser") ;
						if(admin == null || !admin.getUsername().equals(ConfigFactory.readProperty("username"))){
							response.sendRedirect("login.jsp");
						}
						OrderDAO orderDAO = (OrderDAO) DAOFactory
								.newInstance("OrderDAO");
						ArrayList<Order> arr = orderDAO.findOrders();
						for (int i = 0; i < arr.size(); i++) {
							Order order = arr.get(i);
							JSPOutput.outputOrder(out, order);
							
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