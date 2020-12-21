<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<title>農郁-市集菜籃</title>
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="css/fontawesome-free/all.min.css">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="css/dist/adminlte.min.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<style>
.col-lg-4 {
	-webkit-box-flex: 0;
	-ms-flex: 0 0 100%;
	flex: 0 0 100%;
	max-width: 100%;
}
</style>
</head>
<body class="goto-here">

	<jsp:include page="/WEB-INF/pages/bar.jsp"/>
	<!-- END nav -->
    <c:if test="${!empty login_ok}">
	<jsp:include page="/WEB-INF/pages/Message.jsp" />
	</c:if>


<section class="content-wrapper justify-content-center" style="background-color: #FFFFFF">
<div class="container">
	<div class="row">
		<div class="col-md-12 ftco-animate">
			<div class="cart-list">
<%-- 				<a href="#" onclick="reduceItem(${anEntry.value.productId})"><span --%>
<!-- 					class="ion-ios-close"></span></a> -->
				<table class="table">
					<thead class="thead-primary">
						<tr class="text-center">
							<th>下單日期</th>
							<th>收件者姓名<br>連絡電話</th>
							<th>收件地址</th>
							<th>購買商品與數量</th>
							<th></th>

						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="item" items="${order}">
							<tr class="text-center">
<%-- 								<td class="product-remove">${item.buyer}"</td> --%>
								
								<td class="product-remove">${item.dayTime}</td>							
								<td class="price">${item.buyer}<br>${item.cellphone}</td>
								<td class="price">${item.address}</td>
								<td class="price">
								<c:forEach var="item2" items="${orderDetail}">
								${item2.marketProductTotalBean.productName} X ${item2.quantity} = 
								${item2.marketProductTotalBean.price * item2.quantity} 元<br>
								</c:forEach>
								</td>
							</tr>
							<!-- END TR-->
						</c:forEach>
						<!-- END TR-->
					</tbody>
					
				</table>
			</div>
		</div>
	</div>
	<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
		<div class="cart-total mb-3">
		     <p>
			 <a
				href="<c:url value='/MarketProduct.selectAll' />"
				class="btn btn-primary py-3 px-4">商品管理</a>
		     </p>
		</div>
	</div>	
</div>
</section>
	<jsp:include page="../footer.jsp" />


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
	<!-- 	<script -->
	<!-- 		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
	<!-- 	<script src="js/google-map.js"></script> -->
	<script src="js/main.js"></script>
	<jsp:include page="../js/Market.jsp" />


</body>
</html>