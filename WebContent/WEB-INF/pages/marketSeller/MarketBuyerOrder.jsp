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
<style>
.col-lg-4 {
	-webkit-box-flex: 0;
	-ms-flex: 0 0 100%;
	flex: 0 0 100%;
	max-width: 100%;
}
</style>
</head>
		<c:if test="${!empty login_ok}">
	<jsp:include page="/WEB-INF/pages/Message.jsp" />
	</c:if>
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
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span>
					</p>
					<h1 class="mb-0 bread">查看預購單</h1>
				</div>
			</div>
		</div>
	</div>


<div class="container">
	<div class="row">
		<div class="col-md-12 ftco-animate">
			<div class="cart-list">
<%-- 				<a href="#" onclick="reduceItem(${anEntry.value.productId})"><span --%>
<!-- 					class="ion-ios-close"></span></a> -->
				<table class="table">
					<thead class="thead-primary">
						<tr class="text-center">
							<th>訂購日期</th>
							<th>收件者姓名</th>
							<th>購買商品</th>
							<th>總價格</th>
							<th>連絡電話</th>
							<th>收件地址</th>

						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="item"
							items="${list}">
							<tr class="text-center">
								<td class="product-remove">${item.dayTime}</td>
								<td>
									<h3>${item.buyer}</h3>					
								</td>
								<td class="price">
                                <a href="#" data-toggle="modal" data-target="#orderDetail" 
		                        data-whatever="${item.oid}"
		                        class="btn btn-primary py-2 px-3">詳細資料</a>
				                </td>
								<td class="price">${item.allPrice}元</td>
								<td class="price">${item.cellphone}</td>
								<td class="price">${item.address}</td>

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
			<a href="<c:url value='/' />"
				class="btn btn-primary py-3 px-4">回首頁</a> <a
				href="<c:url value='/GoMarketHome' />"
				class="btn btn-primary py-3 px-4">我要繼續買</a>
		     </p>
		</div>
	</div>	
</div>




	<div class="modal fade" id="orderDetail" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true" style="left:400px;">
		<div class="modal-dialog modal-dialog-centered" role="document" style="margin:0px;">
			<div class="modal-content" style="width: 1080px;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">詳細資料</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="showOrderDetail" style="width: 1080px">

				</div>
				<div class="modal-footer">
					
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">關閉</button>
				</div>
			</div>
		</div>
	</div>


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
	
	<script>

$('#orderDetail').on('show.bs.modal', function (event) {
	var aHref = $(event.relatedTarget);
	var oId = aHref.data('whatever');
	$.ajax({
		url : "showOrderDetail",
		type : "POST",
		data : {
			"oId":oId	
		},
		datatype : "html",
		success : function(data, status) {
			$("#showOrderDetail").html(data);
		},
		error : function(data, status) {
			$("#showOrderDetail").html(data);
		}
	});			
	})
</script>

</body>
</html>