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
							<th>商品</th>
							<th>店家名稱</th>				
							<th>單價</th>
							<th>數量</th>
							<th>總價錢</th>
							<th>&nbsp;</th>

						</tr>
					</thead>
					
					<tbody>
                           <c:forEach var="item" items="${order}">
							<tr class="text-center">
								<td class="image-prod"><div class="img"
										style="background-image: url(<c:url value='MarketImageServlet?id=${item.marketProductTotalBean.marketProductImgBean.productId}&type=PRODUCT' />);">
									</div></td>
									
								<td class="product-name">
									<p>${item.marketProductTotalBean.productName}</p>
								</td>
								<td class="product-name">
									<p>${item.marketProductTotalBean.marketMallBean.mallName}</p>
								</td>
								<td class="product-name">
									<p>${item.marketProductTotalBean.price}元</p>
								</td>
								<td class="product-name">
									<p>${item.quantity}</p>
								</td>
								<td class="product-name">
									<p>${item.marketProductTotalBean.price*item.quantity}元</p>
								</td>
							</tr>
							<!-- END TR-->
						<!-- END TR-->
                         	</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>
<!-- 	<div class="col-lg-4 mt-5 cart-wrap ftco-animate"> -->
<!-- 		<div class="cart-total mb-3"> -->
<!-- 		     <p> -->
<%-- 			<a href="<c:url value='/' />" --%>
<!-- 				class="btn btn-primary py-3 px-4">回首頁</a> <a -->
<%-- 				href="<c:url value='/GoMarketHome' />" --%>
<!-- 				class="btn btn-primary py-3 px-4">我要繼續買</a> -->
<!-- 		     </p> -->
<!-- 		</div> -->
<!-- 	</div>	 -->
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

