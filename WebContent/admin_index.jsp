<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>後臺登錄</title>

<!-- Bootstrap core CSS -->
<link
	href="https://bootstrap.hexschool.com/docs/4.2/dist/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<style>
.login-form {
	width: 400px;
	height: 600px;
	position: relative;
	top: 150px;
	left: 60%;
	/* right:50px; */
}

.login-form-fieldset {
	width: 500px;
	margin: 10px;
	padding: 50px;
	border: 1px double;
}
</style>
<!-- Custom styles for this template -->
</head>

<body class="text-center">
		<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<script>
$(function(){
	$("#login").click(function(){
	$("#check_account").html("");
	$.ajax({
		url:"adminCheckLogin.controller",
		data:{
			account:$("#exampleInputEmail1").val(),
			password:$("#exampleInputPassword1").val(),
		 	},
		type:"POST", 
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
	success:function(data){
		if(data){
			window.location.href = "adminBackstage.controller";
		}else{
			$("#check_account").html("帳號或密碼錯誤，請重新輸入");
		}
	}
    });  
});
})
</script>
	<script>
$(function(){
	var admin_account="admin";
	var admin_password="admin"
	$("#login_button").click(function(){
		$("#exampleInputEmail1").val(admin_account);
		$("#exampleInputPassword1").val(admin_password);
});

})
</script>

	<form id="index_form" method="post">
		<div class="login-form">
			<fieldset class="border login-form-fieldset">
				<legend>請登入</legend>
				<button type="button" id="login_button">Admin</button>
				<div id="check_account" class="center"
					style="color: red; text-align: center; height: 20px"></div>
				<div class="form-group">
					<label for="exampleInputEmail1">帳號</label> <input type="text"
						name="account" value="${requestScope.user}${param.account}"
						class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="請輸入帳號">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">密碼</label> <input
						type="password" name="password"
						value="${requestScope.password}${param.password}"
						class="form-control" id="exampleInputPassword1"
						placeholder="請輸入密碼">
				</div>
				<div class="form-group form-check">
					<input type="checkbox" name="remember" class="form-check-input"
						id="exampleCheck1"
						<c:if test='${requestScope.remember==true}'>checked='checked'</c:if>
						value="true"> <label class="form-check-label"
						for="exampleCheck1">記住我</label>
				</div>
				<button type="button" name="login" id="login"
					class="btn btn-primary" style="float: center">提交</button>
			</fieldset>
		</div>
	</form>

		
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
