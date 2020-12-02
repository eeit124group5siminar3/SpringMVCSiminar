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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
	left: 15px;
	color: white;
	display: block;
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

	<div id="project_backstage">
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">會員管理</button>
			<div id="demo" class="collapse">
				<br>
				<form name="form1" action="memberUpdate.controller" method="post">
					<li align="left"><a href="javascript:document.form1.submit();" class="hyperlink">資料修改</a></li>
				</form>
				<form name="form2" action="memberEvaluation.controller" method="GET">
					<li align="left"><a href="javascript:document.form2.submit();" class="hyperlink">評價查詢</a></li>
				</form>
			</div>
		</div>
		<br><br>
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo1">商城管理</button>
			<div id="demo1" class="collapse">
				<li align="left"><a href="<c:url value='mall_management' />" class="hyperlink">商品管理</a></li>
				<li align="left"><a href="<c:url value='mall_manageOrder' />" class="hyperlink">訂單管理</a></li>
			</div>
		</div>
		<br> <br>
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo2">市場管理</button>
			<div id="demo2" class="collapse">
				<li align="left"><a href="MarketMall.GoUpdate" class="hyperlink">商家資訊</a></li>
				<li align="left"><a href="MarketProduct.selectAll" class="hyperlink">商品管理</a></li>
			</div>
		</div>
		<br> <br>
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#demo3">食譜管理</button>
			<div id="demo3" class="collapse">
				<li align="left"><a href="" class="hyperlink">食譜新增</a></li>
				<li align="left"><a href="" class="hyperlink">食譜修改</a></li>
			</div>
		</div>
		<br> <br>
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo4">活動管理</button>
			<div id="demo4" class="collapse">
				<li align="left"><a href="<c:url value='/maintainActFarmer.do?MaintainPageNo=1'/>" class="hyperlink">一日農夫</a></li>				
<!-- 				<li align="left"><a href="" class="hyperlink">農農市集</a></li> -->
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>


</body>
</html>