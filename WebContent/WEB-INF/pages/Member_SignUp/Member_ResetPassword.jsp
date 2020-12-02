<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
.forgotResetPwd-form {
	width: 600px;
	height: 600px;
	top: 150px;
	margin: 0px auto;
}

.forgotResetPwd-form-fieldset {
	width: 600px;
	margin: 10px;
	padding: 50px;
	border: 1px double;
}

.forgotResetPwd-footer-ground {
	width: 100%;
	top: 700px;
	position: absolute;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script>
$(function(){
	$("#form_submit").on("submit",function(ev){
	$("#check_password").html("");
	$.ajax({
		url:"resetPwd.controller",
		data:{
			member_password:$("#member_password1").val(),
			member_password1:$("#member_password2").val()
		 	},
		type:"POST", 
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
	success:function(data){
		if(data){
			window.location.href = "index.controller";
		}else{
			$("#check_password").html("二次密碼不符合，請重新輸入");
		}
	}
    })  
    ev.preventDefault();
})
})
</script>
<body class="goto-here">
	<jsp:useBean id="reg_buyer"
		class="tw.group5.member_SignUp.model.Member_SignUp" scope="session" />
		<jsp:include page="/WEB-INF/pages/header.jsp" />
	
	<!-------------------------內容區--------------------------------->

	<form method="post" id="form_submit">
		<div class="forgotResetPwd-form container">
			<fieldset class="border forgotResetPwd-form-fieldset">
				<legend>設定新密碼</legend>
				<div id="check_password" class="center"
					style="color: red; text-align: center;height:20px"></div>
				<div class="form-group">
					<input type="text" class="form-control"
						placeholder="<jsp:getProperty name="reg_buyer"
						property="member_email" />"
						style="display: none">
					<p></p>
					<label for="inputPassword4">密碼</label> <input type="text"
						class="form-control"
						placeholder="<jsp:getProperty name="reg_buyer"
						property="member_password" />"
						disabled>
					<p></p>
					<label for="inputPassword4">設定新密碼<a style="color:red">*</a></label> <input type="password"
						name="member_password" id="member_password1" class="form-control"
						pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
						title="密碼長度至少8碼，須包含大寫、小寫英文及數字" placeholder="請填入新的密碼" required>
					<p></p>
					<label for="inputPassword4">設定新密碼<a style="color:red">*</a></label> <input type="password"
						name="member_password1" id="member_password2" class="form-control"
						pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
						title="密碼長度至少8碼，須包含大寫、小寫英文及數字" placeholder="請再填入一次新的密碼" required>
				</div>
				<button type="submit" id="submit" class="btn btn-primary">提交</button>
			</fieldset>
		</div>
	</form>
	<!------------------------------------------------------------------>
	<footer class="ftco-footer forgotResetPwd-footer-ground">
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
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
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