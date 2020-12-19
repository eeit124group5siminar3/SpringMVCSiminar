<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="ftco-section carousel" id="top_singleProduct">
<a class="carousel-control-prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="visually-hidden" style="font-size:80px" onclick="preProduct(${selectedProduct.productId})" role="button" title="前一筆商品">&lt;</span></a>
<a class="carousel-control-next"> <span class="carousel-control-next-icon" aria-hidden="true"></span><span class="visually-hidden" style="font-size:80px" onclick="nextProduct(${selectedProduct.productId})"  role="button" title="後一筆商品">&gt;</span></a>

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
				<h3>${selectedProduct.product}<c:choose>
						<c:when test="${empty login_ok}">
							<span class='heart'
								id="favorite${selectedProduct.productId}"> <i
								class='ion-ios-heart'></i></span>
						</c:when>
						<c:otherwise>
							<span class='heart' title="願望清單"
								onclick="favorite(${selectedProduct.productId})"
								id="favorite${selectedProduct.productId}"> <c:choose>
									<c:when test="${selectedProduct.favorite==0}">
										<i class='ion-ios-heart'></i>
									</c:when>
									<c:otherwise>
										<i class='ion-ios-heart' style="color: red"></i>
									</c:otherwise>
								</c:choose>
							</span>
						</c:otherwise>
					</c:choose>
				</h3>
				<div class="rating d-flex">
					<p class="text-left mr-4">
						<span class="mr-2" style="color: #00BB00">${selectedProduct.score.toString().substring(0,3)}</span>
						<c:forEach begin="1" end="5" var="i">
							<c:choose>
								<c:when test="${i<Math.ceil(selectedProduct.score)}">
									<span class="ion-ios-star" style="color: #FFD306"></span>
								</c:when>
								<c:when test="${i==Math.ceil(selectedProduct.score)}">
									<c:choose>
										<c:when
											test="${Math.ceil(selectedProduct.score)-selectedProduct.score<0.25}">
											<span class="ion-ios-star" style="color: #FFD306"></span>
										</c:when>
										<c:when
											test="${Math.ceil(selectedProduct.score)-selectedProduct.score>0.75}">
											<span class="ion-ios-star-outline"></span>
										</c:when>
										<c:otherwise>
											<span class="ion-ios-star-half" style="color: #FFD306"></span>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<span class="ion-ios-star-outline"></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
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
							<span style="color: red">特價${Math.round(selectedProduct.price * selectedProduct.discount)}元</span>
						</p>
					</c:when>
					<c:otherwise>
						<p class="price">
							<span>${selectedProduct.price}元</span>
						</p>
					</c:otherwise>
				</c:choose>
				<div style="font-size=16px;font-weight: bold;">
				<p>生產者:${selectedProduct.producterName}</p>
				<p>上架日期:${selectedProduct.addedDate}</p>
				<p>購買期限:${selectedProduct.expiredDateString}</p>
				<p>${selectedProduct.content}${selectedProduct.unit}</p>
				<p>${selectedProduct.description}</p>
				</div>
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
							<a href="##" onclick="notEnough()" class="btn btn-black py-3 px-5">加入購物車</a>
						</c:when>
						<c:otherwise>
							<a href="##" onclick="addToCart(${selectedProduct.stock-oi.qty})"
								class="btn btn-black py-3 px-5">加入購物車</a>
						</c:otherwise>
					</c:choose>
					<a href="<c:url value='mall_shoppingcart#cartContent'/>"
						class="btn btn-black py-3 px-5">前往購物車</a> <a href="#mainContent"
						onclick="goback()" class="btn btn-black py-3 px-5">返回</a>
				</p>
			</div>
		</div>
	</div>
</section>
<input type="hidden" id="shoppingcartItemNum" value="${ShoppingCartItemNum}" />
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
