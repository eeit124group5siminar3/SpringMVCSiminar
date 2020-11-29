<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="col-md-12 ftco-animate">
			<div class="cart-list">
			<h1>訂單編號&nbsp;:&nbsp;${orderId}</h1>
				<table class="table">
					<thead class="thead-primary">
						<tr class="text-center">
							<th>&nbsp;</th>
							<th>商品內容</th>
							<th>生產者</th>
							<th>單價</th>
							<th>折扣</th>
							<th>購買數量</th>
							<th>處理狀態</th>
							<th>出貨日期</th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach varStatus="stVar" var="set" items="${items}">
							<tr class="text-center">
								<td class="image-prod"><div class="img"
										style="background-image: url(<c:url value='retrieveImageServlet?id=${set.productId}&type=PRODUCT' />);">
									</div></td>
								<td class="product-name">
									<p>${set.description}</p>
								</td>
								<td>${set.producterName}</td>
								<td class="product-remove">
									<p>${set.unitPrice}</p>
								</td>

								<td>
									<p>${set.discount}</p>
								</td>
								<td class="total">
									<p>${set.amount}</p>
								</td>

								<td>
									<p>${set.status}</p>
								</td>
								<td>
									<p>${set.shippingDate}</p>
								</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<!-- END TR-->
						</c:forEach>
						<!-- END TR-->
					</tbody>
				</table>
				<p>
					<a href="${history.back()}" onclick="orderpage(${order_pageNo})"
						class="btn btn-primary py-3 px-4">回上頁</a> <a
						href="<c:url value='/mall_shop' />"
						class="btn btn-primary py-3 px-4">回商城</a>
				</p>
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