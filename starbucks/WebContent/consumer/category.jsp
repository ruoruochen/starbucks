<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.starbucks.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.starbucks.bean.Dish"%>
<%@page import="com.cugb.javaee.starbucks.bean.Customer"%>
<%@page import="com.cugb.javaee.starbucks.bean.Category"%>
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
<title>商品分类</title>
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
<style>
.container {
    overflow: hidden;
}
.containerleft{
    
}
.caption {
    color: rgba(0, 0, 0, 0.56);
    font-size: 14px;
    font-size: 1.4rem;
    font-weight: 700;
    letter-spacing: 1;
    text-transform: uppercase;
}
ul li {
    display: block;
    margin: 0;
    padding: 0;
    text-align: -webkit-match-parent;
}
</style>
<body>
	<jsp:include page="customerHeader.jsp"></jsp:include>

	<section style="margin-top: 0px; margin-bottom: 50px" width=100%>
		<div class="container" width=30%>
	      <nav class="containerleft">
	      <ul class="subcategories">    
	        <%
	        
	        CategoryDAO cgdao = (CategoryDAO) DAOFactory.newInstance("CategoryDAO");
	        ArrayList<Category> arr = cgdao.findCategorys();	
	        /* System.out.println("哈哈哈哈哈");
	        System.out.println(arr); */
	        for(Category category:arr) {	
	          out.println("<li>");
	          /* System.out.println(category.getCategoryid());
	          System.out.println(category.getCategoryname()); */
	          out.println(" <a id=\"side_menu_modern_mixology\" href=\"category.jsp?categoryid="+category.getCategoryid()+"\">");
	          out.println(category.getCategoryname());
	          out.println("	</a>");
	          out.println("</li>"); 
	        }
	       %>
	      </ul>
		</nav>
	  </div>
	  
	  <div class="container" width=70%>
	  	<h3 class="caption">
	  		<%=request.getParameter("categoryname")%>
	  	</h3>
	  	<ul class="grid padded-3 product">
	  	<%
	  	DishDAO dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
	  	ArrayList<Dish> dishes;
	  	if(request.getParameter("categoryid")==null){
	  		dishes=dishdao.findDishbyCategoryid(1);
	  	}
	  	else{
	  		dishes = dishdao.findDishbyCategoryid(Integer.parseInt(request.getParameter("categoryid")));	
	  	}
	  	System.out.println(request.getParameter("categoryid")); 
 	        for(Dish dish:dishes) {	
	          out.println("<li>");
	          out.println("<a id=\"menu-product-related-caramel-espresso-frappuccino\" href=\"action?actiontype=detail&dishid="+dish.getDishid()+"\">");
	          out.println("<div class=\"preview circle\" style=\"background-image: url(&quot;"+dish.getImgurl()+";)\"></div>");
	          out.println("<strong>"+dish.getDishname()+"</strong>");
	          out.println("</a>");
	          out.println("</li>");
	        }  
	       
       %>
  	 	</ul>
	</div>  
  </section>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>