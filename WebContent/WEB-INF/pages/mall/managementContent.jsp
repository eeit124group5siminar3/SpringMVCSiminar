<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<div class="row">
		<div class="col-md-12 ftco-animate">
			<div>
				<button class="btn btn-primary btn-block" data-toggle="modal"
					data-target="#insert">新增商品</button>
				<br />
			</div>
			<div>
				<table class="table table-hover">
					<thead class="thead-light">
						<tr>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th>產品名稱</th>
							<th>內容</th>
							<th>庫存</th>
							<th>上架時間</th>
							<th>到期日</th>
						</tr>
					</thead>
					<c:forEach var="item" items="${management_DPP}">
						<tr class="text-center" data-toggle="modal"
							data-target="#update" data-whatever="${item.productId}">
							<td id="${item.productId}"><c:choose>
									<c:when test="${item.stock<=0}">
										<button type="button" class="btn btn-primary btn-sm"
											disabled="disabled">上架</button>
									</c:when>
									<c:otherwise>
										<c:if test="${item.status==0}">
											<button type="button" class="btn btn-primary btn-sm"
												onclick="shelf(event,1)">上架</button>
										</c:if>
										<c:if test="${item.status==1}">
											<button type="button" class="btn btn-primary btn-sm disabled"
												onclick="shelf(event,0)">下架</button>
										</c:if>
									</c:otherwise>
								</c:choose></td>
							<td class="image-prod"
								style="padding-top: 5px; padding-bottom: 5px"><div
									class="img"
									style="background-image: url(<c:url value='retrieveImageServlet?id=${item.productId}&type=PRODUCT' />);"></div></td>
							<td>${item.product}</td>
							<td>${item.content}${item.unit}</td>
							<td>${item.stock}</td>
							<td>${item.addedDate}</td>
							<td>${item.expiredDateString}</td>
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
									<li><a href='#managementContent' onclick='managementPage(1)'>&lt;&lt;</a></li>
									<li><a href='#managementContent'
										onclick='managementPage(${management_pageNo - 1})'>&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${management_totalPages <= 5}">
									<c:forEach begin="1" end="${management_totalPages}" step="1"
										var="i">
										<c:choose>
											<c:when test="${management_pageNo == i}">
												<li class='active'><span>${i}</span></li>
											</c:when>
											<c:otherwise>
												<li><a href='#managementContent'
													onclick='managementPage(${i})'>${i}</a></li>
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
														<li><a href='#managementContent'
															onclick='managementPage(${i})'>${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:when
											test="${management_pageNo > (management_totalPages - 3)}">
											<c:forEach begin="${management_totalPages - 4}"
												end="${management_totalPages}" step="1" var="i">
												<c:choose>
													<c:when test="${management_pageNo == i}">
														<li class='active'><span>${i}</span></li>
													</c:when>
													<c:otherwise>
														<li><a href='#managementContent'
															onclick='managementPage(${i})'>${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach begin="${management_pageNo - 2}"
												end="${management_pageNo + 2}" step="1" var="i">
												<c:choose>
													<c:when test="${management_pageNo == i}">
														<li class='active'><span>${i}</span></li>
													</c:when>
													<c:otherwise>
														<li><a href='#managementContent'
															onclick='managementPage(${i})'>${i}</a></li>
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
									<li><a href='#managementContent'
										onclick='managementPage(${management_pageNo + 1})'>&gt;</a></li>
									<li><a href='#managementContent'
										onclick='managementPage(${management_totalPages})'>&gt;&gt;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
						<a href="<c:url value='/mall_manageOrder'/>"
						class="btn btn-primary py-3 px-4" style="float:right" >訂單管理</a>
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
function shelf(event,productStatus){
	event.stopPropagation(); 
	var productId=event.path[1].id;
	$.ajax({
		url : "Shelf",
		type : "POST",
		data : {
			"productId" : productId,
			"status" :productStatus
		},
		success : function(data, status) {
			if(data==1){
			event.path[1].innerHTML="<button type='button' class='btn btn-primary btn-sm disabled' onclick='shelf(event,0)'>下架</button>";		
				}else{
			event.path[1].innerHTML="<button type='button' class='btn btn-primary btn-sm' onclick='shelf(event,1)'>上架</button>";
					}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
		}
	});
	
}

function fastInput1(){
	document.forms[0][0].value="波菜";
	document.forms[0][1].value=50;
	document.forms[0][2].value=7;
	document.forms[0][3].value=35;
	document.forms[0][4].value=1;
	document.forms[0][5].value="臺斤";
	document.forms[0][6].value=1.0;
	document.forms[0][7].value=1;
// 	document.forms[0][8].src="<c:url value='/images/波菜.jpg' />";
	document.forms[0][9].value="新鮮美味的波菜，產地直銷";
	}
function fastInput2(){
	document.forms[0][0].value="地瓜";
	document.forms[0][1].value=75;
	document.forms[0][2].value=15;
	document.forms[0][3].value=60;
	document.forms[0][4].value=500;
	document.forms[0][5].value="克";
	document.forms[0][6].value=1.0;
	document.forms[0][7].value=2;
// 	document.forms[0][8].value="/WEB-INF/pages/images/地瓜.jpg";
	document.forms[0][9].value="好吃又營養的地瓜，現在購買正是時候";
	}
function fastInput3(){
	document.forms[0][0].value="栗子南瓜";
	document.forms[0][1].value=150;
	document.forms[0][2].value=30;
	document.forms[0][3].value=50;
	document.forms[0][4].value=1;
	document.forms[0][5].value="顆";
	document.forms[0][6].value=1.0;
	document.forms[0][7].value=3;
// 	document.forms[0][8].value="/WEB-INF/pages/images/栗子南瓜.jpg";
	document.forms[0][9].value="好吃的栗子南瓜，每顆足重1.5公斤";
	}
function fastInput4(){
	document.forms[0][0].value="包種茶";
	document.forms[0][1].value=300;
	document.forms[0][2].value=180;
	document.forms[0][3].value=100;
	document.forms[0][4].value=1;
	document.forms[0][5].value="公斤";
	document.forms[0][6].value=1.0;
	document.forms[0][7].value=4;
// 	document.forms[0][8].value="/WEB-INF/pages/images/包種茶.jpg";
	document.forms[0][9].value="坪林特產，春茶上市";
	}
function fastInput5(){
	document.forms[0][0].value="西瓜";
	document.forms[0][1].value=119;
	document.forms[0][2].value=15;
	document.forms[0][3].value=200;
	document.forms[0][4].value=1;
	document.forms[0][5].value="顆";
	document.forms[0][6].value=1.0;
	document.forms[0][7].value=5;
// 	document.forms[0][8].value="/WEB-INF/pages/images/西瓜.jpg";
	document.forms[0][9].value="包甜，每顆約20台斤";
	}
</script>