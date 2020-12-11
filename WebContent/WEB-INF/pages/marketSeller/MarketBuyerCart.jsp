<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container">
	<div class="row">
		<div class="col-md-12 ftco-animate">
			<div class="cart-list">
<%-- 				<a href="#" onclick="reduceItem(${anEntry.value.productId})"><span --%>
<!-- 					class="ion-ios-close"></span></a> -->
				<table class="table">
					<thead class="thead-primary">
						<tr class="text-center">
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th>商品名稱</th>
							<th>商店名稱</th>
							<th>單價</th>
							<th>數量</th>
							<th>價格</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item"
							items="${marketCart.content}">
							<tr class="text-center">
								<td class="product-remove"><a href="#"
									onclick="removeItem(${item.value.productId})"><span
										class="ion-ios-close"></span></a></td>

								<td class="image-prod"><div class="img"
										style="background-image: url(<c:url value='MarketImageServlet?id=${item.value.productId}&type=PRODUCT' />);">
									</div></td>

								<td>
									<h3>${item.value.product}</h3>
								
								</td>

								<td class="price">${item.value.producterName}</td>
								<td class="price">${item.value.price}元</td>

								<td class="quantity">
									<div class="input-group mb-3">
										<input type="text" name="quantity"
											class="quantity form-control input-number"
											value="${item.value.quantity}"
											onblur="changeQty(event,${item.value.productId},${item.value.stock},${item.value.quantity})"
											min="1" max="${item.value.stock}">
									</div>
								</td>

								<td class="total">${item.value.price*item.value.quantity}元</td>
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
			<h3>購買統計</h3>
			<p class="d-flex">
				<span>小計</span> <span>${marketCart.subtotal}</span>
			</p>

			<hr>
			<p class="d-flex total-price">
				<span>總計</span> <span>${marketCart.total}</span>
			</p>
		</div>
		<p>
			<a href="<c:url value='/Mall_checkout' />"
				class="btn btn-primary py-3 px-4">去結帳</a> <a
				href="<c:url value='/GoMarketHome' />"
				class="btn btn-primary py-3 px-4">我要繼續買</a>
		</p>
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
<jsp:include page="../js/Market.jsp" />
<script>

</script>