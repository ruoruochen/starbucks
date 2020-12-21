<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.starbucks.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.starbucks.bean.Dish"%>
<%@page import="com.cugb.javaee.starbucks.bean.Customer"%>
<%@page import="com.cugb.javaee.starbucks.dao.*"%>
<%@page import="com.cugb.javaee.starbucks.utils.*"%>
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
    <title>修改信息</title>
 <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/prettyPhoto.css" rel="stylesheet">
    <link href="../css/price-range.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<link href="../css/responsive.css" rel="stylesheet">
          
    <link rel="shortcut icon" href="../images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/ico/apple-touch-icon-57-precomposed.png">

	<script language="javascript">
	function checkInfo() {		
		 if(document.modifyCusForm.modifyEmail.value==""){
			alert("邮箱不能为空");
			return false;
		 }
		 if(document.modifyCusForm.modifyPass.value==""){
		    alert("密码不能为空");
		    return false;
		 }
		 if(document.modifyCusForm.confirmPass.value==""){
			    alert("请再次确认密码");
			    return false;
		 }
		 if(document.modifyCusForm.confirmPass.value != document.modifyCusForm.modifyPass.value){
			    alert("两次密码不一致");
			    return false;
		 }
		}
	
	</script>
</head><!--/head-->

<body>
	<jsp:include page="customerHeader.jsp"></jsp:include>
	
	<section id="form" style="margin-top:0px; margin-bottom:100px"><!--form-->
		<div class="container" >
			<div class="row">
					<div class="signup-form"  style="margin-left:420px;width:400px"><!--sign up form-->
						
						<%
							Customer cus = (Customer) session.getAttribute("loginuser");
							if (cus == null) {
							out.println("<br/><br/><br/><br/><p style=\"font-size:18px;\">您还未登录？<a href=\"customerLogin.jsp\">去登录</a></p><br/><br/><br/><br/><br/><br/><br/><br/>");
						}else
						{
							out.println("<h2 align=\"center\">修改我的信息</h2>");
							out.println("<form action=\"modifyCusControl\" method=\"POST\" name=\"modifyCusForm\" onSubmit=\"return checkInfo()\">");
							out.println(" <label for=\"exampleInputPassword1\">");
							out.println("  用户名");
							out.println(" </label>");
							out.println("<input type=\"text\" disabled=\"true\" value=\"" + cus.getUsername()+"\"/>");
							out.println(" <label for=\"exampleInputPassword1\">");
							out.println("  邮箱");
							out.println(" </label>");
							out.println("<input type=\"email\" placeholder=\"邮箱\" name=\"modifyEmail\"/>");
							out.println(" <label for=\"exampleInputPassword1\">");
							out.println("  新密码");
							out.println(" </label>");
							out.println("<input type=\"password\" placeholder=\"密码\" name=\"modifyPass\"/>");
							out.println(" <label for=\"exampleInputPassword1\">");
							out.println("  确认密码");
							out.println(" </label>");
							out.println("<input type=\"password\" placeholder=\"确认密码\" name=\"confirmPass\"/>");
							out.println("<button type=\"submit\" class=\"btn btn-default\" style=\"float:right;\">确认修改</button>");
							out.println("</form>");
						}
						%>
					</div><!--/sign up form-->
				</div>
		</div>
	</section><!--/form-->
	
	
	<footer id="footer"><!--Footer-->				
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2020 JAVA EE课程实践. All rights reserved.</p>
					<p class="pull-right">Designed by <span>ZHOU/CHEN/WANG</span></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	

  
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>