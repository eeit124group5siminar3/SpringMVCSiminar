<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

</head>
<body class="goto-here">
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
  <script>
$(document).ready(function(){
	alert("請至電子信箱收取認證碼");
	$.ajax({
		url:"sendMail.controller",
	});
})
</script>
 <script>
$(function(){
$("#check_signup").on("submit",function(ev){
	$("#span_email").html("");
	$("#span_id").html("");
	$("#span_password").html("");
	$("#span_birthday").html("");
	$.ajax({
		url:"checkMemberSignUp.controller",
		data:{
			email_code:$("#email_code").val()
		 	},
		type:"POST", 
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		 
	success:function(data){
		if(data){
			window.location.href = "index.controller";
		}else{
			$("#check_code").html("認證碼輸入錯誤，請重新輸入");
		}
		

	}
    }) 
    ev.preventDefault(); 
})
})
</script>
	<jsp:useBean id="reg_buyer"
		class="tw.group5.member_SignUp.model.Member_SignUp" scope="session" />
	<jsp:include page="/WEB-INF/pages/header.jsp" />
	<c:if test="${!empty login_ok}">
	<jsp:include page="/WEB-INF/pages/Message.jsp" />
	</c:if>

	<!-------------------------內容區--------------------------------->

	<form id="check_signup" method="post">
		<div class="signup-form container">
			<fieldset class="border signup-form-fieldset">
				<legend>註冊資料確認</legend>
				<div id="check_code" class="center"
					style="color: red; text-align: center; height: 20px"></div>
					<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputEmail4">認證碼</label> <input type="text"
							class="form-control" id="email_code">
					</div>
				</div>
					
				<c:if test="${reg_buyer.member_permissions =='0'}">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline1"
							name="member_permissions" id="member_permissions"
							class="custom-control-input" value="0" checked="true" disabled>
						<label class="custom-control-label" for="customRadioInline1">買家</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline2"
							name="member_permissions" id="member_permissions1"
							class="custom-control-input" value="1" disabled> <label
							class="custom-control-label" for="customRadioInline2">買家與賣家</label>
					</div>
				</c:if>
				<c:if test="${reg_buyer.member_permissions == '1'}">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline1"
							name="member_permissions" id="member_permissions"
							class="custom-control-input" value="0" disabled> <label
							class="custom-control-label" for="customRadioInline1">買家</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline2"
							name="member_permissions" id="member_permissions1"
							class="custom-control-input" value="1" checked="true" disabled>
						<label class="custom-control-label" for="customRadioInline2">買家與賣家</label>
					</div>
				</c:if>
				<p></p>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputEmail4">帳號</label> <input type="text"
							class="form-control"
							placeholder="<jsp:getProperty name="reg_buyer" property="member_email" />"
							disabled>
					</div>
					<div class="form-group col-md-6">
						<label for="inputEmail4">身份證字號</label> <input type="text"
							class="form-control"
							placeholder="<jsp:getProperty name="reg_buyer" property="member_id" />"
							disabled>
					</div>
					<div class="form-group col-md-6">
						<label for="inputPassword4">密碼</label> <input type="text"
							class="form-control"
							placeholder="<jsp:getProperty name="reg_buyer"
						property="member_password" />"
							disabled>
					</div>
					<div class="form-group col-md-6"></div>
					<c:if test="${reg_buyer.member_permissions == '1'}">
						<div class="form-group col-md-6">
							<label for="inputPassword4">銀行代號</label> <input type="text"
								class="form-control"
								placeholder="<jsp:getProperty name="reg_buyer"
						property="member_bank_code" />"
								disabled>
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">銀行帳號</label> <input type="text"
								class="form-control"
								placeholder="<jsp:getProperty name="reg_buyer"
						property="member_bank_account" />"
								disabled>
						</div>
					</c:if>
					<div class="form-group col-md-6">
						<label for="inputPassword4">名稱</label> <input type="text"
							class="form-control"
							placeholder="<jsp:getProperty name="reg_buyer" property="member_name" />"
							disabled>
						<p></p>
						<label for="inputPassword4">生日</label> <input type="text"
							class="form-control"
							placeholder="<jsp:getProperty name="reg_buyer"
						property="member_birthday" />"
							disabled>
						<p></p>
						<label for="inputPassword4">連絡電話</label> <input type="text"
							class="form-control"
							placeholder="<jsp:getProperty name="reg_buyer"
						property="member_cellphone" />"
							disabled>
					</div>
				</div>
				<div class="form-group">
					<label for="inputAddress">地址</label> <input type="text"
						class="form-control"
						placeholder="<jsp:getProperty name="reg_buyer" property="member_address" />"
						disabled>
				</div>

				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputEmail4">統一編號</label> <input type="text"
							class="form-control"
							placeholder="<jsp:getProperty name="reg_buyer" property="member_gui_number" />"
							disabled>
					</div>
				</div>

				<c:if test="${reg_buyer.e_paper == '1'}">
					<div class="form-group">
						<div class="form-check">
							<input name="e_paper" class="form-check-input" type="checkbox"
								id="gridCheck" value="1" checked="true" disabled> <label
								class="form-check-label" for="gridCheck"> 訂閱電子報 </label>
						</div>
					</div>
				</c:if>
				<c:if test="${reg_buyer.e_paper == '0'}">
					<div class="form-group">
						<div class="form-check">
							<input name="e_paper" class="form-check-input" type="checkbox"
								id="gridCheck" value="0" disabled> <label
								class="form-check-label" for="gridCheck"> 訂閱電子報 </label>
						</div>
					</div>
				</c:if>
				<input type="submit" name="confirm" class="btn btn-primary"
					value="確認" /> <input type="button" onclick="history.back()"
					class="btn btn-primary" value="修改"></input>

			</fieldset>
		</div>
	</form>








	<!------------------------------------------------------------------>
	<footer class="ftco-footer signup-footer-ground">
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