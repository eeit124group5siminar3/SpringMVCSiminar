<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<li align="left"><a href="" class="hyperlink">????</a></li>
			<li align="left"><a href="" class="hyperlink">????</a></li>
		</div>
	</div>
	<br> <br>
	<div style="margin-left: 25px">
		<button type="button" class="btn btn-info" data-toggle="collapse"
			data-target="#demo3">食譜管理</button>
		<div id="demo3" class="collapse">
			<li align="left"><a href="<c:url value='uploadPage.controller'/>" class="hyperlink">食譜新增</a></li>
			<li align="left"><a href="<c:url value='updatePage.controller'/>" class="hyperlink">我的食譜</a></li>
			<li align="left"><a href="<c:url value='myRecipe'/>" class="hyperlink">我的最愛</a></li>
			<li align="left"><a href="<c:url value='blogEdit'/>" class="hyperlink">發表文章</a></li>
		</div>
	</div>
	<br> <br>
	<div style="margin-left: 25px">
		<button type="button" class="btn btn-info" data-toggle="collapse"
			data-target="#demo4">活動管理</button>
		<div id="demo4" class="collapse">
			<li align="left"><a href="" class="hyperlink">????</a></li>
			<li align="left"><a href="" class="hyperlink">????</a></li>
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