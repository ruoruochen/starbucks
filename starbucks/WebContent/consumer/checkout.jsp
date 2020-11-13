<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"  %>
<%@page import="com.cugb.javaee.starbucks.dao.*"%>
<%@page import="com.cugb.javaee.starbucks.utils.*"%>
<%@page import="com.cugb.javaee.starbucks.bean.Dish"%>
<%@page import="com.cugb.javaee.starbucks.bean.CartItem"%>
<%@page import="com.cugb.javaee.starbucks.bean.Customer"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Checkout | E-Shopper</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/prettyPhoto.css" rel="stylesheet">
	<link href="css/price-range.css" rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<jsp:include page="customerHeader.jsp"></jsp:include>

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">Check out</li>
				</ol>
			</div><!--/breadcrums-->

			<div class="step-one">
				<h2 class="heading">订单结算页</h2>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image" width="15%"></td>
							<td class="description" width="20%">菜品</td>
							<td class="price" width="13%">原价</td>
							<td class="total" width="13%">现价</td>
							<td class="total" width="13%">数量</td>
							<td class="total" width="13%">总价</td>
						</tr>
					</thead>
					<tbody>

					<%
						Map cart = (Map) session.getAttribute("shopcart");
						Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
						DishDAO ff = (DishDAO) DAOFactory.newInstance("DishDAO");
						float totalPrice = 0.0f;
						while (it.hasNext()) {
							Map.Entry entry = (Map.Entry) it.next();
							/* int dishid = (Integer) entry.getKey();
							int disnumber = (Integer) entry.getValue(); */
							CartItem nc = new CartItem();
							nc = (CartItem) entry.getKey();
							Customer cuss = (Customer) session.getAttribute("loginuser");
							if (!nc.getUsername().equals(cuss.getUsername())) {
								continue;
							}
							int dishid = nc.getId();
							int disnumber = (Integer) entry.getValue();
							Dish cur = ff.findDish(dishid);
							out.println("<tr>");
							out.println(" <td class=\"cart_product\">");
							out.println("  <a href=\"\">");
							out.println("   <img alt=\"\" src=\"" + cur.getImgurl() + "\"width=\"200px\"/>");
							out.println("  </a>");
							out.println(" </td>");
							out.println(" <td class=\"cart_description\">");
							out.println("  <h4>");
							out.println("   <a href=\"action?actiontype=detail&dishid=" + String.valueOf(dishid) + "\">");
							out.println(cur.getDishname());
							out.println("   </a>");
							out.println("  </h4>");
							out.println("  <p>");
							out.println("   Web ID: " + String.valueOf(dishid));
							out.println("  </p>");
							out.println(" </td>");
							out.println(" <td class=\"cart_total\">");
							out.println("  <p class=\"cart_total_price\">");
							out.println("   <del>¥");
							out.println(cur.getPrice());
							out.println("   </del>");
							out.println("  </p>");
							out.println(" </td>");
							out.println(" <td class=\"cart_total\">");
							out.println("  <p class=\"cart_total_price\" style=\"color: red\">¥");
							out.println(cur.getDiscount());
							out.println("  </p>");
							out.println(" </td>");
							out.println(" <td class=\"cart_total\">");
							out.println("  <p class=\"cart_total_price\">");
							out.println(disnumber);
							out.println("  </p>");
							out.println(" </td>");
							out.println(" <td class=\"cart_total\">");
							out.println("  <p class=\"cart_total_price\">");
							out.println("   ¥" + String.valueOf(disnumber * cur.getDiscount()));
							out.println("  </p>");
							out.println(" </td>");
							out.println("</tr>");
							totalPrice += disnumber * cur.getDiscount();
							session.setAttribute("price", totalPrice);
						}
						if(totalPrice == 0.0f){
							response.sendRedirect("cart.jsp");
						}
						
					%>


					<tr>
							<td colspan="4">&nbsp;</td>
							<td colspan="2">
								<table class="table table-condensed total-result">
									<tbody>
									<tr>
										<td>Total</td>
										<td><span>¥<% out.println(totalPrice); %></span></td>
									</tr>
								</tbody></table>
							</td>
						</tr>
					</tbody>
				</table>
			</div>


			

			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-12">
						<div class="shopper-info">
							<p>收货人信息</p>
						</div>
						<form class="form-horizontal" method="post" action="OrderAddControl">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-2 control-label">送餐地址:</label>
										<div class="col-sm-8">
											<textarea name="address" class="form-control" rows="3" placeholder="您的送餐地址"></textarea>
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label">联系方式:</label>
										<div class="col-sm-8">
											<input name="tel" type="text" class="form-control" id="inputEmail3" placeholder="您的手机号">
										</div>
									</div>
									<div class="form-group">

										<label for="inputPassword3" class="col-sm-2 control-label">支付方式:</label>
										<div class="col-sm-8">
											<select class="form-control" name="paymethod">
												<option value="alipay">支付宝</option>
												<option value="wechat">微信支付</option>
											</select>
										</div>
										
									</div>
								</div>
								<div class="col-sm-10"></div>
								
								<button type="submit" class="btn btn-primary col-sm-2">立刻下单</button>
							</form>
					</div>

				</div>
			</div>

			<div class="register-req">
				<p>* 请确保您的信息正确</p>
			</div><!--/register-req-->


			
		</div>
	</section> <!--/#cart_items-->

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>