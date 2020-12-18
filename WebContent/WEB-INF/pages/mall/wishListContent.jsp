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
							<th>願望清單</th>
							<th>&nbsp;</th>
							<th>單價</th>
							<th>尚餘</th>
							<th>購買期限</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach varStatus="stVar" var="list" items="${productWishList}">
							<tr class="text-center">
								<td class="product-remove"><a onclick="reduceFavorite(${list.productId})"><span
										class="ion-ios-close"></span></a></span></a></td>

								<td class="image-prod"><div class="img"
										style="background-image: url(<c:url value='retrieveImageServlet?id=${list.productId}&type=PRODUCT' />);" onclick="goToProduct(${list.productId})"></div></td>

								<td class="product-name">
									<h3>${list.product}</h3>
									<p>${list.content}${list.unit}</p>
									<p>${list.description}</p>
								</td>

								<td class="price">${Math.round(list.price*list.discount)}元</td>

								<td class="quantity">${list.stock}</div>
								</td>

								<td class="total">${list.expiredDateString}</td>
							</tr>
							<!-- END TR-->
						</c:forEach>

					</tbody>
				</table>
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
	//取消商品願望清單
	function reduceFavorite(productId) {
		$.ajax({
			url : "WishListContent",
			type : "POST",
			data : {
				"productId" : productId
			},
			datatype : "html",
			success : function(data, status) {
				$("#wishListContent").html(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}

// 	function goToProduct(productId){
// 		window.location.replace("../siminar/mall_shop?flag=true&productId="+productId);
// 		}
</script>