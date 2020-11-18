<%@page import="com.cugb.javaee.starbucks.utils.JSPOutput"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.starbucks.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.starbucks.bean.Category"%>
<%@page import="com.cugb.javaee.starbucks.dao.*"%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>星巴克-分类管理</title>
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
				</ol>
			</div>
			

			<div class="review-payment">
				<h2>分类管理</h2>
			</div>

			<div class="table-responsive cart_info">

				<table class="table table-condensed">
				<thead>
					<tr class="cart_menu">
						<td class="id" width="15%">类目编号</td>
						<td class="description" width="20%">类目名称</td>
						<td><a class="cart_quantity_delete" href="addCategory.jsp"> <i
								class="fa fa-plus-circle fa-lg">新增 </i></a></td>
					</tr>
				</thead>
				<tbody>

					<%
					CategoryDAO cateDAO = (CategoryDAO) DAOFactory.newInstance("CategoryDAO");
						ArrayList<Category> arr = cateDAO.findCategories();
						for(int i = 0; i < arr.size(); i++){
							Category category = arr.get(i);
							JSPOutput.outputCategory(out, category);
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