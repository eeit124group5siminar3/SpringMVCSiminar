<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-10 mb-5 text-center">
			<ul class="product-category" id="product-category">
				<c:forEach var="anEntry" items="${categoryBean}">
					<c:choose>
						<c:when test="${anEntry.key == categoryId}">
							<li class='active'><span>${anEntry.value}</span></li>
						</c:when>
						<c:otherwise>
							<li><a href='#product_top'
								onclick='productCategory(${anEntry.key})'>${anEntry.value}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
			<form class="product-category" action="javascript:void(0)"
				method="GET">
				<input type="search" name="searchString" id="searchString"
					value="${searchString}" />
				<button name="searchButton" style="border-radius: 5px;"
					onclick="searchProduct()">查詢</button>
			</form>
		</div>
	</div>
	<div class="row  ftco-animate" id="mall_products">
		<c:forEach var="item" items="${products_DPP}">
			<div class='col-md-6 col-lg-3'>
				<div class='product'>
					<a href='#mall_products' class='img-prod'
						onclick='singleProduct(${item.productId})'> <img
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
												class='price-sale'>${item.price*item.discount}元</span>
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
								<a href='#mall_products' title="加入購物車"
									class='add-to-cart d-flex justify-content-center align-items-center text-center'
									onclick='add_To_Cart(${item.productId},${item.stock},${ShoppingCart.content[item.productId].qty})'><span><i
										class='ion-ios-menu'></i></span></a>" <a href='#mall_products' title="來去結帳"
									class='buy-now d-flex justify-content-center align-items-center mx-1'><span><i
										class='ion-ios-cart'></i></span></a> <a href='#mall_products'
									class='heart d-flex justify-content-center align-items-center '><span><i
										class='ion-ios-heart'></i></span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<div id="mall_pages">
	<div class='row mt-5'>
		<div class='col text-center'>
			<div class='block-27'>
				<ul>
					<c:choose>
						<c:when test="${pageNo <= 1}">
							<li><span>&lt;&lt;</span></li>
							<li><span>&lt;</span></li>
						</c:when>
						<c:otherwise>
							<li><a href='#product_top' onclick='page(1)'>&lt;&lt;</a></li>
							<li><a href='#product_top' onclick='page(${pageNo - 1})'>&lt;</a></li>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${totalPages <= 5}">
							<c:forEach begin="1" end="${totalPages}" step="1" var="i">
								<c:choose>
									<c:when test="${pageNo == i}">
										<li class='active'><span>${i}</span></li>
									</c:when>
									<c:otherwise>
										<li><a href='#product_top' onclick='page(${i})'>${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:when test="${pageNo > (totalPages - 3)}">
							<c:forEach begin="${totalPages - 4}" end="${totalPages}" step="1"
								var="i">
								<c:choose>
									<c:when test="${pageNo == i}">
										<li class='active'><span>${i}</span></li>
									</c:when>
									<c:otherwise>
										<li><a href='#product_top' onclick='page(${i})'>${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach begin="${pageNo - 2}" end="${pageNo + 2}" step="1"
								var="i">
								<c:choose>
									<c:when test="${pageNo == i}">
										<li class='active'><span>${i}</span></li>
									</c:when>
									<c:otherwise>
										<li><a href='#product_top' onclick='page(${i})'>${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${pageNo >= totalPages}">
							<li><span>&gt;</span></li>
							<li><span>&gt;&gt;</span></li>
						</c:when>
						<c:otherwise>
							<li><a href='#product_top' onclick='page(${pageNo + 1})'>&gt;</a></li>
							<li><a href='#product_top' onclick='page(${totalPages})'>&gt;&gt;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
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
<script>
</script>
