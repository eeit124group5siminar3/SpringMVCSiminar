<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>農郁</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">

<style>
* {
	box-sizing: border-box;
}

.wrap {
	width: 900px;
	margin: auto;
	display: flex;
	align-items: center;
	padding-top: 10px;
}

 .wrap img { 
 	width: 100%; 
 	height: 100%; 
 	vertical-align: middle; 
 	margin-right: 20px; 
 } 

.txt {
	width: 50%;
	vertical-align: middle;
	padding-left: 20px;
}

.heart:hover {
	color: red;
}
</style>

</head>
<body class="goto-here">
	<div id="addSuccess">
		<jsp:include page="../header.jsp" />


		<!-------------------------內容區--------------------------------->

		<c:if test="${login_ok==null}">
			<div align="center">
				<form action="frontPage.controller" method="get" runat="server">
					<fieldset>
						<legend>搜尋結果</legend>
						<c:forEach var='BeanToken' items="${List}">
							<div class="wrap" style="text-align: center;">
								<a
									href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">
									<img height="100" width="100%"
									src="<c:url value='/getALLImage.controller?rec_id=${BeanToken.rec_id}'/>" />
								</a>

								<div class="txt">
									<div align="center">
										<h2 align="center"
											style="width: 300px; float: left; display: inline">
											<a
												href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a>
										</h2>

										<input type="hidden" id="send" value="${BeanToken.rec_id}" />
										<h2 style="width: 50px; float: left; display: inline">
											<a href="javascript:void(0);"
												class="heart d-flex justify-content-center align-items-center "
												onclick="fun(${login_ok})"><span><i
													class="ion-ios-heart" id="heart"></i></span> </a>
										</h2>
									</div>
									<div>
										<p>累積人氣: ${BeanToken.views}</p>
									</div>
									<hr>
									<div>
										<a
											href="<c:url value='/MallContent?searchString=${BeanToken.ingredients_A}'/>">
											<p>食材:${BeanToken.ingredients_A}</p>
										</a>
										<p>食材: ${BeanToken.ingredients_B}</p>
										<p>介紹 : ${BeanToken.desc}</p>
										<p>料理方法 : ${BeanToken.method}</p>
									</div>
								</div>
							</div>
							<hr>
						</c:forEach>
						<div style="text-align: center;">
							<label> <input type="submit" value="回首頁" />
							</label>
						</div>
					</fieldset>
				</form>
			</div>
		</c:if>

		<c:if test="${login_ok!=null}">
			<c:if test="${flag==true}">
				<div align="center">
					<form action="frontPage.controller" method="get" runat="server">
						<fieldset>
							<legend>搜尋結果</legend>


							<c:forEach var='BeanToken' items="${list}">
								<div class="wrap" style="text-align: center;">
									<a
										href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">
										<img height="100" width="80"
										src="<c:url value='/getALLImage.controller?rec_id=${BeanToken.rec_id}'/>" />
									</a>

									<div class="txt">
										<div align="center">
											<h2 align="center"
												style="width: 300px; float: left; display: inline">
												<a
													href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a>
											</h2>

											<input type="hidden" id="send" value="${BeanToken.rec_id}" />
											<h2 style="width: 50px; float: left; display: inline">
												<a href="javascript:void(0);"
													class="heart d-flex justify-content-center align-items-center "
													onclick="fun('${login_ok}')"> <span><i
														class="ion-ios-heart" id="heart" style="color: red;"></i></span></a>
											</h2>
										</div>
										<div>
										<p>累積人氣: ${BeanToken.views}</p>
										</div>
										<hr>
										<div>
											<a
												href="<c:url value='/MallContent?searchString=${BeanToken.ingredients_A}'/>">
												<p>食材:${BeanToken.ingredients_A}</p>
											</a>
											<h5>食材  :  </h5>
											<p>${BeanToken.ingredients_B}</p>
											<h5>介紹  :  </h5>
											<p>${BeanToken.desc}</p>
											<h5>料理方法 :  </h5>
											<p>${BeanToken.method}</p>
										</div>
									</div>
								</div>
								<hr>
							</c:forEach>

							<div style="text-align: center;">
								<label> <input type="submit" value="回首頁" />
								</label>
							</div>
						</fieldset>
					</form>
				</div>
			</c:if>

			<c:if test="${flag!=true}">
				<div align="center">
					<form action="frontPage.controller" method="get" runat="server">
						<fieldset>
							<legend>搜尋結果</legend>


							<c:forEach var='BeanToken' items="${list}">
								<div class="wrap" style="text-align: center;">
									<a
										href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">
										<img height="100" width="80"
										src="<c:url value='/getALLImage.controller?rec_id=${BeanToken.rec_id}'/>" />
									</a>

									<div class="txt">
										<div align="center">
											<h2 align="center"
												style="width: 300px; float: left; display: inline">
												<a
													href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a>
											</h2>


											<input type="hidden" id="send" value="${BeanToken.rec_id}" />
											<h2 style="width: 50px; float: left; display: inline">
												<a href="javascript:void(0);"
													class="heart d-flex justify-content-center align-items-center "
													onclick="fun('${login_ok}')"> <span><i
														class="ion-ios-heart" id="heart"></i></span></a>
											</h2>
										</div>
										<div>
										<p>累積人氣: ${BeanToken.views}</p>
										</div>
										<hr>
										<div>
											<a
												href="<c:url value='/MallContent?searchString=${BeanToken.ingredients_A}'/>">
												<p>食材:${BeanToken.ingredients_A}</p>
											</a>
											<h5>食材  :  </h5>
											<p>${BeanToken.ingredients_B}</p>
											<h5>介紹  :  </h5>
											<p>${BeanToken.desc}</p>
											<h5>料理方法 :  </h5>
											<p>${BeanToken.method}</p>
										</div>
									</div>
								</div>
								<hr>
							</c:forEach>

							<div style="text-align: center;">
								<label> <input type="submit" value="回首頁" />
								</label>
							</div>
						</fieldset>
					</form>
				</div>
			</c:if>


		</c:if>

	</div>
	<!------------------------------------------------------------------>
	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row">
				<div class="mouse">
					<!-- 					<a href="#" class="mouse-icon"> -->
					<!-- 						<div class="mouse-wheel"> -->
					<!-- 							<span class="ion-ios-arrow-up"></span> -->
					<!-- 						</div> -->
					<!-- 					</a> -->
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">農郁</h2>
						<p>最適合您的電商平台</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<!-- <h2 class="ftco-heading-2">Menu</h2> -->
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">商城</a></li>
							<li><a href="#" class="py-2 d-block">關於我</a></li>
							<!-- <li><a href="#" class="py-2 d-block">Journal</a></li> -->
							<li><a href="#" class="py-2 d-block">聯絡我們</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="ftco-footer-widget mb-4">
						<!-- <h2 class="ftco-heading-2">其他問題</h2> -->
						<div class="d-flex">
							<ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
								<li><a href="#" class="py-2 d-block">運送訊息</a></li>
								<li><a href="#" class="py-2 d-block">退換貨</a></li>
								<li><a href="#" class="py-2 d-block">條款及細則</a></li>
								<li><a href="#" class="py-2 d-block">隱私政策</a></li>
							</ul>
							<ul class="list-unstyled">
								<li><a href="#" class="py-2 d-block">常見問題</a></li>
								<!-- <li><a href="#" class="py-2 d-block">Contact</a></li> -->
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<!-- <h2 class="ftco-heading-2">Have a Questions?</h2> -->
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">320 桃園市中壢區中大路300號</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">0800-092-000</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">service@nonre.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>.
						Downloaded from <a href="https://themeslab.org/" target="_blank">Themeslab</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>


	<script type="text/javascript">
// 	$(document).ready(function() {
// 		// 			var cartcontent=document.getElementById("cartContent");
// 		$.ajax({
// 			url : "MallContent",
// 			type : "GET",
// 			data : {"categoryId":0,"pageNo":1},
// 			datatype : "html",
// 			success : function(data, status) {
// 				$("#mainContent").html(data);
// 			},
// 			error : function(data, status) {
// 				$("#mainContent").html(data);
// 			}
// 		});
// 	}); 


// 	$("#heart").click(function(){
// 		var addSuccess=$("#addSuccess");
// 		var rec_id=$("#send").val();
// 			console.log('rec_id: '+rec_id);
// 			$.ajax({
// 	 			type:"GET",
// 	 			url:"./bookmark",
// 	 			data:{"rec_id":rec_id},
// 	 			success:function(response){
// 	 				alert('succccccccccccccccccccces');
// 	 				console.log('response: '+response);
// 	 				}
// 	 			});
// 	});

	function fun(login_ok){
		var addSuccess=$("#addSuccess");
		console.log('login_okval: '+login_ok);
		var rec_id=$("#send").val();
		console.log('rec_id: '+rec_id);
		if(login_ok!=null){
			$.ajax({
			type:"GET",
			url:"./bookmark",
			data:{"rec_id":rec_id},
			success:function(response){
				alert(response);
				$("#heart").css("color","red");
				}
			});
		}else{
			$.ajax({
				type:"GET",
				url:"./login.controller",
				success:function(response){				
				addSuccess.html(response);
				}
			});
		}
	}
	</script>
</body>
</html>