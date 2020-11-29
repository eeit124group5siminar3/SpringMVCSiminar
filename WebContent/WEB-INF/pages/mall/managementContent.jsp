<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<div class="row">
		<div class="col-md-12 ftco-animate">
		<div><button class="btn btn-primary btn-block">新增商品</button><br/></div>
		<div>
		<span id='test1'></span>
			<table class="table table-hover">
			<thead class="thead-light">
			<tr>
			<th>產品名稱</th>
			<th>內容</th>
			<th>庫存</th>
			<th>上架時間</th>
			<th>保質期</th>
			</tr>
			</thead>
			<c:forEach var="item" items="${management_DPP}">
			<tr class="table-=active" onclick="test2()">
			<th>${item.product}</th>
			<th>${item.content}${item.unit}</th>
			<th>${item.stock}</th>
			<th>${item.addedDate}</th>
			<th>${item.shelfTime}</th>
			</tr>
			</c:forEach>
			</table>
		</div>
		<div>
		<div class='col text-center'>
			<div class='block-27'>
				<ul>
					<c:choose>
						<c:when test="${management_pageNo <= 1}">
							<li><span>&lt;&lt;</span></li>
							<li><span>&lt;</span></li>
						</c:when>
						<c:otherwise>
							<li><a href='#product_top' onclick='managementPage(1)'>&lt;&lt;</a></li>
							<li><a href='#product_top' onclick='managementPage(${management_pageNo - 1})'>&lt;</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${management_totalPages <= 5}">
							<c:forEach begin="1" end="${management_totalPages}" step="1" var="i">
								<c:choose>
									<c:when test="${management_pageNo == i}">
										<li class='active'><span>${i}</span></li>
									</c:when>
									<c:otherwise>
										<li><a href='#product_top' onclick='managementPage(${i})'>${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${management_pageNo <4 }">
									<c:forEach begin="1" end="5" step="1" var="i">
										<c:choose>
											<c:when test="${management_pageNo == i}">
												<li class='active'><span>${i}</span></li>
											</c:when>
											<c:otherwise>
												<li><a href='#product_top' onclick='managementPage(${i})'>${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:when test="${management_pageNo > (management_totalPages - 3)}">
									<c:forEach begin="${management_totalPages - 4}" end="${management_totalPages}"
										step="1" var="i">
										<c:choose>
											<c:when test="${management_pageNo == i}">
												<li class='active'><span>${i}</span></li>
											</c:when>
											<c:otherwise>
												<li><a href='#product_top' onclick='managementPage(${i})'>${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach begin="${management_pageNo - 2}" end="${management_pageNo + 2}" step="1"
										var="i">
										<c:choose>
											<c:when test="${management_pageNo == i}">
												<li class='active'><span>${i}</span></li>
											</c:when>
											<c:otherwise>
												<li><a href='#product_top' onclick='managementPage(${i})'>${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${management_pageNo >= management_totalPages}">
							<li><span>&gt;</span></li>
							<li><span>&gt;&gt;</span></li>
						</c:when>
						<c:otherwise>
							<li><a href='#product_top' onclick='managementPage(${management_pageNo + 1})'>&gt;</a></li>
							<li><a href='#product_top' onclick='managementPage(${management_totalPages})'>&gt;&gt;</a></li>
						</c:otherwise>
					</c:choose>
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
<!-- 	<script -->
<!-- 		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!-- 	<script src="js/google-map.js"></script> -->
<script src="js/main.js"></script>
<jsp:include page="../js/mall.jsp" />
<script>
function test2(){
	document.getElementById("test1").innerHTML="123";
}

</script>