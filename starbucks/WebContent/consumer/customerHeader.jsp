<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cugb.javaee.starbucks.bean.Customer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<header id="header"><!--header-->


	<div class="header-middle">
		<!--header-middle-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="logo pull-left">
						<a href="customerIndex.jsp"><img src="../images/home/logo.png" alt="" /></a>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="shop-menu pull-right">
						<ul class="nav navbar-nav">
							 <li><a href="action?actiontype=checkout">去下单</a></li>
							<li><a href="action?actiontype=goCart">我的购物车</a></li>
							<%
									Customer cuss = (Customer) session.getAttribute("loginuser");
									if(cuss == null){
										out.println("<li><a href=\"customerLogin.jsp\">请登录</a></li>");
									}
									else{
										out.println("<li><a href=\"\"></i>欢迎："+cuss.getUsername()+"</a></li>");
										out.println("<li><a href=\"action?actiontype=logOut\"></i>注销</a></li>");
									}
								%>
							<!--  <li><a href="login.jsp" class="active">登录</a></li>-->
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
							<li><a href="customerIndex.jsp">首页</a></li>
							<li><a href="order.jsp">我的订单</a></li>
							<li><a href="modifyInformation.jsp">修改信息</a></li>
							<li class="dropdown"><a href="about.jsp">关于我们</i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="search_box pull-right">
					<form action="action?actiontype=search" method="post" >
					<input type="text" placeholder="吃点啥？" name="query" >&nbsp; 
						<button class="btn btn-default get" style="margin-top: 0px" id="search"><i
							class="fa fa-search"></i> 搜索 </button>
							<input type="hidden" name="actiontype" value="search">
							<input type="hidden" name="pageNO" value="1">
					</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-bottom--> </header>
	<!--/header-->
</body>
</html>