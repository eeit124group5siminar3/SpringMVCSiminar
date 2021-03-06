<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>上傳食譜</title>
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

.formform{
	margin:auto;
	
	width:600px;
}
</style>
</head>
<body class="goto-here">
	
<jsp:include page="../header.jsp" />

	<!-------------------------內容區--------------------------------->

<fieldset>
			<form:form class="formform" action="uploadSubmit.controller" method="post" modelAttribute="details" runat="server" enctype="multipart/form-data">		
		<legend style="color:black;font-size:23px">上傳食譜</legend>
				
				<div class="form-group">
				<form:label for="formGroupExampleInput" path="name" style="font-size:20px;">名稱: </form:label> 
				<form:input
					type="text" class="form-control" id="formGroupExampleInput"
					value="${name}" path="name"/>
			</div>
<br>
		<div class="form-group">
			<form:label path="cate" style="font-size:20px;">種類: </form:label>
			<select class="form-control" required name="cate">
				<option value="">Open this select menu</option>
				<option value="雞肉">雞肉</option>
				<option value="豬肉">豬肉</option>
				<option value="牛肉">牛肉</option>
				<option value="蔬食">蔬食</option>
			</select>
			<div class="invalid-feedback">請輸入資料</div>
		</div>


			<br>


			<div class="form-row">
				<div class="col">
					<form:label path="ingredients_A" style="font-size:20px;">食材: </form:label> 
					<form:input type="text" class="form-control" value="${ingredients_A}"
						path="ingredients_A" />
				</div>
				<div class="col">
					<form:label path="gram_A" style="font-size:20px;">份量: </form:label>
					<form:input type="text" class="form-control" value="${gram_A}"
						path="gram_A" /> 
				</div>
			</div>

			<br>
			<div class="form-row">
				<div class="col">
					<form:label path="ingredients_B"></form:label> 
					<form:input type="text" class="form-control" value="${ingredients_B}"
						path="ingredients_B" /> 
				</div>
				<div class="col">
					<form:label path="gram_B"></form:label>
					<form:input type="text" class="form-control" value="${gram_B}"
						path="gram_B" />
				</div>
			</div>
<br>
			<div class="form-group">
				<form:label for="exampleFormControlTextarea1" path="desc" style="font-size:20px;">介紹: </form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3" path="desc" value="${desc}"></form:textarea>
			</div>
			<div class="form-group">
				<form:label for="exampleFormControlTextarea1" path="method" style="font-size:20px;">料理方法: </form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3" path="method" value="${method}"></form:textarea>
			</div>

<br>
			<div class="custom-file">
				<form:input type="file" class="custom-file-input"
					id="validatedCustomFile" path="multipartFile"/>
				<form:label class="custom-file-label" for="validatedCustomFile" path="multipartFile">Choose
					file</form:label>
				<div class="invalid-feedback">請上傳圖片</div>
			</div>

			<hr>
			<div style="text-align: center;">
				<input id="send" type="submit" name="action" class="btn btn-outline-success"
					value="送出" onclick="doUpload()" />
				</label> 
<!-- 				<label> <input type="submit" name="action" value="回首頁" /> -->

			</div>			
		</form:form>
	</fieldset>









	<!------------------------------------------------------------------>
	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row">
				<div class="mouse">
<!-- 					<a href="#" class="mouse-icon"> -->
<!-- 						<div class="mouse-wheel"> -->
<!-- 							<span class="ion-ios-arrow-up"></span> -->
<!-- 						</div> -->
<!-- 					</a> -->
				</div>
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
<!-- 						<script> -->
<!--  							document.write(new Date().getFullYear()); -->
<!--  						</script>  -->
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