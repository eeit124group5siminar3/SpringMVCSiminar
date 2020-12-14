<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1 no-cache不能存快取
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html lang="zh">
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
.backstage-footer-ground {
	width: 100%;
	top: 800px;
	position: absolute;
}

#project_backstage {
	width: 150px;
	position: absolute;
	font-weight: bold;
	top: 150px;
	left: 15px;
	color: white;
	display: block;
}

.active_backstage {
	height: 400px;
	width: 1100px;
}

#carousel_backstage {
	height: 400px;
	width: 1300px;
}

#backstage_page {
	position: absolute;
	top: 150px;
	left: 250px;
	right: 50px;
	text-align: center;
}
</style>
</head>
<body class="goto-here">
			<jsp:include page="/WEB-INF/pages/header.jsp" />
	

	<!-------------------------內容區--------------------------------->

	<div id="project_backstage">
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#demo">會員管理</button>
			<div id="demo" class="collapse">
				<br>
				<form name="form1" action="memberUpdate.controller" method="post">
					<li align="left"><a href="javascript:document.form1.submit();"
						class="hyperlink">資料修改</a></li>
				</form>
				<form name="form2" action="memberEvaluation.controller" method="GET">
					<li align="left"><a href="javascript:document.form2.submit();"
						class="hyperlink">評價查詢</a></li>
				</form>
			</div>
		</div>
		<br> <br>
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#demo1">商城管理</button>
			<div id="demo1" class="collapse">
				<c:if test="${login_ok.member_permissions==1}">
				<li align="left"><a href="<c:url value='mall_management'  />" class="hyperlink">商品管理</a></li>
				<li align="left"><a href="<c:url value='mall_manageOrder'  />" class="hyperlink">訂單管理</a></li>
				<li align="left"><a href="<c:url value='mall_analysis'  />" class="hyperlink">商品資料分析</a></li>
				</c:if>
				<c:if test="${login_ok.member_permissions!=1}">
				<li align="left"><font color="gray">商品管理</font></li>
				<li align="left"><font color="gray">訂單管理</font></li>
				<li align="left"><font color="gray">商品資料分析</font></li>
				</c:if>
			</div>
		</div>
		<br> <br>
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#demo2">市場管理</button>
			<div id="demo2" class="collapse">
			<br>
				<li align="left"><a href="MarketMall.GoUpdate" class="hyperlink">商家資訊</a></li>
				<li align="left"><a href="MarketProduct.selectAll" class="hyperlink">商品管理</a></li>
			</div>
		</div>
		<br> <br>
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#demo3">食譜管理</button>
			<div id="demo3" class="collapse">
			<li align="left"><a href="<c:url value='uploadPage.controller'/>" class="hyperlink">上傳食譜</a></li>
			<li align="left"><a href="<c:url value='updatePage.controller'/>" class="hyperlink">我的食譜</a></li>
			<li align="left"><a href="<c:url value='myRecipe'/>" class="hyperlink">我的最愛</a></li>
			<li align="left"><a href="<c:url value='blog_personal'/>" class="hyperlink">文章管理</a></li>
				

			</div>
		</div>
		<br> <br>
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#demo4">活動管理</button>
			<div id="demo4" class="collapse">
				<c:if test="${login_ok.member_permissions==1}">
				<li align="left"><a href="<c:url value='/allActFarmer.do'/>" class="hyperlink">一日農夫</a></li>
				<li align="left"><a href="<c:url value='/actOrdSelect.do'/>">已報名活動</a></li>	
				
				</c:if>
				<c:if test="${login_ok.member_permissions!=1}">
				<li align="left"><a href="<c:url value='/actOrdSelect.do'/>">已報名活動</a></li>	
				</c:if>
			</div>
		</div>
	</div>
	<div align="center" id="backstage_page">
		<div id="carousel_backstage" class="container">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active_backstage">></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img height="400px" src="<c:url value='/images/farm.jpg'  />"
							class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img height="400px"
							src="<c:url value='/images/vegetables.jpg'  />"
							class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img height="400px" src="<c:url value='/images/recipe.jpg'  />"
							class="d-block w-100">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<br>
		<table>
			<tr>
				<td width="1000"><font size="6">標題</font></td>
				<td width="250"><font size="6">發布日期</font></td>
			</tr>
			<tr>
				<td><font size="4">測試</font></td>
				<td><font size="4">2020/11/11</font></td>
			</tr>
			<tr>
				<td><font size="4">測試1</font></td>
				<td><font size="4">1911/05/22</font></td>
			</tr>
			<tr>
				<td><font size="4">測試2</font></td>
				<td><font size="4">1950/08/09</font></td>
			</tr>
		</table>
	</div>
	<!-- ----------------------------------------- -->







	<!------------------------------------------------------------------>
	<footer class="ftco-footer backstage-footer-ground">
	<div class="container">
		<div class="row">
			<div class="mouse"></div>
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
					<script>
						document.write(new Date().getFullYear());
					</script>
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

	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px"> <circle
			class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4"
			stroke="#eeeeee" /> <circle class="path" cx="24" cy="24" r="22"
			fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
</body>
</html>