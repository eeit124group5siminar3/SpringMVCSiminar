<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<title>農郁-商城購物車</title>
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
					<h1 class="mb-0 bread">我的購物車</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-cart" id ="cartContent">
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-12 ftco-animate"> -->
<!-- 					<div class="cart-list"> -->
<!-- 						<table class="table"> -->
<!-- 							<thead class="thead-primary"> -->
<!-- 								<tr class="text-center"> -->
<!-- 									<th>&nbsp;</th> -->
<!-- 									<th>&nbsp;</th> -->
<!-- 									<th>商品名稱</th> -->
<!-- 									<th>單價</th> -->
<!-- 									<th>數量</th> -->
<!-- 									<th>價格</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->
<!-- 								<tr class="text-center"> -->
<!-- 									<td class="product-remove"><a href="#"><span -->
<!-- 											class="ion-ios-close"></span></a></td> -->

<!-- 									<td class="image-prod"><div class="img" -->
<!-- 											style="background-image: url(images/product-3.jpg);"><span class='status'>-50%</span></div></td> -->
									
<!-- 									<td class="product-name"> -->
<!-- 										<h3>Bell Pepper</h3> -->
<!-- 										<p>Far far away, behind the word mountains, far from the -->
<!-- 											countries</p> -->
<!-- 									</td> -->

<!-- 									<td class="price">$4.90</td> -->

<!-- 									<td class="quantity"> -->
<!-- 										<div class="input-group mb-3"> -->
<!-- 											<input type="text" name="quantity" -->
<!-- 												class="quantity form-control input-number" value="1" min="1" -->
<!-- 												max="100"> -->
<!-- 										</div> -->
<!-- 									</td> -->

<!-- 									<td class="total">$4.90</td> -->
<!-- 								</tr> -->
<!--  								END TR --> 

<!-- 								<tr class="text-center"> -->
<!-- 									<td class="product-remove"><a href="#"><span -->
<!-- 											class="ion-ios-close"></span></a></td> -->

<!-- 									<td class="image-prod"><div class="img" -->
<!-- 											style="background-image: url(images/product-4.jpg);"></div></td> -->

<!-- 									<td class="product-name"> -->
<!-- 										<h3>Bell Pepper</h3> -->
<!-- 										<p>Far far away, behind the word mountains, far from the -->
<!-- 											countries</p> -->
<!-- 									</td> -->

<!-- 									<td class="price">$15.70</td> -->

<!-- 									<td class="quantity"> -->
<!-- 										<div class="input-group mb-3"> -->
<!-- 											<input type="text" name="quantity" -->
<!-- 												class="quantity form-control input-number" value="1" min="1" -->
<!-- 												max="100"> -->
<!-- 										</div> -->
<!-- 									</td> -->

<!-- 									<td class="total">$15.70</td> -->
<!-- 								</tr> -->
<!-- 								END TR --> 
<!-- 							</tbody> -->
<!-- 						</table> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<!-- 			<div class="row justify-content-end"> -->
			<!-- 				<div class="col-lg-4 mt-5 cart-wrap ftco-animate"> -->
			<!-- 					<div class="cart-total mb-3"> -->
			<!-- 						<h3>Coupon Code</h3> -->
			<!-- 						<p>Enter your coupon code if you have one</p> -->
			<!-- 						<form action="#" class="info"> -->
			<!-- 							<div class="form-group"> -->
			<!-- 								<label for="">Coupon code</label> <input type="text" -->
			<!-- 									class="form-control text-left px-3" placeholder=""> -->
			<!-- 							</div> -->
			<!-- 						</form> -->
			<!-- 					</div> -->
			<!-- 					<p> -->
			<!-- 						<a href="checkout.html" class="btn btn-primary py-3 px-4">Apply -->
			<!-- 							Coupon</a> -->
			<!-- 					</p> -->
			<!-- 				</div> -->
			<!-- 				<div class="col-lg-4 mt-5 cart-wrap ftco-animate"> -->
			<!-- 					<div class="cart-total mb-3"> -->
			<!-- 						<h3>Estimate shipping and tax</h3> -->
			<!-- 						<p>Enter your destination to get a shipping estimate</p> -->
			<!-- 						<form action="#" class="info"> -->
			<!-- 							<div class="form-group"> -->
			<!-- 								<label for="">Country</label> <input type="text" -->
			<!-- 									class="form-control text-left px-3" placeholder=""> -->
			<!-- 							</div> -->
			<!-- 							<div class="form-group"> -->
			<!-- 								<label for="country">State/Province</label> <input type="text" -->
			<!-- 									class="form-control text-left px-3" placeholder=""> -->
			<!-- 							</div> -->
			<!-- 							<div class="form-group"> -->
			<!-- 								<label for="country">Zip/Postal Code</label> <input type="text" -->
			<!-- 									class="form-control text-left px-3" placeholder=""> -->
			<!-- 							</div> -->
			<!-- 						</form> -->
			<!-- 					</div> -->
			<!-- 					<p> -->
			<!-- 						<a href="checkout.html" class="btn btn-primary py-3 px-4">Estimate</a> -->
			<!-- 					</p> -->
			<!-- 				</div> -->
<!-- 			<div class="col-lg-4 mt-5 cart-wrap ftco-animate"> -->
<!-- 				<div class="cart-total mb-3"> -->
<!-- 					<h3>Cart Totals</h3> -->
<!-- 					<p class="d-flex"> -->
<!-- 						<span>小計</span> <span>$20.60</span> -->
<!-- 					</p> -->
<!-- 					<p class="d-flex"> -->
<!-- 						<span>運費</span> <span>$0.00</span> -->
<!-- 					</p> -->
<!-- 					<p class="d-flex"> -->
<!-- 						<span>折扣</span> <span>$3.00</span> -->
<!-- 					</p> -->
<!-- 					<hr> -->
<!-- 					<p class="d-flex total-price"> -->
<!-- 						<span>總計</span> <span>$17.60</span> -->
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 				<p> -->
<!-- 					<a href="checkout.html" class="btn btn-primary py-3 px-4">去結帳</a> -->
<!-- 				</p> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 				</div> -->
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
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

	<script>

	$(document).ready(function() {
	var cartcontent=document.getElementById("cartContent");
	$.ajax({url:"CartContent",type:"POST",datatype:"html",success:function(data,status){$("#cartContent").html(data);},error:function(data,status){$("#cartContent").html(data);console.log(data);}});
	});
		// 		$(document).ready(function() {

		// 			var quantitiy = 0;
		// 			$('.quantity-right-plus').click(function(e) {

		// 				// Stop acting like a button
		// 				e.preventDefault();
		// 				// Get the field name
		// 				var quantity = parseInt($('#quantity').val());

		// 				// If is not undefined

		// 				$('#quantity').val(quantity + 1);

		// 				// Increment

		// 			});

		// 			$('.quantity-left-minus').click(function(e) {
		// 				// Stop acting like a button
		// 				e.preventDefault();
		// 				// Get the field name
		// 				var quantity = parseInt($('#quantity').val());

		// 				// If is not undefined

		// 				// Increment
		// 				if (quantity > 0) {
		// 					$('#quantity').val(quantity - 1);
		// 				}
		// 			});

		// 		});
		// 		$(document).ready(function(){
		// 			$.ajax({url:"jQueryTest",data:{num1:1,num2:2,num3:3},success:function(data,status){console.log(data);}});
		// 			});
	</script>

</body>
</html>