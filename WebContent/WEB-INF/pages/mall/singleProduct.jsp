<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="ftco-section" id="top_singleProduct">
	<div class="container">
		<div class="row">

			<div class="col-lg-6 mb-5 ftco-animate">
				<a
					href="<c:url value='retrieveImageServlet?id=${selectedProduct.productId}&type=PRODUCT' />"
					class="image-popup"><img
					src="<c:url value='retrieveImageServlet?id=${selectedProduct.productId}&type=PRODUCT' />"
					class="img-fluid" alt="Colorlib Template"></a>
			</div>
			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
				<h3>${selectedProduct.product}</h3>
				<div class="rating d-flex">
					<p class="text-left mr-4">
						<a href="#" class="mr-2">5.0</a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a>
					</p>
					<p class="text-left mr-4">
						<a href="#" class="mr-2" style="color: #000;">瀏覽次數 <span
							style="color: #bbb;">${selectedProduct.views}</span></a>
					</p>
					<p class="text-left">
						<a href="#" class="mr-2" style="color: #000;">出售數 <span
							style="color: #bbb;">${selectedProduct.sold}</span></a>
					</p>
				</div>
				<c:choose>
					<c:when test="${selectedProduct.discount!=1}">
						<p class='price'>
							<span style="color: red">特價${selectedProduct.price * selectedProduct.discount}元</span>
						</p>
					</c:when>
					<c:otherwise>
						<p class="price">
							<span>${selectedProduct.price}元</span>
						</p>
					</c:otherwise>
				</c:choose>
				<p>生產者:${selectedProduct.producterName}</p>
				<p>上架日期:${selectedProduct.addedDate}</p>
				<p>保質期:${selectedProduct.shelfTime}</p>
				<p>${selectedProduct.content}${selectedProduct.unit}</p>
				<p>${selectedProduct.description}</p>
				<div class="row mt-4">
					<div class="col-md-6">
						<div class="form-group d-flex">
							<div class="select-wrap"></div>
						</div>
					</div>
					<div class="w-100"></div>
					<div class="input-group col-md-6 d-flex mb-3">
						<span class="input-group-btn mr-2"> </span> <input type="number"
							id="quantity" name="quantity" class="form-control input-number"
							value="1" min="1" max="${selectedProduct.stock-oi.qty}">
						<span class="input-group-btn ml-2"> </span>
					</div>
					<div class="w-100"></div>
					<div class="col-md-12">
						<p style="color: #000;">庫存:${selectedProduct.stock-oi.qty}</p>
					</div>
				</div>
				<p>
				<c:choose>
					<c:when test="${selectedProduct.stock<=oi.qty}">
					<a href="#" onclick="notEnough()" class="btn btn-black py-3 px-5">加入購物車</a>
					</c:when>
					<c:otherwise>
					<a href="#" onclick="addToCart(${selectedProduct.stock-oi.qty})" class="btn btn-black py-3 px-5">加入購物車</a> 					
					</c:otherwise>
				</c:choose>
					<a href="<c:url value='mall_shoppingcart'/>" class="btn btn-black py-3 px-5">前往購物車</a>
					<a href="#" onclick="goback()" class="btn btn-black py-3 px-5">返回</a>
				</p>
			</div>
		</div>
	</div>
</section>

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
<!-- <script -->
<!-- 	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!-- <script src="js/google-map.js"></script> -->
<script src="js/main.js"></script>
<jsp:include page="../js/mall.jsp" />
<script>
</script>
