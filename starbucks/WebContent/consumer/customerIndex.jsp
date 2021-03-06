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
<link href="../css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="../images/ico/favicon.ico">
<link rel="./apple-touch-icon-precomposed" sizes="144x144"
	href="../images/ico/apple-touch-icon-144-precomposed.png">
<link rel="./apple-touch-icon-precomposed" sizes="114x114"
	href="../images/ico/apple-touch-icon-114-precomposed.png">
<link rel="./apple-touch-icon-precomposed" sizes="72x72"
	href="../images/ico/apple-touch-icon-72-precomposed.png">
<link rel="./apple-touch-icon-precomposed"
	href="../images/ico/apple-touch-icon-57-precomposed.png">

<link rel="stylesheet" href="../css/slide.css">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/slide.js"></script>
    <style>
        .ck-slide {
            width:96%;
            height:400px;
        }
        .ck-slide ul.ck-slide-wrapper {
            height:400px;
        }
    </style>
</head>
<!--/head-->
<!--  <style>
img{
border-radius:50%;
overflow :hidden;
}
</style>-->

<body>

 	<jsp:include page="customerHeader.jsp"></jsp:include>
 	
 <section>
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
		<div class="container">
		<div class="row col-sm-12">
			<div class="ck-slide">
        <ul class="ck-slide-wrapper">
            <li>
                <a href="http://createthink.net"><img src="../images/1.jpg" alt=""  ></a>
            </li>
            <li style="display:none">
                <a href="http://www.oschina.net"><img src="../images/2.jpg" alt="" ></a>
            </li>
            <li style="display:none">
                <a href="javascript:;"><img src="../images/3.jpg" alt="" ></a>
            </li>
            <li style="display:none">
                <a href="javascript:;"><img src="../images/4.jpg" alt=""></a>
            </li>
            <li style="display:none">
                <a href="javascript:;"><img src="../images/5.jpg" alt=""></a>
            </li>
        </ul>
        <a href="javascript:;" class="ctrl-slide ck-prev">上一张</a>
        <a href="javascript:;" class="ctrl-slide ck-next">下一张</a>
        <div class="ck-slidebox">
            <div class="slideWrap">
                <ul class="dot-wrap">
                    <li class="current"><em>1</em></li>
                    <li><em>2</em></li>
                    <li><em>3</em></li>
                    <li><em>4</em></li>
                    <li><em>5</em></li>
                </ul>
            </div>
        </div>
    </div>
    <script>
        $('.ck-slide').ckSlide({
            autoPlay:true
            /*dir:"x"*/
        });
    </script>			
		</div>
			<div class="row">
				
				
				<div class="col-sm-12 padding-right">
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
													<a onclick="return linkClick(this)" href="action?actiontype=detail&dishid=${currentdish.getDishid()}"><img src="${currentdish.getImgurl()}" alt="" width="256px" height="256px"></a>													
													<h2>¥${currentdish.getPrice()}</h2>
													<a onclick="return linkClick(this)" href="action?actiontype=detail&dishid=${currentdish.getDishid()}"><p>${currentdish.getDishname()}</p></a>
													<a onclick="return linkClick(this)" href="action?actiontype=detail&dishid=${currentdish.getDishid()}" class="btn btn-default add-to-cart"><i class="fa fa-eye"></i>详情</a>
													&nbsp;
													<a onclick="return linkClick(this)" href="action?actiontype=addone&dishid=${currentdish.getDishid()}" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>加购</a>
												</div>

											</div>
										</div>
									</div>
								</c:forEach>


								<!-- <div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery1.jpg" alt="">
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div> -->


							</div>

						</div>
					</div>
					
					<div class="col-sm-12">
						<table>
						
					<tr>
					<ul class="pager">
					<li><a name="btnTopPage" id="btnTopPage" href="customerIndex.jsp?pageNO=1">首页</a></li>
    <li><a name="btnPreviousPage" id="btnPreviousPage"
									href="customerIndex.jsp?pageNO=${requestScope.pageModel.prevPageNO}">上一页</a></li>
    <li class="disabled"><a href="#">${requestScope.pageModel.getPageNO()} / ${requestScope.pageModel.bottomPageNO}
</a></li>
    <li><a name="btnNextPage" id="btnNextPage"
									href="customerIndex.jsp?pageNO=${requestScope.pageModel.nextPageNO}" >下一页</a></li>
    <li><a name="btnBottomPage"	id="btnBottomPage"
									href="customerIndex.jsp?pageNO=${requestScope.pageModel.bottomPageNO}">尾页</a></li>
</ul>
					</tr>
						</table>
					
					</div>
					<%--- 
				 	<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">recommended items</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active left">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="">
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="">
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="">
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>
								<div class="item next left">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="">
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="">
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="">
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>
							</div>
							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							  </a>
							  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
								<i class="fa fa-angle-right"></i>
							  </a>			
						</div>
					</div><!--/recommended_items-->
					 --%>
				</div>
			</div>
		</div>
	</section>
  
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>