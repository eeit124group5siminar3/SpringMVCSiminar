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
<script>
	window.onload = function() {
		var customRadioInline1 = document.getElementById("customRadioInline1");
		var customRadioInline2 = document.getElementById("customRadioInline2");
		var ckeckbank = document.getElementById("ckeckbank");
		var ckeckbank1 = document.getElementById("ckeckbank1");

		customRadioInline1.onclick = function() {
			$("#ckeckbank").empty();
			ckeckbank.classList.remove("form-group");
			ckeckbank.classList.remove("col-md-6");
			$("#ckeckbank1").empty();
			ckeckbank1.classList.remove("form-group");
			ckeckbank1.classList.remove("col-md-6");
			
		}

		customRadioInline2.onclick = function() {
			ckeckbank.classList.add("form-group");
			ckeckbank.classList.add("col-md-6");
			ckeckbank.innerHTML = 

			'<label for="inputPassword4">'+'銀行代號'+
			'<a style="color:red">'+'*'+
			'</a>'+
			'</label>'+
			'<span style="color:red">'+
			'<small id="span_bank_code">'+
			'</small>'+
			'</span>'+
			'<input type="text" name="member_bank_code" id="member_bank_code" class="form-control" placeholder="請填入銀行代號" required>';

			ckeckbank1.classList.add("form-group");
			ckeckbank1.classList.add("col-md-6");
			ckeckbank1.innerHTML =

			'<label for="inputPassword4">'+'銀行帳號'+'</label>'+
			'<a style="color:red">'+
			'*'+
			'</a>'+
			'<span style="color:red">'+
			'<small id="span_bank_account">'+
			'</small>'+
			'</span>'+
			'<input type="text" name="member_bank_account" id="member_bank_account" class="form-control" placeholder="銀行帳號不含dash (-)" required>';

		}
		
	}
</script>

<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
 <script>
$(function(){
$("#signup_form").on("submit",function(ev){
	$("#span_email").html("");
	$("#span_id").html("");
	$("#span_password").html("");
	$("#span_birthday").html("");
	$.ajax({
		url:"memberSignUp.controller",
		data:{
			member_permissions:$("#customRadioInline1").prop('checked'),
			member_email:$("#member_email").val(),
			member_password:$("#member_password").val(),
			member_password1:$("#member_password1").val(),
			member_name:$("#member_name").val(),
			member_birthday:$("#member_birthday").val(),
			member_cellphone:$("#member_cellphone").val(),
			member_id:$("#member_id").val(),
			member_address:$("#member_address").val(),
			member_gui_number:$("#member_gui_number").val(),
			e_paper:$("#gridCheck").prop('checked'),
			member_bank_code:$("#member_bank_code").val(),
			member_bank_account:$("#member_bank_account").val()
		 	},
		type:"POST", 
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		 
	success:function(data){
		if(data[5] == "1"){
			window.location.href = "goCheckMemberSignUp.controller";
		}if(data[0] == "2"){
			$("#span_email").html("Email已被註冊，請重新輸入");
		}if(data[1] == "3"){
			$("#span_id").html("身份證字號已被註冊，請重新輸入");
		}if(data[2] == "12"){
			$("#span_id").html("格式錯誤，請重新輸入");
		}if(data[4] == "4"){
			$("#span_password").html("兩次密碼不符合，請重新輸入");
		}if(data[6] == "5"){
			$("#span_password").html("格式錯誤，請重新輸入");
		}if(data[3] == "6"){
			$("#span_birthday").html("格式錯誤，請重新輸入");
		}
		

	}
    }) 
    ev.preventDefault(); 
})
})
</script>
	<script>
$(function(){
	var member_email="待輸入";
	var member_id="待輸入";
	var member_password="待輸入";
	var member_password1="待輸入";
	var member_bank_code="待輸入";
	var member_bank_account="待輸入";
	var member_name="待輸入";
	var member_cellphone="待輸入";
	var member_address="待輸入";

	$("#buyersignup_button").click(function(){
		$("#member_email").val(member_email);
		$("#member_id").val(member_id);
		$("#member_password").val(member_password);
		$("#member_password1").val(member_password1);
		$("#member_name").val(member_name);
		$("#member_cellphone").val(member_cellphone);
		$("#member_address").val(member_address);
});
	$("#sellersignup_button").click(function(){
		$("#member_email").val(member_email);
		$("#member_id").val(member_id);
		$("#member_password").val(member_password);
		$("#member_password1").val(member_password1);
		$("#member_bank_code").val(member_bank_code);
		$("#member_bank_account").val(member_bank_account);
		$("#member_name").val(member_name);
		$("#member_cellphone").val(member_cellphone);
		$("#member_address").val(member_address);});
})
</script>
	<jsp:include page="/WEB-INF/pages/header.jsp" />


	<!-------------------------內容區--------------------------------->

	<form method="post" id="signup_form">
		<div class="signup-form container">
			<fieldset class="border signup-form-fieldset">
				<legend>會員註冊</legend>
				<button type="button" id="buyersignup_button">買家</button>
				<button type="button" id="sellersignup_button">買家</button>
				<hr>
				<div id="member_permissions0"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" id="customRadioInline1"
						name="member_permissions" class="custom-control-input" value="0"
						checked="true"> <label class="custom-control-label"
						for="customRadioInline1">買家</label>
				</div>
				<div id="member_permissions1"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" id="customRadioInline2"
						name="member_permissions" class="custom-control-input" value="1">
					<label class="custom-control-label" for="customRadioInline2">賣家</label>
				</div>
				<p></p>
				<div class="form-row">
					<div class="form-group col-md-6" style="text-align:center">
						<label style="float:left" for="inputEmail4">帳號<a style="color:red">*</a></label><span style="color:red"><small id="span_email"></small></span> <input type="email"
							name="member_email" id="member_email" class="form-control" placeholder="請填入Email"
							required>
					</div>
					
					<div class="form-group col-md-6" style="text-align:center">
						<label for="inputEmail4" style="float:left">身份證字號<a style="color:red">*</a></label> <span style="color:red"><small id="span_id"></small></span><input type="text"
							name="member_id" id="member_id" class="form-control" placeholder="請填入身份證字號"
							pattern="^[A-Za-z]\d{9}$" title="身分證格式錯誤" required>
					</div>
					
					<div class="form-group col-md-6" style="text-align:center">
						<label for="inputPassword4" style="float:left">密碼<a style="color:red">*</a></label> <span style="color:red"><small id="span_password"></small></span><input type="password"
							name="member_password" id="member_password" class="form-control" placeholder="請填入密碼"
							pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
							title="密碼長度至少8碼，須包含大寫、小寫英文及數字" required>
					</div>
					
					<div class="form-group col-md-6" style="text-align:center">
						<label for="inputPassword4" style="float:left">密碼<a style="color:red">*</a></label> <input type="password"
							name="member_password1" id="member_password1" class="form-control"
							placeholder="請再次填入密碼"
							pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
							title="密碼長度至少8碼，須包含大寫、小寫英文及數字" required>
					</div>
					
					<div id="ckeckbank"></div>
					<div id="ckeckbank1"></div>
					
					<div class="form-group col-md-6" style="text-align:center">
						<label for="inputPassword4" style="float:left">名稱<a style="color:red">*</a></label> <span style="color:red"><small id="span_name"></small></span> <input type="text"
							name="member_name" id="member_name" class="form-control" placeholder="請填入姓名或商家名稱" required>
						<p></p>
						
						<label for="inputPassword4" style="float:left">生日<a style="color:red">*</a></label> <span style="color:red"><small id="span_birthday"></small></span> <input type="date"
							name="member_birthday" id="member_birthday" class="form-control"
							onkeydown="return false" pattern="\d{4}\-?\d{2}\-?\d{2}" required>
						<p></p>
		
						<label for="inputPassword4" style="float:left">連絡電話<a style="color:red">*</a></label> <span style="color:red"><small id="span_cellphone"></small></span> <input type="text"
							name="member_cellphone" id="member_cellphone" class="form-control" required>
						

					</div>
				</div>
				<div class="form-group" style="text-align:center">
					<label for="inputAddress" style="float:left">地址<a style="color:red">*</a></label><input type="text"
						name="member_address" id="member_address" class="form-control" placeholder="請填入聯絡地址"
						pattern="^[\u4e00-\u9fa5\d]{0,}$" title="格式錯誤，不能填入英文" required>
				</div>

				<div class="form-row">
					<div class="form-group col-md-6" style="text-align:center">
						<label for="inputEmail4" style="float:left">統一編號</label><input type="text"
							name="member_gui_number" id="member_gui_number" class="form-control" placeholder="選填"
							pattern="\d{8}" title="需輸入8位數字">
					</div>
				</div>

				<div class="form-group">
					<div class="form-check">
						<input name="e_paper" class="form-check-input" type="checkbox"
							id="gridCheck" value="1" checked="true"> <label
							class="form-check-label" for="gridCheck"> 訂閱電子報 </label>
					</div>
				</div>
				<button type="submit" id="signup" class="btn btn-primary">提交</button>
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