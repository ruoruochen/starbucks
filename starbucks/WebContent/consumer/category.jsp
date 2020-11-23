<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
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
<style type="text/css">
.container {
    overflow: hidden;
}
.containerleft{
    
}
.caption {
    color: rgba(0, 0, 0, 0.56);
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
ul li a{
	color:black;
	font-size:20px;
}
</style>
<body>
	<jsp:include page="customerHeader.jsp"></jsp:include>

	<section style="margin-top: 0px;margin-bottom: 50px" width=100%>
		<div class="container" style="margin-top: 100px;width:20%;float:left;" >
	      <nav class="containerleft">
	      <ul class="subcategories">   
	      <li style="font-size:30px;color:#006439;">分类</li>
	     	</br>
	        <%
	        
	        CategoryDAO cgdao = (CategoryDAO) DAOFactory.newInstance("CategoryDAO");
	        ArrayList<Category> arr = cgdao.findCategorys();	
	        /* System.out.println("哈哈哈哈哈");
	        System.out.println(arr); */
	        for(Category category:arr) {	
	          out.println("<li>~");
	          /* System.out.println(category.getCategoryid());
	          System.out.println(category.getCategoryname()); */
	          out.println(" <a onclick=\"return linkClick(this)\" id=\"side_menu_modern_mixology\" href=\"category.jsp?categoryid="+category.getCategoryid()+"\">");
	          out.println(category.getCategoryname());
	          out.println("	</a>");
	          out.println("</li>"); 
	          out.println("</br>");
	        }
	       %>
	      </ul>
		</nav>
	  </div>
	  <script>
    function linkClick(linkObject) {
        
    	     var formObject = document.createElement('form');  
    	      document.body.appendChild(formObject);  
    	       formObject.setAttribute('method', 'post');  
    	       var url = linkObject.href;  
    	       var uri = '';  
    	       var i = url.indexOf('?');  
    	               
    	      if(i == -1) {
        
    	        formObject.action = url;  
    	      } else {
        
    	         formObject.action = url.substring(0, i);  
    	      }  
    	               
    	      if( i >= 0 && url.length >= i + 1) {
        
    	         uri = url.substring(i + 1, url.length);  
    	      }  
    	   
          var sa = uri.split('&');  
    	               
    	      for(var i = 0; i < sa.length; i++) {
        
    	        var isa = sa[i].split('=');        
    	        var inputObject = document.createElement('input');  
    	        inputObject.setAttribute('type', 'hidden');  
    	        inputObject.setAttribute('name', isa[0]);  
    	        inputObject.setAttribute('value', isa[1]);  
    	        formObject.appendChild(inputObject);  
    	      }  
    	               
    	      formObject.submit();  
    	              
    	      return false;  
    	 }  
    </script>
	  
	  <div class="container" style="width:80%;">
	  <%	 	
	  	DishDAO dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
	  	String cgn;
	  	ArrayList<Dish> dishes;
	  	if(request.getParameter("categoryid")==null){
	  		dishes=dishdao.findDishbyCategoryid(1);
	  		cgn=cgdao.findCategory(1).getCategoryname();
	  	}
	  	else{
	  		dishes = dishdao.findDishbyCategoryid(Integer.parseInt(request.getParameter("categoryid")));
	  		cgn=cgdao.findCategory(Integer.parseInt(request.getParameter("categoryid"))).getCategoryname();
	  	}
	  	//System.out.println(request.getParameter("categoryid")); 
	  	out.println("<h2 class=\"caption\">");
	  	//cgn=URLEncoder.encode(cgn,"UTF-8");
	  	 out.println(cgn);
	  	 out.println("</h2>");
 	        for(Dish dish:dishes) {	
 	        	out.println("<div class=\"col-sm-3\">");
 	        	out.println("<div class=\"product-image-wrapper\">");
 	        	out.println("<div class=\"productinfo text-center\">");
 	        	out.println("<a  href=\"action?actiontype=detail&dishid="+dish.getDishid()+"\"><img src="+dish.getImgurl()+"  width=\"256px\" height=\"256px\"></a>	");												
 	        	out.println("<h2>¥"+dish.getPrice()+"</h2>");
 	        	out.println("<a href=\"action?actiontype=detail&dishid="+dish.getDishid()+"\"><p>"+dish.getDishname()+"</p></a>");
 	        	out.println("<a href=\"action?actiontype=detail&dishid="+dish.getDishid()+"\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-eye\"></i>详情</a>");
 	        	out.println("  ");
 	        	out.println("<a href=\"action?actiontype=addone&dishid="+dish.getDishid()+"\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>加购</a>");
 	        	out.println("</div>");
 	        	out.println("</div>");
 	        	out.println("</div>");
 	        	/* out.println("<li>");
	          out.println("<a id=\"menu-product-related-caramel-espresso-frappuccino\" href=\"action?actiontype=detail&dishid="+dish.getDishid()+"\">");
	          out.println("<div class=\"preview circle\" style=\"background-image: url(&quot;"+dish.getImgurl()+";)\"></div>");
	          out.println("<strong>"+dish.getDishname()+"</strong>");
	          out.println("</a>");
	          out.println("</li>"); */
	        }  
	       
       %>
	</div>  
  </section>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>