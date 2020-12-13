<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="<c:url value='adminBackstage.controller' />">農郁</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> 列表
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="<c:url value='adminBackstage.controller' />" class="nav-link">回首頁</a></li>
	          <li class="nav-item dropdown">
              <a class="nav-link dropdown-tgogle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">平台管理</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="<c:url value='goManageMembers.controller'/>">會員管理</a>
              	<a class="dropdown-item" href="#">商城管理</a>
                <a class="dropdown-item" href="<c:url value='getAllActFarmer.do'/>">活動管理</a>
                <a class="dropdown-item" href="#">食譜管理</a>
                <a class="dropdown-item" href="#">市集管理</a>
              </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-tgogle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">商城管理</a>
        <div class="dropdown-menu" aria-labelledby="dropdown04">
          <a class="dropdown-item" href="#">??????</a>
        </div>
</li>
<li class="nav-item dropdown">
  <a class="nav-link dropdown-tgogle" href="<c:url value='getAllActFarmer.do'/>" id="dropdown04" aria-haspopup="true" aria-expanded="false">活動管理</a>
  <div class="dropdown-menu" aria-labelledby="dropdown04">
    <a class="dropdown-item" href="<c:url value='getAllActFarmer.do'/>">活動總覽</a>
    <a class="dropdown-item" href="<c:url value='actAdminSign.do'/>">報名管理</a>

  </div>
</li>
<li class="nav-item dropdown">
  <a class="nav-link dropdown-tgogle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">食譜管理</a>
  <div class="dropdown-menu" aria-labelledby="dropdown04">
    <a class="dropdown-item" href="#">??????</a>
  </div>
</li>
<li class="nav-item dropdown">
  <a class="nav-link dropdown-tgogle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">市集管理</a>
  <div class="dropdown-menu" aria-labelledby="dropdown04">
    <a class="dropdown-item" href="#">??????</a>
    <a class="dropdown-item" href="#">??????</a>
  </div>
</li>
			<!-- <li class="nav-item"><a href="product-single.html" class="nav-link">商城</a></li> -->

			  <li class="nav-item"><a href="<c:url value='adminRemoveSession.controller' />" class="nav-link">登出</a></li>
	        </ul>
	      </div>
	    </div>
    </nav>
    <hr>
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