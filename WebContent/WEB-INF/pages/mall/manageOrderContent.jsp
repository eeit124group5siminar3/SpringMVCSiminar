<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<div class="row">
		<div class="col-md-12 ftco-animate">
			<div>
				<table class="table table-hover">
					<thead class="thead-light">
						<tr>
							<th>&nbsp;</th>
							<th>訂單編號</th>
							<th>產品</th>
							<th>數量</th>
							<th>下定日期</th>
							<th>期望送達時段</th>
							<th>狀態管理</th>
						</tr>
					</thead>
					<c:forEach var="item" items="${manageOrder_DPP}">
						<tr class="text-center" data-toggle="modal"
							data-target="#manageOrder" data-whatever="${item.itemId}">
							<td></td>
							<td>${item.productOrderBean.orderId}</td>
							<td>${item.description}</td>
							<td>${item.amount}</td>
							<td>${item.productOrderBean.orderDate.toString().substring(0,10)}</td>
							<td>${item.productOrderBean.shippingTimeWord}</td>
							<td id="${item.itemId}">${item.statusTag}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div>
				<div class='col text-center'>
					<div class='block-27'>
						<ul>
							<c:choose>
								<c:when test="${manageOrder_pageNo <= 1}">
									<li><span>&lt;&lt;</span></li>
									<li><span>&lt;</span></li>
								</c:when>
								<c:otherwise>
									<li><a href='#manageOrderContent' onclick='manageOrderPage(1)'>&lt;&lt;</a></li>
									<li><a href='#manageOrderContent'
										onclick='manageOrderPage(${manageOrder_pageNo - 1})'>&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${manageOrder_totalPages <= 5}">
									<c:forEach begin="1" end="${manageOrder_totalPages}" step="1"
										var="i">
										<c:choose>
											<c:when test="${manageOrder_pageNo == i}">
												<li class='active'><span>${i}</span></li>
											</c:when>
											<c:otherwise>
												<li><a href='#manageOrderContent'
													onclick='manageOrderPage(${i})'>${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${manageOrder_pageNo <4 }">
											<c:forEach begin="1" end="5" step="1" var="i">
												<c:choose>
													<c:when test="${manageOrder_pageNo == i}">
														<li class='active'><span>${i}</span></li>
													</c:when>
													<c:otherwise>
														<li><a href='#manageOrderContent'
															onclick='manageOrderPage(${i})'>${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:when
											test="${manageOrder_pageNo > (manageOrder_totalPages - 3)}">
											<c:forEach begin="${manageOrder_totalPages - 4}"
												end="${manageOrder_totalPages}" step="1" var="i">
												<c:choose>
													<c:when test="${manageOrder_pageNo == i}">
														<li class='active'><span>${i}</span></li>
													</c:when>
													<c:otherwise>
														<li><a href='#manageOrderContent'
															onclick='manageOrderPage(${i})'>${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach begin="${manageOrder_pageNo - 2}"
												end="${manageOrder_pageNo + 2}" step="1" var="i">
												<c:choose>
													<c:when test="${manageOrder_pageNo == i}">
														<li class='active'><span>${i}</span></li>
													</c:when>
													<c:otherwise>
														<li><a href='#manageOrderContent'
															onclick='manageOrderPage(${i})'>${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${manageOrder_pageNo >= manageOrder_totalPages}">
									<li><span>&gt;</span></li>
									<li><span>&gt;&gt;</span></li>
								</c:when>
								<c:otherwise>
									<li><a href='#manageOrderContent'
										onclick='manageOrderPage(${manageOrder_pageNo + 1})'>&gt;</a></li>
									<li><a href='#manageOrderContent'
										onclick='manageOrderPage(${manageOrder_totalPages})'>&gt;&gt;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
						<a href="<c:url value='/mall_management'/>"
							class="btn btn-primary py-3 px-4" style="float: right">商品管理</a>
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
<!-- 	<script -->
<!-- 		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!-- 	<script src="js/google-map.js"></script> -->
<script src="js/main.js"></script>
<jsp:include page="../js/mall.jsp" />
<script>
// function orderManagement(event,orderStatus){
// 	event.stopPropagation(); 
// 	console.log(event);
// 	var orderDetailId=event.path[1].id;
// 	$.ajax({
// 		url : "OrderManagement",
// 		type : "POST",
// 		data : {
// 			"orderDetailId" : orderDetailId,
// 			"status" : orderStatus
// 		},
// 		success : function(data, status) {
// 			event.path[1].innerHTML=data;
// 		},
// 		error : function(data, status) {
// 			event.path[1].innerHTML=data;
// 		}	
// 		});	
// }
</script>