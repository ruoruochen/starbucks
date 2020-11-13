<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.starbucks.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.starbucks.bean.Dish"%>
<%@page import="com.cugb.javaee.starbucks.bean.Customer"%>
<%@page import="com.cugb.javaee.starbucks.dao.*"%>
<%@page import="com.cugb.javaee.starbucks.utils.*"%>
<%@page import="java.lang.Math"%>
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
<title>网上订餐</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->
<script type="text/javascript">
	function getValue(){
		
		alert("hhhh"+document.getElementById("num").value);
	}
</script>
<body>
	<jsp:include page="customerHeader.jsp"></jsp:include>

	<section style="margin-top: 0px; margin-bottom: 50px">
		<div class="product-details"
			style="margin-left: 100px; margin-right: 100px;">
			<!--product-details-->
			<div class="col-sm-5">
				<div class="view-product">
					<img src=${requestScope.current.getImgurl()} alt="" width="250px"/>
				</div>
				<div id="similar-product" class="carousel slide"
					data-ride="carousel">

					<a class="left item-control" href="#similar-product"
						data-slide="prev"> <i class="fa fa-angle-left"></i>
					</a> <a class="right item-control" href="#similar-product"
						data-slide="next"> <i class="fa fa-angle-right"></i>
					</a>
				</div>
			</div>
			<div class="col-sm-7">
				<div class="product-information">
					<!--/product-information-->
					<img src="images/product-details/new.png" class="newarrival" alt="">
					<h2>${requestScope.current.getDishname()}</h2>
					<p>菜品ID: ${requestScope.current.getDishid()}</p>
					<p>
						<span style="font-size: 20px"><del>￥${requestScope.current.getPrice()}</del></span>
						&nbsp;&nbsp;<span style="color: #FE980F; font-size: 22px">￥${requestScope.current.getDiscount()}</span>
					</p>
					<div class="col-sm-2">
						<p style="padding-top: 5px; font-size: 16px">数量
						<form action="action" method="POST" name="loginForm">
							</p>
					</div>
					<p class="col-sm-2" style="margin-left: -40px">

						<select class="form-control" name="number" >
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select>
					</p>
					<input type="hidden" name="dishid"
						value=${requestScope.current.getDishid()}>

					<input type="hidden" name="actiontype" value="cart">
					<button type="submit" class="btn btn-default cart">
						<i class="fa fa-shopping-cart fa-lg"></i>&nbsp;&nbsp;&nbsp;加入购物车
					</button>
					</form>
					<p></p>
					<p>
						<b>描述:</b> ${requestScope.current.getDescri()}
					</p>
				</div>

			</div>
		</div>
		<!--/product-details-->


	</section>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>