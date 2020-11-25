<%@page import="com.cugb.javaee.starbucks.utils.ConfigFactory"%>
<%@page import="com.cugb.javaee.starbucks.bean.Customer"%>
<%@page import="com.cugb.javaee.starbucks.bean.Category"%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.cugb.javaee.starbucks.utils.JSPOutput"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.starbucks.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.starbucks.bean.Customer"%>
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
				<li class="active">分类管理</li>
				<li class="active">删除分类</li>
			</ol>
		</div>
		

		<!--/register-req-->


		<div class="review-payment">
			<h2>分类管理</h2>
		</div>
		<div class="step-one">
			<h2 class="heading">删除分类信息</h2>
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
							<p>分类信息</p>
							<%
							Customer admin = (Customer)session.getAttribute("loginuser") ;
							if(admin == null || !admin.getUsername().equals(ConfigFactory.readProperty("username"))){
								response.sendRedirect("login.jsp");
							}
							
							String categoryid = request.getParameter("categoryid");
							
							if(categoryid == null){
								response.sendRedirect("manageCategory.jsp");
							}
							
							%>
							<form action="deleteCategory.jsp?categoryid=<%=categoryid %>" method="post">
								<%
									
									CategoryDAO categoryDAO = (CategoryDAO)DAOFactory.newInstance("CategoryDAO");
									Category category = categoryDAO.findCategory(Integer.parseInt(categoryid));
									JSPOutput.outputCategoryDelete(out, category);
								%>


								<input name="check" value="1" hidden=1></input>

								<%
								if(check == null){
									out.println("<button type=\"submit\" class=\"btn btn-danger\" width=\"80\" padding=\"20\">确认删除</button>");
								}
								else{
									
									categoryDAO.removeCategory(Integer.parseInt(categoryid));
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