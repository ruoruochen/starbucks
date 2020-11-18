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
<title>星巴克-菜品管理</title>
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

			<div class="table-responsive cart_info">

				<table class="table table-condensed">
				<thead>
					<tr class="cart_menu">
						<td class="image" width="15%">菜品图片</td>
						<td class="description" width="20%">名称</td>
						<td class="description" width="20%">分类</td>
						<td class="price" width="10%">价格</td>
						<td class="price" width="7%">折扣</td>
						<td class="total" width="40%">描述</td>
						<td><a class="cart_quantity_delete" href="addDish.jsp"> <i
								class="fa fa-plus-circle fa-lg">新增 </i></a></td>
					</tr>
				</thead>
				<tbody>

					<%
						DishDAO disDAO = (DishDAO) DAOFactory.newInstance("DishDAO");
						ArrayList<Dish> arr = disDAO.findDishs();
						for(int i = 0; i < arr.size(); i++){
							Dish dish = arr.get(i);
							JSPOutput.outputDish(out, dish);
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