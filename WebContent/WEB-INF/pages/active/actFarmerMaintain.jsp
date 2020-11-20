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
	<div class="py-1 bg-primary">
		<div class="container">
			<div
				class="row no-gutters d-flex align-items-start align-items-center px-md-0">
				<div class="col-lg-12 d-block">
					<div class="row d-flex">
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-phone2"></span>
							</div>
							<span class="text">0800-092-000</span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text">service@nonre.com</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="index.html">農郁</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> 列表
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a href="index.jsp"
					class="nav-link">首頁</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-tgogle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">商城</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="shop.html">商城</a> <a
							class="dropdown-item" href="cart.html">購物車</a> <a
							class="dropdown-item" href="checkout.html">查看訂單</a>
					</div></li>
				<!-- <li class="nav-item"><a href="product-single.html" class="nav-link">商城</a></li> -->
				<li class="nav-item"><a href="" class="nav-link">市場</a></li>
				<li class="nav-item"><a href="about.html" class="nav-link">活動</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-tgogle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">食譜</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item"
							href="<c:url value='uploadPage.controller'/>">上傳食譜</a> <a
							class="dropdown-item"
							href="<c:url value='updatePage.controller'/>">修改食譜</a> <a
							class="dropdown-item"
							href="<c:url value='searchPage.controller'/>">搜尋料理</a>
					</div></li>

				<li class="nav-item"><c:if test="${empty login_ok}">
						<a class="nav-link" href="<c:url value='login.controller' />">會員</a>
					</c:if> <c:if test="${!empty login_ok}">
						<a class="nav-link" href="<c:url value='backstage.controller' />">會員</a>
					</c:if></li>
				<li class="nav-item"><c:if test="${empty login_ok}">
						<a class="nav-link" href="<c:url value='login.controller' />">登錄</a>
					</c:if> <c:if test="${ ! empty login_ok }">
						<a class="nav-link" href="<c:url value='removeSession.controller' />"> 登出 </a>
					</c:if></li>
				<li class="nav-item cta cta-colored"><a href="cart.html"
					class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>
			</ul>
		</div>
	</div>
	</nav>
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
				<li align="left"><a href="" class="hyperlink">????</a></li>
				<li align="left"><a href="" class="hyperlink">????</a></li>
			</div>
		</div>
		<br> <br>
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#demo2">市場管理</button>
			<div id="demo2" class="collapse">
				<li align="left"><a href="actFarmerMaintain.jsp" class="hyperlink">????</a></li>
				<li align="left"><a href="" class="hyperlink">????</a></li>
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
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#demo4">活動管理</button>
			<div id="demo4" class="collapse">
				<li align="left"><a href="" class="hyperlink">一日農夫</a></li>
				<li align="left"><a href="" class="hyperlink">農農市集</a></li>
			</div>
		</div>
	</div>

	<div align="center" id="backstage_page">
<!-- --------一日農夫管理 內容區--------- -->

	<h1 align="center">活動管理-一日農夫</h1>
	<table align="center" style="border: 8px gray groove;" border="1" >
<!-- 		<h2>活動列表</h2> -->
			<tr>			
				<td style="border: 0px" align="right" colspan="10">
					<form action="<c:url value='/actFarmerPreInsert.do'/>" method="get">
						<input name="apply" type="submit" value="申請">
					</form>
				</td>
				<td style="border: 0px" align="right" colspan="2">	
					<form action="<c:url value='/allActFarmer.do'/>" method="get">
						<input name="selectAll" type="submit" value="查詢全部">
					</form>
				</td>			
			</tr>
			<tr>
				<th>活動編號</th>
				<th>活動名稱</th>
				<th>活動類型</th>				
				<th>活動日期/時間</th>
				<th>人數上限</th>
				<th>價格</th>
				<th>報名日期/時間</th>
				<th>報名人數</th>	
				<th>報名狀態</th>			
				<th colspan="3">Action</th>
			</tr>
			<c:forEach var="actFarmer" items="${collFarmer}">
					<tr>
						<td><c:out value="${actFarmer.actId}" /></td>
						<td><c:out value="${actFarmer.actName}" /></td>
						<td><c:out value="${actFarmer.actType}" /></td>						
						<td><c:out value="${actFarmer.actDateSta}" />&nbsp;
							<c:out value="${actFarmer.actTimeSta}" />
							到
							<c:out value="${actFarmer.actDateEnd}" />&nbsp;
							<c:out value="${actFarmer.actTimeEnd}" />							
						</td>
						<td><c:out value="${actFarmer.numLim}" /></td>
						<td><c:out value="${actFarmer.price}" /></td>
						<td><c:out value="${actFarmer.signDateSta}" />
							<c:out value="${actFarmer.signTimeSta}" />
							到
							<c:out value="${actFarmer.signDateEnd}" />
							<c:out value="${actFarmer.signTimeEnd}" />							
						</td>
						<td><c:out value="${actFarmer.actNum}" /></td>
						<td><c:out value="${actFarmer.sigStat}" /></td>						
						<td>
							<form action="<c:url value='/actFarmerPreRead.do'/>" method="get">
								<input type="hidden" id="actId" name="actId" value="${actFarmer.actId}">
								<input name="look" type="submit" value="檢視">
							</form>
						</td>
						<td>
							<form action="<c:url value='/actFarmerPreUpdate.do'/>" method="get">
								<input type="hidden" id="actId" name="actId" value="${actFarmer.actId}">
								<input name="update" type="submit" value="修改">
							</form> 
						</td>
						<td>
							<form action="<c:url value='/actFarmerDelete.do'/>" method="post">
								<input type="hidden" id="actId" name="actId" value="${actFarmer.actId}">
								<input name="delete" type="submit" value="刪除">								
							</form>	
						</td>
					</tr>
				</c:forEach>
				
<!-- 				ajax -->
					<tr id="test_id">
						<td></td>
						<td></td>
						<td></td>						
									
						<td>檢視</td>
						<td>修改</td>
						<td>刪除</td>
					</tr>
<!-- 				ajax -->
				
				<tr>
					<td style="border: 0px" colspan="6"></td>

					<td style="border: 0px" colspan="6">
						<form action="<c:url value='/'/>" method="get">
							<label for="">活動名稱:</label>
							<input type="text" id="selectname" name="selectname">
							&nbsp;
							<input name="selectone" type="submit" value="查詢單筆">
						</form>
					</td>
				
			</table>



<!-- -------------------------------- -->
	</div>
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
	
	<script type="text/javascript">
	$.post({
        url:"${pageContext.request.contextPath}/test",
        data:{'param1':"param value"},
        success:function (data) {
            console.log(data);
            //let data = JSON.parse(data);
            let content = "";
//             content = `
//                 <td>\${data.actId}</td>
// 				<td>\${data.actName}</td>
// 				<td>\${data.actType}</td>						
							
// 				<td>檢視</td>
// 				<td>修改</td>
// 				<td>刪除</td>`;
				content = "<td>"+data.timeId+"</td><td>"+data.timeName+"</td>";
			$("#test_id").html(content);
            
       }
   });
	</script>
</body>
</html>