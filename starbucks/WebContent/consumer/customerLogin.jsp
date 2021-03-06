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
    <title>登录</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/prettyPhoto.css" rel="stylesheet">
    <link href="../css/price-range.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<link href="../css/responsive.css" rel="stylesheet">
          

    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/ico/apple-touch-icon-57-precomposed.png">

	<script language="javascript">
	function checkUserInfo() {
	 if(document.loginForm.loginName.value==""){
	    alert("用户名不能为空!");
	    return false;
	 }
	 if(document.loginForm.loginPass.value==""){
	    alert("密码不能为空!");
	    return false;
	 }
	 if(document.loginForm.code.value==""){
		    alert("验证码不能为空!");
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
		 if(document.registerForm.registerconfirmPass.value==""){
			    alert("确认密码不能为空");
			    return false;
			 }
		}
	function refresh() {  
        //IE 存在缓存，需要 new Date () 实现更换路径的作用  
        document.getElementById("imagee").src="../image.jsp?"+new Date().getTime();  
    }  
	</script>
</head><!--/head-->

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
					
				</div>
				
			</div>
		</div>
	</div>
	<!--/header-bottom--> </header>
	<!--/header-->
	
	<section id="form" style="margin-top:0px; margin-bottom:120px"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>登录到您的账户</h2>
						<form action="LoginControl" method="POST" name="loginForm" onSubmit="return checkUserInfo()">
							<input type="text" placeholder="用户名" name="loginName"/>
							<input type="password" placeholder="密码" name="loginPass"/>	
							<input type="text"  placeholder="验证码" name="code" >  
        					<img width="80px" height="30px" id="imagee" border="0"  onclick="refresh()" src="../image.jsp" title="点击更换图片">  
							<input type="hidden" name="actiontype" value="login">						
							<button type="submit" class="btn btn-default">登录</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>注册新用户</h2>
						<form action="register" method="POST" name="registerForm" onSubmit="return checkUserInfo2()">
							<input type="text" placeholder="用户名" name="registerName"/>
							<input type="email" placeholder="邮箱" name="registerEmail"/>
							<input type="password" placeholder="密码" name="registerPass"/>
							<input type="password" placeholder="确认密码" name="registerconfirmPass"/>								
							<input type="hidden" name="actiontype" value="register">		
							<button type="submit" class="btn btn-default">注册</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

