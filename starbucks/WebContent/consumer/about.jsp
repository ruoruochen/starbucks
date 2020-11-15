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
    <title>星巴克简介</title>
     <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/prettyPhoto.css" rel="stylesheet">
    <link href="../css/price-range.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<link href="../css/responsive.css" rel="stylesheet">
         
	<script language="javascript">
	function checkUserInfo() {
	 if(document.loginForm.loginName.value==""){
	    alert("用户名不能为空");
	    return false;
	 }
	 if(document.loginForm.loginPass.value==""){
	    alert("密码不能为空");
	    return false;
	 }
	}
	function checkUserInfo2() {
		 if(document.registerForm.registerName.value==""){
		    alert("用户名不能为空");
		    return false;
		 }
		 if(document.registerForm.registerEmail.value==""){
			alert("邮箱不能为空");
			return false;
		 }
		 if(document.registerForm.registerPass.value==""){
		    alert("密码不能为空");
		    return false;
		 }
		}
	
	</script>
</head><!--/head-->

<body>

	
	<jsp:include page="customerHeader.jsp"></jsp:include>
	<center>
	<section id="form" style="margin-top:0px; margin-bottom:120px"><!--form-->
		<div class="container">
			<img alt="" src="../images/home/about.png" width="1024px" height="1536px">
		</div>
	</section><!--/form-->
	</center>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

