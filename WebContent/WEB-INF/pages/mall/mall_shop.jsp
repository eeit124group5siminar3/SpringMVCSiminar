<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<title>農郁-商城</title>
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
		style="background-image: url('images/bg_1.jpg');" id="product_top">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span>
					</p>
					<h1 class="mb-0 bread">農郁商城</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section" id="mainContent">
		<!-- 		<div class="container"> -->
		<!-- 			<div class="row justify-content-center"> -->
		<!-- 				<div class="col-md-10 mb-5 text-center"> -->
		<!-- 					<ul class="product-category" id="product-category"></ul> -->
		<!-- 					<form class="product-category" action="javascript:void(0)" -->
		<!-- 						method="GET"> -->
		<!-- 						<input type="search" name="searchString" id="searchString" -->
		<%-- 							value="${searchString}" /> --%>
		<!-- 						<button name="searchButton" style="border-radius: 5px;" -->
		<!-- 							onclick="searchProduct(0)">查詢</button> -->
		<!-- 					</form> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 			<div class="row  ftco-animate" id="mall_products"></div> -->
		<!-- 		</div> -->
		<!-- 		<div id="mall_pages"></div> -->
	</section>

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
	<!-- 	<script -->
	<!-- 		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
	<!-- 	<script src="js/google-map.js"></script> -->
	<script src="js/main.js"></script>
	<jsp:include page="../js/mall.jsp" />

	<script>
		$(document).ready(function() {
			var url = window.location.href;//獲取當前瀏覽器的url
			index = url.indexOf("flag");
			categoryIndex=url.indexOf("goto");
			if(index !=-1) {
				var start = url.indexOf("productId");
				var productId = url.substring(start + "productId".length+1);
				singleProduct(productId);
			}else if(categoryIndex!=-1){
				var start = url.indexOf("category");
				var category = url.substring(start + "category".length+1);
				productCategory(category);
			}else{
			var	categoryId=0;
			if(${mall_categoryId!=null}){
				categoryId=`${mall_categoryId}`;				
					}
			var pageNo=1;
			if(${mall_pageNo!=null}){
				pageNo=`${mall_pageNo}`;				
					}
			$.ajax({
				url : "MallContent",
				type : "POST",
				data : {"mall_categoryId":categoryId,"mall_pageNo":pageNo},
				datatype : "html",
				success : function(data, status) {
					$("#mainContent").html(data);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
			}
		});
	</script>
</body>
</html>