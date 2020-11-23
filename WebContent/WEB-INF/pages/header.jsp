<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							<span class="text">+ 1235 2355 98</span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text">youremail@email.com</span>
						</div>
						<div
							class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
							<span class="text">3-5 Business days delivery &amp; Free
								Returns</span>
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
				<li class="nav-item active"><a href="index.html"
					class="nav-link">首頁</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-tgogle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">商城</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="<c:url value='/mall_shop' />">商城</a> 
						<a class="dropdown-item" href="<c:url value='/mall_shoppingcart' />">購物車</a> 
						<a class="dropdown-item" href="checkout.html">查看訂單</a>
					</div></li>
				<!-- <li class="nav-item"><a href="product-single.html" class="nav-link">商城</a></li> -->
				
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-tgogle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">市場</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item"
								href="<c:url value='        '/>">市場</a> <a
								class="dropdown-item"
								href="<c:url value='/MarketProduct.selectAll'/>">商品管理</a> <a
								class="dropdown-item"
								href="<c:url value='/MarketMall.GoUpdate'/>">店家資料介面</a>
								<a
								class="dropdown-item"
								href="<c:url value='/MarketMall.goInsertJsp'/>">店家申請</a>
						</div></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-tgogle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">活動</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="<c:url value=''/>">一日農夫</a>
						<a class="dropdown-item" href="<c:url value='/allActFarmer.do'/>">一日農夫管理頁面</a>
						<a class="dropdown-item" href="<c:url value='        '/>">農農市集</a>
						<a class="dropdown-item" href="<c:url value='        '/>">農農市集管理頁面</a>
					</div>
				</li>

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
					</c:if></li>
				<li class="nav-item cta cta-colored"><a href="cart.html"
					class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>
			</ul>
		</div>
	</div>
</nav>
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