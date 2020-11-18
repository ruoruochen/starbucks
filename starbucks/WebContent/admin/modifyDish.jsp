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
<title>星巴克-菜品修改</title>
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
<script>
function giveURL()
{
	var element = document.getElementById("dishImg");
	var inbox = document.getElementById("imgURL");
	var url = inbox.value.substr(0,93);
	url += "335x335";
	element.src=url;
}
</script>
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
				<li class="active">菜品信息修改</li>
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
			<h2 class="heading">修改菜品信息</h2>
		</div>
		<div class="register-req">
			<p>请注意，修改之后将无法恢复原信息</p>
		</div>
		<div class="table-responsive cart_info">


			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-5">
						<div class="shopper-info">
						 <br>
							<p>菜品信息</p>
							<form action="dishModify" method="post">
								<%
								Customer admin = (Customer)session.getAttribute("loginuser") ;
								if(admin == null || !admin.getUsername().equals(ConfigFactory.readProperty("username"))){
									response.sendRedirect("login.jsp");
								}
									String id = request.getParameter("dishid");
									if(id == null) response.sendRedirect("manageDish.jsp");
									DishDAO disDAO = (DishDAO) DAOFactory.newInstance("DishDAO");
									Dish dish = disDAO.findDish(Integer.parseInt(id));
									JSPOutput.outputDishModify(out, dish);
								%>
								


								<button type="submit" class="btn btn-primary" width="80"
									padding="20">确认修改</button>
							</form>


							<br>
						</div>
					</div>
					<div class="col-sm-1"></div>
					<div class="col-sm-4">
						<div class="order-message">
						 
							<br>
							<p>图片预览</p>
							<img id="dishImg"
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