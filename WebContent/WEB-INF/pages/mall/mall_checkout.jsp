<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<title>濃郁-商城結帳系統</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/mall.css">
</head>
<body class="goto-here">
	<jsp:include page="../header.jsp" />
	<!-- END nav -->

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span>
					</p>
					<h1 class="mb-0 bread">來去結帳</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section" id="checkoutContent">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-7 ftco-animate">
					<form:form action='ProcessOrder' method="post" class="billing-form2"
						id="orderform" modelAttribute="pob">
						<h3 class="mb-4 billing-heading">結帳資訊&nbsp;<font style="font-size:12px"><a href="#checkoutContent" onclick="fastInput()">一鍵輸入</a>&nbsp;<a href="#checkoutContent" onclick="fastReset()">一鍵還原</a></font></h3>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">收件人姓名<sup style="color:red">*必填</sup></label>
									<form:input type="text" id="buyerName" name="buyerName"
										class="form-control" style="opacity:1;color:black	" placeholder="請輸入"
										value="${login_ok.member_name}" path="buyerName" required="required"/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="phone">聯絡電話<sup style="color:red">*必填</sup></label>
									<form:input type="text" id="tel" name="tel"
										class="form-control"
										placeholder="請輸入"
										value="${login_ok.member_cellphone}" path="tel" required="required"/>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="country">收件地址<sup style="color:red">*必填</sup></label>
									<form:input type="text" id="address" name="address"
										class="form-control" placeholder="請輸入"
										value="${login_ok.member_address}" path="address" required="required"/>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="w-100"></div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="country">預期收件時間</label>
									<div class="select-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<form:select name="shippingTime" id="shippingTime"
											class="form-control" path="shippingTime">
											<option value="1">早上</option>
											<option value="2">中午</option>
											<option value="3">下午</option>
											<option value="4">晚上</option>
										</form:select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="emailaddress">統一編號</label>
									<form:input type="text" id="bNo" name="bNo"
										class="form-control"
										placeholder="選填"
										value="${login_ok.member_gui_number}" path="bNo" pattern="^[0-9]{8}$"/>
								</div>
							</div>
						</div>
						<form:input type="hidden" id="total" name="total"
							value="${ShoppingCart.total}" path="total" />
						<form:input type="hidden" id="total" name="total"
							value="${login_ok.member_no}" path="buyerId" />
<%-- 						<form:input type="hidden" id="total" name="total" --%>
<%-- 							value="${ShoppingCart.total}" path="total" /> --%>
					</form:form>
					<p>
						<a href="<c:url value='/mall_shop' />"
							class="btn btn-primary py-3 px-4">回商城</a> <a
							href="<c:url value='/mall_shoppingcart' />"
							class="btn btn-primary py-3 px-4">回購物車</a>
						 
					</p>
					<!-- END -->
				</div>
				<div class="col-xl-5">
					<div class="row mt-5 pt-3">
						<div class="col-md-12 d-flex mb-5">
							<div class="cart-detail cart-total p-3 p-md-4">
								<h3 class="billing-heading mb-4">總價</h3>
								<p class="d-flex">
									<span>小計</span> <span>${ShoppingCart.subtotal}元</span>
								</p>
								<p class="d-flex">
									<span>折扣</span> <span>${ShoppingCart.subtotal-ShoppingCart.total}元</span>
								</p>
								<hr>
								<p class="d-flex total-price">
									<span>總計</span> <span>${ShoppingCart.total}元</span>
								</p>
								<c:choose>
									<c:when test="${empty errmsg}">
										<p>
											<input type="submit" class="btn btn-primary py-3 px-4"
												form="orderform" value="結帳" />
										</p>
									</c:when>
									<c:otherwise>
										<input type="submit" class="btn btn-primary py-3 px-4"
											disabled="disabled" form="orderform" value="結帳" />
										<p style="color: red" align="center">${errmsg}</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<!-- .col-md-8 -->
			</div>
		</div>

	</section>
	<!-- .section -->

	<jsp:include page="../footer.jsp" />
	<c:if test="${!empty login_ok}">
	<jsp:include page="/WEB-INF/pages/Message.jsp" />
	</c:if>
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/scrollax.min.js"></script>
	<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
	<!--   <script src="js/google-map.js"></script> -->
	<script src="js/main.js"></script>
	<jsp:include page="../js/mall.jsp" />

	<script>
	function fastInput(){
		document.forms[1][0].value="路人甲";
		document.forms[1][1].value=0919633486;
		document.forms[1][2].value="桃園市中壢區中大路300號";
		document.forms[1][3].value=3;
		document.forms[1][4].value=87654321;
		}
	function fastReset(){
		document.forms[1][0].value=document.forms[0][0].defaultValue;
		document.forms[1][1].value=document.forms[0][1].defaultValue;
		document.forms[1][2].value=document.forms[0][2].defaultValue;
		document.forms[1][3].value=1;
		document.forms[1][4].value=document.forms[0][4].defaultValue;
		}
		
	</script>

</body>
</html>