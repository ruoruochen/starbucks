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
<title>星巴克-订单状态修改</title>
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
				<li class="active">订单状态修改</li>
			</ol>
		</div>
		
		<div class="review-payment">
			<h2>订单管理</h2>
		</div>
		<div class="step-one">
			<h2 class="heading">修改订单状态</h2>
		</div>
		
		<div class="table-responsive cart_info">


			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-5">
						<div class="shopper-info">
						 <br>
							<p>订单信息</p>
							<form action="orderModify" method="post">
								<%
								Customer admin = (Customer)session.getAttribute("loginuser") ;
								if(admin == null || !admin.getUsername().equals(ConfigFactory.readProperty("username"))){
									response.sendRedirect("login.jsp");
								}
									String id = request.getParameter("orderid");
									if(id == null) response.sendRedirect("manageOrder.jsp");
									OrderDAO orderDAO = (OrderDAO) DAOFactory.newInstance("OrderDAO");
									Order order = orderDAO.findOrder(id);
									JSPOutput.outputOrderModify(out, order);
								%>
								


								<button type="submit" class="btn btn-primary" width="80"
									padding="20">确认修改</button>
							</form>


							<br>
						</div>
					</div>
					
					<div class="col-sm-5">
						<div class="shopper-info">
						 <br>
							<p>订单包含：</p>
							<table class="table table-striped">
							<thead>
							<tr>
								<td>菜品编号</td>
								<td>菜品数量</td>
								<td>单价</td>
								<td>总价</td>
							</tr>
							</thead>
							<tbody>
								<%

									OrderItemDAO orderitemDAO=(OrderItemDAO) DAOFactory.newInstance("OrderItemDAO");
								ArrayList<OrderItem> arr =orderitemDAO.findOrderItems(request.getParameter("orderid"));
								for (int i = 0; i < arr.size(); i++) {
									OrderItem orderitem = arr.get(i);
									JSPOutput.outputOrderItem(out, orderitem);
								}
								%>
							</tbody>
							</table>
								

								


							<br>
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