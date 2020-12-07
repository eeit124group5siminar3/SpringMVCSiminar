
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
</head>
<body class="goto-here body-hegiht">

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script>
	$(function() {
		$("#form_submit")
				.on(
						"submit",
						function(ev) {
							$
									.ajax({
										url : "checkLogin.controller",
										data : {
											email : $("#exampleInputEmail1")
													.val(),
											password : $(
													"#exampleInputPassword1")
													.val(),
											remember : $("#exampleCheck1")
													.val()
										},
										type : "POST",
										contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
										success : function(data) {
											if (data) {
												self.location = document.referrer;
											} else {
												$("#check_email").html(
														"帳號或密碼錯誤，請重新輸入");
											}
										}
									})
							ev.preventDefault();
						})
	})
</script>
	
<script>
<!--FaceBook-->


window.fbAsyncInit = function() {
  FB.init({
    appId      : '857264848365975',
    cookie     : true,
    xfbml      : true,
    version    : 'v9.0'
  });
    
  FB.AppEvents.logPageView();   
    
};

(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = "https://connect.facebook.net/zh_TW/sdk.js";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));


function GetProfile() {
  //document.getElementById('content').innerHTML = "";//先清空顯示結果

  //FB.api()使用說明：https://developers.facebook.com/docs/javascript/reference/FB.api
  //取得用戶個資
  FB.api("/me", "GET", { fields: 'last_name,first_name,name,email' }, function (user) {
      //user物件的欄位：https://developers.facebook.com/docs/graph-api/reference/user
      if (user.error) {
          console.log(response);
      } else {      
          console.log(user);
          console.log(user.email);
          console.log(user.name);
          var fb_name = user.name;
          var fb_email = user.email; 
          var page2 = $("#url").val();
			$.ajax({
      		url: "facebookLoging",
      		method: "post",
      		data: { 
          			name: name,
          			email: fb_email
          		 },
      		success: function (msg) {
          		if(msg.registSuccess){//跳轉填寫資料
          			$(window).attr('location',"googleInfo");
                  }
          		if(msg.loginSuccess){//跳轉首頁
          			$(window).attr('location',page2);
                  }
          		if(msg.inputInfo){//跳轉填寫資料
          			$(window).attr('location',"googleInfo");
                  }
          		if(msg.emailExist){//帳號已存在
          			$("#result").text(msg.emailExist);
                  }
          		if(msg.error){//報錯
          			$("#result").text(msg.error);
                  }
                  
      		}
  		});//end $.ajax                    
      }
  });

}
function FBLogin(){
FB.getLoginStatus(function(res) {//
    console.log('status:'+res.status);//Debug

    if (res.status === "connected") { 
        let userID = res["authResponse"]["userID"];
        console.log("用戶已授權您的App，用戶須先revoke撤除App後才能再重新授權你的App");
        console.log(`已授權App登入FB 的 userID:${userID}`);
        GetProfile();
    		 
    } else if (res.status === 'not_authorized' || res.status === "unknown") {
        //App未授權或用戶登出FB網站才讓用戶執行登入動作
        FB.login(function (response) {
            //console.log(response); //debug用
            if (response.status === 'connected') {
                //user已登入FB
                //抓userID
                let userID = response.authResponse.userID;
                console.log('已授權App登入FB 的 userID:'+userID);
                GetProfile();
                

            } else {
                // user FB取消授權
                alert("Facebook帳號無法登入");
            }
            //"public_profile"可省略，仍然可以取得name、userID
        }, { scope: 'email' }); 
    }
  
});

}
	</script>

	<script>
$(function(){
	var buyer_account="123@222";
	var buyer_password="123456aA"
	var seller_account="test@yahoo.com.tw";
	var seller_password="123456aA";
	$("#buyer_button").click(function(){
		$("#exampleInputEmail1").val(buyer_account);
		$("#exampleInputPassword1").val(buyer_password);
});
	$("#seller_button").click(function(){
		$("#exampleInputEmail1").val(seller_account);
		$("#exampleInputPassword1").val(seller_password);
});
})
</script>

	<jsp:include page="/WEB-INF/pages/header.jsp" />


	<form id="form_submit" method="post">
		<div class="login-form">
			<fieldset class="border login-form-fieldset">
				<legend>會員登入</legend>
				<button type="button" id="buyer_button">買家</button>
				<button type="button" id="seller_button">賣家</button>
				<div id="check_email" class="center"
					style="color: red; text-align: center; height: 20px"></div>
				<div class="form-group">
					<label for="exampleInputEmail1">帳號</label> <input type="email"
						name="email" value="${requestScope.user}${param.email}"
						class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="請輸入電子信箱">
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
						for="exampleCheck1">記住我</label><hr>
						
						
    <div>
        Facebook登入：<input type="button"  value="Facebook登入" onclick="FBLogin();" />
    </div>						
				</div>
				<a class="btn btn-primary" href="goMemberSignUp.controller"
					style="float: counter">註冊</a> <a class="btn btn-primary"
					href="forgotResetPwd.controller" style="float: counter">忘記密碼</a>
				<button type="submit" name="login" id="login"
					class="btn btn-primary" style="float: right">提交</button>
			</fieldset>
		</div>
	</form>















	<footer class="ftco-footer footer-ground">
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
					<!-- 					<script> 
 						document.write(new Date().getFullYear());
 					</script> -->
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

	<!-- <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div> -->


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