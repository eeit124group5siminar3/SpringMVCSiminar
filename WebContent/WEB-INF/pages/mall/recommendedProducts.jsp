<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row justify-content-center mb-3 pb-3">
		<div class="col-md-12 heading-section text-center ftco-animate">
			<span class="subheading">特色產品</span>
			<h2 class="mb-4">優良推薦</h2>
			<!-- <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p> -->
		</div>
	</div>
</div>
<div class="container">
	<div class="row ftco-animate">
		<c:forEach var="item" items="${recommendedProducts}">
			<div class='col-md-6 col-lg-3'>
				<div class='product'>
					<a href='#mainContent' class='img-prod'
						onclick='goToProduct(${item.productId})'> <img
						class='img-fluid'
						src=<c:url value='retrieveImageServlet?id=${item.productId}&type=PRODUCT' />
						alt='Colorlib Template'> <c:if test="${item.discount != 1}">
							<span class='status'>${Math.round((1 - item.discount) * 100)}%</span>
						</c:if>
						<div class='overlay'></div>
					</a>
					<div class='text py-3 pb-4 px-3 text-center'>
						<h3>
							<a href='#'>${item.product}</a>
						</h3>
						<div class='d-flex'>
							<div class='pricing'>
								<c:choose>
									<c:when test="${item.discount!=1}">
										<p class='price'>
											<span class='mr-2 price-dc'>${item.price}元</span> <span
												class='price-sale'>${Math.round(item.price*item.discount)}元</span>
										</p>
									</c:when>
									<c:otherwise>
										<span>${item.price}元</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class='bottom-area d-flex px-3'>
							<div class='m-auto d-flex'>
								<a href='#mainContent' title="產品內容"
									class='add-to-cart d-flex justify-content-center align-items-center text-center'
									onclick='goToProduct(${item.productId})'><span><i
										class='ion-ios-menu'></i></span></a>" <a href='#' title="立即購買"
									class='buy-now d-flex justify-content-center align-items-center mx-1'
									onclick='add_To_Cart(${item.productId},${item.stock},${ShoppingCart.content[item.productId].qty})'><span><i
										class='ion-ios-cart'></i></span></a>
								<c:choose>
									<c:when test="${empty login_ok}">
										<a 
											class='heart d-flex justify-content-center align-items-center'><span
											id="favorite${item.productId}"> <i
												class='ion-ios-heart'></i></span></a>
									</c:when>
									<c:otherwise>
										<a title="願望清單" 
											class='heart d-flex justify-content-center align-items-center'
											onclick="favorite(${item.productId})"><span
											id="favorite${item.productId}"> <c:choose>
													<c:when test="${item.favorite==0}">
														<i class='ion-ios-heart'></i>
													</c:when>
													<c:otherwise>
														<i class='ion-ios-heart' style="color: red"></i>
													</c:otherwise>
												</c:choose>
										</span></a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
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
<!-- <script -->
<!-- 	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!-- <script src="js/google-map.js"></script> -->
<script src="js/main.js"></script>
<jsp:include page="../js/mall.jsp" />