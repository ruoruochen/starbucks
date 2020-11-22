<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.starbucks.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.starbucks.bean.Dish"%>
<%@page import="com.cugb.javaee.starbucks.bean.CommentItem"%>
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
<title>商品详情</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link href="../css/prettyPhoto.css" rel="stylesheet">
<link href="../css/price-range.css" rel="stylesheet">
<link href="../css/animate.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
<link href="../css/responsive.css" rel="stylesheet">

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
.cart_menu {
    background: #006439;
    color: #fff;
    font-size: 16px;
    font-family: 'Roboto', sans-serif;
    font-weight: normal;
}
table{
	    border-collapse: separate;
    
	border:solid #F0F0F0 1px;
}
.table-condensed>thead>tr>td
{
padding:10px;
}
              
  .num-jian,
   .input-num,
   .num-jia {
       display: inline;
       width: 28px;
       height: 28px;
       line-height: 28px;
       text-align: center;
       font-size: 18px;
       color: #999;
       cursor: pointer;
       border: 1px solid #e6e6e6;
       
   }
    .input-num {
       width: 58px;
       height: 26px;
       color: #333;
   }
</style>

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
					<img src="../images/product-details/new.png" class="newarrival" alt="">
					<h2>${requestScope.current.getDishname()}</h2>
					<p>
						<span style="font-size: 20px"><del>￥${requestScope.current.getPrice()}</del></span>
						&nbsp;&nbsp;<span style="color: #FE980F; font-size: 22px">￥${requestScope.current.getDiscount()}</span>
					</p>
					<div class="col-sm-2">
						<p style="padding-top: 5px; font-size: 16px">数量
							</p>
					</div>
					<form action="action" method="POST" name="loginForm">
					<p class="col-sm-4" style="margin-left: -40px;margin-top:-10px;">
						<!-- <select class="form-control" name="number" >
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
						</select> -->
						<span id="num-jian" onclick="jian()" class="num-jian">-</span>
						<input type="text" class="input-num" id="input-num" value="1" name="number" />
						<span id="num-jia" onclick="jia()" class="num-jia">+</span>
					</p>
					<script>
					function jian()
					{
					        var input_num = document.getElementById("input-num");
					        
					        if(parseInt(input_num.value)==1)
					        	{
					        	alert("数量不能低于1！");
					        	}
					        else
					        	{
					        	input_num.value = parseInt(input_num.value) - 1;
					        	}
					}
					function jia()
					{
						 
					        var input_num = document.getElementById("input-num");
					        input_num.value = parseInt(input_num.value) + 1;
					        
					}
					</script>
					<input type="hidden" name="dishid"
						value=${requestScope.current.getDishid()}>

					<input type="hidden" name="actiontype" value="cart">
				
					<button type="submit" class="btn btn-default cart">
						<i class="fa fa-shopping-cart fa-lg"></i>&nbsp;&nbsp;&nbsp;加入购物车
					</button>
					</form>
					</br>
					<p>
						<b>描述:</b> ${requestScope.current.getDescri()}
					</p>
				</div>

			</div>
		</div>
		<!--/product-details-->
		<div class="container" style="margin-left: 200px; margin-right: 100px;">
		<h3 align="center" style="color:#006439">商品评论</h3>	
			<div class="table-responsive cart_info">
				
					<%
					DishDAO dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
					String s= request.getParameter("dishid");
					int dishid = Integer.parseInt(s);
					CommentDAO commentdao = (CommentDAO) DAOFactory.newInstance("CommentDAO");
					ArrayList<CommentItem> arr = commentdao.findComments(dishid);	
					System.out.println(arr.size());
					if(arr.size()!=0)
					{			
						out.println("<table class=\"table table-condensed\">");
						out.println("<thead align=\"center\">");
						out.println("<tr class=\"cart_menu\">");
						out.println("<td class=\"total\">用户名</td>");
						out.println("<td class=\"total\">评论</td>");
						out.println("<td class=\"total\">时间</td>");
						out.println("</tr>");
						out.println("</thead>");
						out.println("<tbody >");
						for(CommentItem comment:arr) 
						{
							out.println("<tr align=\"center\" style=\"font-size:20px;\">");
							out.println(" <td class=\"total\">");
							out.println("<h4>");
							out.println(comment.getUsername());
							out.println("</h4>");
							out.println(" </td>");
							
							out.println(" <td class=\"total\">");
							out.println(comment.getCommenttext());
							out.println(" </td>");
							
							out.println(" <td class=\"total\">");
							out.println(comment.getTime());
							out.println(" </td>");
							
							out.println("</tr>");						
						}
						out.println("</tbody>");
						out.println("</table>");
					}
					else
					{
						out.println("<h4>");
						out.println("该商品还没有用户评论......");
						out.println("</h4>");
					}
					%>
					
				
			</div>
			</div>
	</section>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>