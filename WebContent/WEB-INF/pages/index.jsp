<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh">
<head>
<title>農郁</title>
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
</head>
<body class="goto-here">

	<jsp:include page="./header.jsp" />
<%-- 	<jsp:include page="/WEB-INF/pages/header.jsp" /> --%>
	<!-- END nav -->
		<c:if test="${!empty login_ok}">
	<jsp:include page="/WEB-INF/pages/Message.jsp" />
	</c:if>

	<section id="home-section" class="hero">
		<div class="hero-wrap hero-bread"
			style="background-image: url(images/bg_1.jpg);">
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-12 ftco-animate text-center">
						<h1 class="mb-2" style="color:white">農郁小農媒合平台</h1>
						<h2 class="subheading mb-4" style="color:white">直接來自產地的新鮮農產品</h2>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row no-gutters ftco-services">
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-shipped"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">包含運費</h3>
							<span>運費不另外計算</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-diet"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">永遠新鮮</h3>
							<span>所有品項</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-award"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">品質優良</h3>
							<span>優質產品</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-customer-service"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">有趣活動</h3>
							<span>各種農田活動</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-category ftco-no-pt">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-6 order-md-last align-items-stretch d-flex">
							<div
								class="category-wrap-2 ftco-animate img align-self-stretch d-flex"
								style="background-image: url(images/category.jpg);">
								<div class="text text-center">
									<h2>各項產品</h2>
									<p>保護每個家庭的健康</p>
									<p>
										<a href="<c:url value='/mall_shop' />" class="btn btn-primary">現在去購物</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div
								class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
								style="background-image: url(images/葉菜類.jpg);" onclick="gotoMallByCategory(1)">
								<div class="text px-3 py-1">
									<h2 class="mb-0">
										<a>葉菜類</a>
									</h2>
								</div>
							</div>
							<div
								class="category-wrap ftco-animate img d-flex align-items-end"
								style="background-image: url(images/category-2.jpg);" onclick="gotoMallByCategory(5)">
								<div class="text px-3 py-1">
									<h2 class="mb-0">
										<a>水果類</a>
									</h2>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div
						class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
						style="background-image: url(images/根莖類.jpg);" onclick="gotoMallByCategory(2)">
						<div class="text px-3 py-1">
							<h2 class="mb-0">
								<a>根莖類</a>
							</h2>
						</div>
					</div>
					<div class="category-wrap ftco-animate img d-flex align-items-end"
						style="background-image: url(images/瓜果類.jpg);" onclick="gotoMallByCategory(3)">
						<div class="text px-3 py-1">
							<h2 class="mb-0">
								<a>瓜果類</a>
							</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section" id="recommendedProductsContent">
<!-- 		<div class="container"> -->
<!-- 			<div class="row justify-content-center mb-3 pb-3"> -->
<!-- 				<div class="col-md-12 heading-section text-center ftco-animate"> -->
<!-- 					<span class="subheading">特色產品</span> -->
<!-- 					<h2 class="mb-4">優良店家</h2> -->
<!-- 					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-6 col-lg-3 ftco-animate"> -->
<!-- 					<div class="product"> -->
<!-- 						<a href="#" class="img-prod"><img class="img-fluid" -->
<!-- 							src="images/product-1.jpg" alt="Colorlib Template"> <span class="status">30%</span> -->
<!-- 							<div class="overlay"></div> </a> -->
<!-- 						<div class="text py-3 pb-4 px-3 text-center"> -->
<!-- 							<h3> -->
<!-- 								<a href="#">Bell Pepper</a> -->
<!-- 							</h3> -->
<!-- 							<div class="d-flex"> -->
<!-- 								<div class="pricing"> -->
<!-- 									<p class="price"> -->
<!-- 										<span class="mr-2 price-dc">$120.00</span><span -->
<!-- 											class="price-sale">$80.00</span> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="bottom-area d-flex px-3"> -->
<!-- 								<div class="m-auto d-flex"> -->
<!-- 									<a href="#" -->
<!-- 										class="add-to-cart d-flex justify-content-center align-items-center text-center"> -->
<!-- 										<span><i class="ion-ios-menu"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="buy-now d-flex justify-content-center align-items-center mx-1"> -->
<!-- 										<span><i class="ion-ios-cart"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="heart d-flex justify-content-center align-items-center "> -->
<!-- 										<span><i class="ion-ios-heart"></i></span> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-6 col-lg-3 ftco-animate"> -->
<!-- 					<div class="product"> -->
<!-- 						<a href="#" class="img-prod"><img class="img-fluid" -->
<!-- 							src="images/product-2.jpg" alt="Colorlib Template"> -->
<!-- 							<div class="overlay"></div> </a> -->
<!-- 						<div class="text py-3 pb-4 px-3 text-center"> -->
<!-- 							<h3> -->
<!-- 								<a href="#">Strawberry</a> -->
<!-- 							</h3> -->
<!-- 							<div class="d-flex"> -->
<!-- 								<div class="pricing"> -->
<!-- 									<p class="price"> -->
<!-- 										<span>$120.00</span> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="bottom-area d-flex px-3"> -->
<!-- 								<div class="m-auto d-flex"> -->
<!-- 									<a href="#" -->
<!-- 										class="add-to-cart d-flex justify-content-center align-items-center text-center"> -->
<!-- 										<span><i class="ion-ios-menu"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="buy-now d-flex justify-content-center align-items-center mx-1"> -->
<!-- 										<span><i class="ion-ios-cart"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="heart d-flex justify-content-center align-items-center "> -->
<!-- 										<span><i class="ion-ios-heart"></i></span> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-6 col-lg-3 ftco-animate"> -->
<!-- 					<div class="product"> -->
<!-- 						<a href="#" class="img-prod"><img class="img-fluid" -->
<!-- 							src="images/product-3.jpg" alt="Colorlib Template"> -->
<!-- 							<div class="overlay"></div> </a> -->
<!-- 						<div class="text py-3 pb-4 px-3 text-center"> -->
<!-- 							<h3> -->
<!-- 								<a href="#">Green Beans</a> -->
<!-- 							</h3> -->
<!-- 							<div class="d-flex"> -->
<!-- 								<div class="pricing"> -->
<!-- 									<p class="price"> -->
<!-- 										<span>$120.00</span> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="bottom-area d-flex px-3"> -->
<!-- 								<div class="m-auto d-flex"> -->
<!-- 									<a href="#" -->
<!-- 										class="add-to-cart d-flex justify-content-center align-items-center text-center"> -->
<!-- 										<span><i class="ion-ios-menu"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="buy-now d-flex justify-content-center align-items-center mx-1"> -->
<!-- 										<span><i class="ion-ios-cart"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="heart d-flex justify-content-center align-items-center "> -->
<!-- 										<span><i class="ion-ios-heart"></i></span> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-6 col-lg-3 ftco-animate"> -->
<!-- 					<div class="product"> -->
<!-- 						<a href="#" class="img-prod"><img class="img-fluid" -->
<!-- 							src="images/product-4.jpg" alt="Colorlib Template"> -->
<!-- 							<div class="overlay"></div> </a> -->
<!-- 						<div class="text py-3 pb-4 px-3 text-center"> -->
<!-- 							<h3> -->
<!-- 								<a href="#">Purple Cabbage</a> -->
<!-- 							</h3> -->
<!-- 							<div class="d-flex"> -->
<!-- 								<div class="pricing"> -->
<!-- 									<p class="price"> -->
<!-- 										<span>$120.00</span> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="bottom-area d-flex px-3"> -->
<!-- 								<div class="m-auto d-flex"> -->
<!-- 									<a href="#" -->
<!-- 										class="add-to-cart d-flex justify-content-center align-items-center text-center"> -->
<!-- 										<span><i class="ion-ios-menu"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="buy-now d-flex justify-content-center align-items-center mx-1"> -->
<!-- 										<span><i class="ion-ios-cart"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="heart d-flex justify-content-center align-items-center "> -->
<!-- 										<span><i class="ion-ios-heart"></i></span> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->


<!-- 				<div class="col-md-6 col-lg-3 ftco-animate"> -->
<!-- 					<div class="product"> -->
<!-- 						<a href="#" class="img-prod"><img class="img-fluid" -->
<!-- 							src="images/product-5.jpg" alt="Colorlib Template"> <span class="status">30%</span> -->
<!-- 							<div class="overlay"></div> </a> -->
<!-- 						<div class="text py-3 pb-4 px-3 text-center"> -->
<!-- 							<h3> -->
<!-- 								<a href="#">Tomatoe</a> -->
<!-- 							</h3> -->
<!-- 							<div class="d-flex"> -->
<!-- 								<div class="pricing"> -->
<!-- 									<p class="price"> -->
<!-- 										<span class="mr-2 price-dc">$120.00</span><span -->
<!-- 											class="price-sale">$80.00</span> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="bottom-area d-flex px-3"> -->
<!-- 								<div class="m-auto d-flex"> -->
<!-- 									<a href="#" -->
<!-- 										class="add-to-cart d-flex justify-content-center align-items-center text-center"> -->
<!-- 										<span><i class="ion-ios-menu"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="buy-now d-flex justify-content-center align-items-center mx-1"> -->
<!-- 										<span><i class="ion-ios-cart"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="heart d-flex justify-content-center align-items-center "> -->
<!-- 										<span><i class="ion-ios-heart"></i></span> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-6 col-lg-3 ftco-animate"> -->
<!-- 					<div class="product"> -->
<!-- 						<a href="#" class="img-prod"><img class="img-fluid" -->
<!-- 							src="images/product-6.jpg" alt="Colorlib Template"> -->
<!-- 							<div class="overlay"></div> </a> -->
<!-- 						<div class="text py-3 pb-4 px-3 text-center"> -->
<!-- 							<h3> -->
<!-- 								<a href="#">Brocolli</a> -->
<!-- 							</h3> -->
<!-- 							<div class="d-flex"> -->
<!-- 								<div class="pricing"> -->
<!-- 									<p class="price"> -->
<!-- 										<span>$120.00</span> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="bottom-area d-flex px-3"> -->
<!-- 								<div class="m-auto d-flex"> -->
<!-- 									<a href="#" -->
<!-- 										class="add-to-cart d-flex justify-content-center align-items-center text-center"> -->
<!-- 										<span><i class="ion-ios-menu"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="buy-now d-flex justify-content-center align-items-center mx-1"> -->
<!-- 										<span><i class="ion-ios-cart"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="heart d-flex justify-content-center align-items-center "> -->
<!-- 										<span><i class="ion-ios-heart"></i></span> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-6 col-lg-3 ftco-animate"> -->
<!-- 					<div class="product"> -->
<!-- 						<a href="#" class="img-prod"><img class="img-fluid" -->
<!-- 							src="images/product-7.jpg" alt="Colorlib Template"> -->
<!-- 							<div class="overlay"></div> </a> -->
<!-- 						<div class="text py-3 pb-4 px-3 text-center"> -->
<!-- 							<h3> -->
<!-- 								<a href="#">Carrots</a> -->
<!-- 							</h3> -->
<!-- 							<div class="d-flex"> -->
<!-- 								<div class="pricing"> -->
<!-- 									<p class="price"> -->
<!-- 										<span>$120.00</span> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="bottom-area d-flex px-3"> -->
<!-- 								<div class="m-auto d-flex"> -->
<!-- 									<a href="#" -->
<!-- 										class="add-to-cart d-flex justify-content-center align-items-center text-center"> -->
<!-- 										<span><i class="ion-ios-menu"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="buy-now d-flex justify-content-center align-items-center mx-1"> -->
<!-- 										<span><i class="ion-ios-cart"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="heart d-flex justify-content-center align-items-center "> -->
<!-- 										<span><i class="ion-ios-heart"></i></span> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-6 col-lg-3 ftco-animate"> -->
<!-- 					<div class="product"> -->
<!-- 						<a href="#" class="img-prod"><img class="img-fluid" -->
<!-- 							src="images/product-8.jpg" alt="Colorlib Template"> -->
<!-- 							<div class="overlay"></div> </a> -->
<!-- 						<div class="text py-3 pb-4 px-3 text-center"> -->
<!-- 							<h3> -->
<!-- 								<a href="#">Fruit Juice</a> -->
<!-- 							</h3> -->
<!-- 							<div class="d-flex"> -->
<!-- 								<div class="pricing"> -->
<!-- 									<p class="price"> -->
<!-- 										<span>$120.00</span> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="bottom-area d-flex px-3"> -->
<!-- 								<div class="m-auto d-flex"> -->
<!-- 									<a href="#" -->
<!-- 										class="add-to-cart d-flex justify-content-center align-items-center text-center"> -->
<!-- 										<span><i class="ion-ios-menu"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="buy-now d-flex justify-content-center align-items-center mx-1"> -->
<!-- 										<span><i class="ion-ios-cart"></i></span> -->
<!-- 									</a> <a href="#" -->
<!-- 										class="heart d-flex justify-content-center align-items-center "> -->
<!-- 										<span><i class="ion-ios-heart"></i></span> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</section>

	<!-- <section class="ftco-section img" style="background-image: url(images/bg_3.jpg);">
    	<div class="container">
				<div class="row justify-content-end">
          <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
          	<span class="subheading">Best Price For You</span>
            <h2 class="mb-4">Deal of the day</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
            <h3><a href="#">Spinach</a></h3>
            <span class="price">$10 <a href="#">now $5 only</a></span>
            <div id="timer" class="d-flex mt-5">
						  <div class="time" id="days"></div>
						  <div class="time pl-3" id="hours"></div>
						  <div class="time pl-3" id="minutes"></div>
						  <div class="time pl-3" id="seconds"></div>
						</div>
          </div>
        </div>   		
    	</div>
    </section> -->

	<section class="ftco-section testimony-section" >
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<span class="subheading">見證</span>
					<h2 class="mb-4">顧客們都怎麼說</h2>
					<a href="<c:url value='/blogPage'/>" class="btn py-3 px-4 btn-primary">來去逛逛</a>
				</div>
				
			</div>
			<div id="recipeContent"></div>
		</div>
	</section>


	<hr>

	<section class="ftco-section ftco-partner">
		<div class="container">
			<div class="row">
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img src="images/partner-1.png"
						class="img-fluid" alt="Colorlib Template"></a>
				</div>
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img src="images/partner-2.png"
						class="img-fluid" alt="Colorlib Template"></a>
				</div>
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img src="images/partner-3.png"
						class="img-fluid" alt="Colorlib Template"></a>
				</div>
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img src="images/partner-4.png"
						class="img-fluid" alt="Colorlib Template"></a>
				</div>
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img src="images/partner-5.png"
						class="img-fluid" alt="Colorlib Template"></a>
				</div>
			</div>
		</div>
	</section>


	<jsp:include page="./footer.jsp" />


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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
					$.ajax({
						url : "RecommendedProducts",
						type : "POST",
						datatype : "html",
						success : function(data, status) {
							$("#recommendedProductsContent").html(data);
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							alert(XMLHttpRequest.status);
							alert(XMLHttpRequest.readyState);
							alert(textStatus);
						}
					});
	});
	function gotoMallByCategory(category){
		window.location.replace("../siminar/mall_shop?goto=true&category="+category);
		}
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url : "recipeContent",
			type : "POST",
			datatype : "html",
			success : function(data, status) {
				$("#recipeContent").html(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
});
	</script>

</body>
</html>