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
	
	

<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>星巴克（管理员登录页）</title>
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
	 if(document.loginForm.code.value==""){
		    alert("验证码不能为空!");
		    return false;
		 }
	}
	
	
	function refresh() {  
        //IE 存在缓存，需要 new Date () 实现更换路径的作用  
        document.getElementById("imagee").src="../image.jsp?"+new Date().getTime();  
    }  
	</script>

</head>
<body>

<section id="form" style="margin-top:0px; margin-bottom:120px"><!--form-->
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-3 column">
		</div>
		<div class="col-md-6 column">
			<div class="login-form"><!--login form-->
			<h1>欢迎您，管理员！</h1>
			<h2>登录到您的账户</h2>
			<form action="llogin" method="POST" name="loginForm" onSubmit="return checkUserInfo()">
				<input type="text" placeholder="用户名" name="loginName"/>
				<input type="password" placeholder="密码" name="loginPass"/>	
				<input type="text"  placeholder="验证码" name="code" >  
        		<img width="80px" height="30px" id="imagee" border="0"  onclick="refresh()" src="../image.jsp" title="点击更换图片">  
				<input type="hidden" name="actiontype" value="login">						
				<button type="submit" class="btn btn-default">登录</button>	
			</form>
			</div>
		</div>
		<div class="col-md-3 column">
		</div>
	</div>
</div>
</section><!--/form-->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>