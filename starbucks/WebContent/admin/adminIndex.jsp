<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.starbucks.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.starbucks.bean.Dish"%>
<%@page import="com.cugb.javaee.starbucks.bean.Customer"%>
<%@page import="com.cugb.javaee.starbucks.dao.*"%>
<%@page import="com.cugb.javaee.starbucks.biz.*"%>
<%@page import="com.cugb.javaee.starbucks.utils.*"%>
<%@page import="com.cugb.javaee.starbucks.utils.ConfigFactory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%

if(session.getAttribute("pageSize") == null){
	// 第一次访问该页面
	session.setAttribute("pageSize", ConfigFactory.readProperty("pageSize"));
}
if(request.getParameter("pageNO") == null){
	request.setAttribute("pageNO", "1");
}
else{
	request.setAttribute("pageNO", request.getParameter("pageNO"));
}


//根据页码生成相应的dishlist
int pageNO = Integer.parseInt((String)request.getAttribute("pageNO"));
int pageSize = Integer.parseInt((String)session.getAttribute("pageSize"));
DishService dishserv = new DishService();
PageModel<Dish> pagemodel = dishserv.findDish4PageList(pageNO, pageSize);
request.setAttribute("dishlist", pagemodel.getList());
request.setAttribute("pageModel", pagemodel); 




%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>网上订餐</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link href="../css/prettyPhoto.css" rel="stylesheet">
<link href="../css/price-range.css" rel="stylesheet">
<link href="../css/animate.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
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
<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="adminIndex.jsp"><img src="../images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								
								<%
									Customer cus = (Customer) session.getAttribute("loginuser");
									String adminUsername = ConfigFactory.readProperty("username");
									
									if(cus.getUsername().equals(adminUsername) ){
										out.println("<li><a href=\"adminIndex.jsp\"></i>欢迎管理员："+cus.getUsername()+"</a></li>");
									}
									else{
										response.sendRedirect("login.jsp");
									}
								%>	
								<li><a href="aaction?actiontype=logOut" >注销</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<!-- <div class="header-bottom">header-bottom
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="adminIndex.jsp">首页</a></li>
								<li class="dropdown"><a href="manageDish.jsp">菜品管理</a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="#"></a></li>
										<li><a href="manageDish.jsp"  class="active">菜品详情</a></li> 
										<li><a href="addDish.jsp">新增菜品</a></li> 
                                    </ul>
                                </li> 
                                <li><a href="manageCategory.jsp">分类管理</a></li>
                                <li><a href="manageRestaurant.jsp">餐厅管理</a></li>
                                <li><a href="manageComment.jsp">评论管理</a></li>
                                <li><a href="manageOrder.jsp">订单管理</a></li>
								<li><a href="manageCustomer.jsp">用户管理</a></li>
								<li class="dropdown"><a href="https://www.starbucks.com.cn/about/">关于我们</i></a></li> 
								
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						
					</div>
				</div>
			</div>
		</div> --><!--/header-bottom-->

<section>
		<div class="container">
			<div class="row col-sm-12">
						<img width="100%" alt="" src="https://www-static.chinacdn.starbucks.com.cn/prod/assets/images/featured/20201103/4.jpg">
					</div>
			<div class="row">
				
				<jsp:include page="adminSidenav.jsp"></jsp:include>
				<div class="col-sm-10 padding-right">
					<!--features_items-->
					
					
					<div class="category-tab"><!--category-tab-->
						
						<div class="tab-content">

							
							<div class="tab-pane fade active in">

								<c:forEach items="${requestScope.dishlist}" var="currentdish"
									varStatus="status">
									<div class="col-sm-3">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<a   href="aaction?actiontype=detail&dishid=${currentdish.getDishid()}"><img src="${currentdish.getImgurl()}" alt="" width="256px" height="256px"></a>													
													<h2>¥${currentdish.getPrice()}</h2>
													<a  href="aaction?actiontype=detail&dishid=${currentdish.getDishid()}"><p>${currentdish.getDishname()}</p></a>
													<a  href="aaction?actiontype=detail&dishid=${currentdish.getDishid()}" class="btn btn-default add-to-cart"><i class="fa fa-eye"></i>详情</a>
													&nbsp;
													
												</div>

											</div>
										</div>
									</div>
								</c:forEach>


								


							</div>

						</div>
					</div><!--/category-tab-->
					
					<div class="col-sm-12">
						<table>
						
					<tr>
					<ul class="pager">
					<li><a name="btnTopPage" id="btnTopPage" href="adminIndex.jsp?pageNO=1">首页</a></li>
    <li><a name="btnPreviousPage" id="btnPreviousPage"
									href="adminIndex.jsp?pageNO=${requestScope.pageModel.prevPageNO}">上一页</a></li>
    <li class="disabled"><a href="#">${requestScope.pageModel.getPageNO()} / ${requestScope.pageModel.bottomPageNO}
</a></li>
    <li><a name="btnNextPage" id="btnNextPage"
									href="adminIndex.jsp?pageNO=${requestScope.pageModel.nextPageNO}" >下一页</a></li>
    <li><a name="btnBottomPage"	id="btnBottomPage"
									href="adminIndex.jsp?pageNO=${requestScope.pageModel.bottomPageNO}">尾页</a></li>
</ul>
					</tr>
						</table>
					
					</div>
					
				</div>
			</div>
		</div>
	</section>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>