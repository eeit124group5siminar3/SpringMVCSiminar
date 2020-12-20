<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="col-md-12 ftco-animate">
			<div class="cart-list">
				<table class="table">
					<thead class="thead-primary">
						<tr class="text-center">
							<th>&nbsp;</th>
							<th>訂單編號</th>
							<th>訂購日期</th>
							<th>收件者姓名</th>
							<th>收件地址</th>
							<th>連絡電話</th>
							<th>總金額</th>
<!-- 							<th>處理狀態</th> -->
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach varStatus="stVar" var="list" items="${memberOrders}">
							<tr class="text-center">
								<td>
									<button type="button" class="btn btn-outline-secondary"
										onclick="orderDetail(${list.orderId})">詳細資料</button>
								</td>
								<td class="product-remove">
									<p>${list.orderId}</p>
								</td>
								<td>
									<p>${list.orderDate.toString().substring(0,10)}</p>
								</td>

								<td>
									<p>${list.buyerName}</p>
								</td>
								<td class="product-name">
									<p>${list.address}</p>
								</td>
								<td>
									<p>${list.tel}</p>
								</td>
								<td class="total">
									<p>${list.total}元</p>
								</td>
<!-- 								<td>&nbsp;</td> -->
								<td>&nbsp;</td>
							</tr>
							<!-- END TR-->
						</c:forEach>
						<!-- END TR-->
					</tbody>
				</table>
				<p>
					<a href="<c:url value='/mall_shop' />"
						class="btn btn-primary py-3 px-4">回商城</a> <a
						href="<c:url value='/mall_shoppingcart' />"
						class="btn btn-primary py-3 px-4">回購物車</a>
				</p>
			</div>
			<div class='row mt-5'>
				<div class='col text-center'>
					<div class='block-27'>
						<ul>
							<c:forEach begin="1" end="${order_totalPages}" step="1" var="i">
								<c:choose>
									<c:when test="${order_pageNo == i}">
										<li class='active'><span>${i}</span></li>
									</c:when>
									<c:otherwise>
										<li><a href='#product_top' onclick='orderPage(${i})'>${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
				</div>
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