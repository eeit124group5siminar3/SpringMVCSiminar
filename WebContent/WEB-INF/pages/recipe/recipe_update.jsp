<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>修改食譜</title>
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
.formSet {
	width: 600px;
	margin: auto;
}
</style>

</head>
<body class="goto-here">
<div id="deleteSuccess">
		<jsp:include page="../header.jsp" />


	<!-------------------------內容區--------------------------------->
<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light"> 
  <a class="navbar-brand">Recipe</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<c:url value='blogPage.controller'/>">User Blog<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value='uploadPage.controller'/>">Upload</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value='updatePage.controller'/>">Update</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value='myRecipe'/>">Bookmark</a>
      </li>

<!--       <li class="nav-item dropdown"> -->
<!--         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> -->
<!--           Dropdown -->
<!--         </a> -->
<!--         <div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!--           <a class="dropdown-item" href="#">Action</a> -->
<!--           <a class="dropdown-item" href="#">Another action</a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a class="dropdown-item" href="#">Something else here</a> -->
<!--         </div> -->
<!--       </li> -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> -->
<!--       </li> -->
<!--     </ul> -->
    
<%--     <form class="form-inline my-2 my-lg-0" action='<c:url value="/searchSubmit.controller"/>' method="post"> --%>
<!--       <input class="form-control mr-sm-2" type="search" placeholder="search delicious" aria-label="Search"> -->
<!--       <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="action">Search</button> -->
<%--     </form> --%>
<!--   </div> -->
<!--  </nav> --> 



	<form class="formSet"
		action="<c:url value='/submitChoose.controller'/>" method="post" runat="server" enctype="multipart/form-data">
	<fieldset>
		<legend style="color:black;font-size:23px">修改食譜</legend>		
		<c:forEach  var='BeanToken' items="${recipe_table}">
			<div class="form-group">
				<input type="hidden" id="delete_id" name="rec_id" value="${BeanToken.rec_id}" />
				<label for="formGroupExampleInput"  style="font-size:20px;">名稱: </label> 
				<input
					type="text" class="form-control" id="formGroupExampleInput"
					name="name" value="${BeanToken.name}"/>
			</div>
			
<br>
		<div class="form-group">
			<label style="font-size:20px;">種類:   ${BeanToken.cate}</label>
			<select class="form-control" name="cate">
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
					<label style="font-size:20px;">食材: </label> 
					<input type="text" class="form-control" name="ingredients_A" value="${BeanToken.ingredients_A}"/>
				</div>
				<div class="col">
					<label style="font-size:20px;">份量: </label>
					<input type="text" class="form-control" name="gram_A" value="${BeanToken.gram_A}"/>
				</div>
			</div>

			<br>
			<div class="form-row">
				<div class="col">
					<label></label> 
					<input type="text" class="form-control" name="ingredients_B" value="${BeanToken.ingredients_B}"/> 
				</div>
				<div class="col">
					<label></label>
					<input type="text" class="form-control" name="gram_B" value="${BeanToken.gram_B}"/>
				</div>
			</div>
<br>
			<div class="form-group">
				<label for="exampleFormControlTextarea1" style="font-size:20px;">介紹: </label>
				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="desc" >${BeanToken.desc}</textarea>
			</div>
			<div class="form-group">
				<label for="exampleFormControlTextarea1" style="font-size:20px;">料理方法: </label>
				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="method" >${BeanToken.method}</textarea>
			</div>
			
			<br>
			<div align="center">
				<img id="image" src="<c:url value='/getALLImage.controller?rec_id=${BeanToken.rec_id}'/>" width="60%">
			</div>
			<br>

			<div class="custom-file">
				<input type="file" class="custom-file-input"
					id="validatedCustomFile" name="multipartFile" 
					onchange="loadImageFile(event)"/>
				<label class="custom-file-label" for="validatedCustomFile">Choose file</label>
				<div class="invalid-feedback">請上傳圖片</div>
			</div>
			<hr>
			</c:forEach>
			<br>
			<div style="text-align: center;">

				<label> 
					<input class="btn btn-outline-success" type="submit" id="send" name="action" value="確認修改">
				</label> 
				<label> 
					<input class="btn btn-outline-danger" type="submit" id="delete" name="action" value="刪除">
				</label>
				<label> 
					<input class="btn btn-outline-secondary" type ="reset" onclick="javascript:location.href='<c:url value='/updatePage.controller'/>'" value="取消">
				</label>
			</div>

		</fieldset>
		</form>
<br>

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
// 							document.write(new Date().getFullYear());
<!-- 						</script> -->
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	
 	
 	<script type="text/javascript">
		$(function(){
			$("#delete").click(function(){
				alert('刪除成功');

				});
			});
		
		$(function(){
			$("#send").click(function(){
				alert('修改成功');

				});
			});
		
 	</script>
 		<script type="text/javascript">
		function loadImageFile(event) {
			var image = document.getElementById('image');
			image.src = URL.createObjectURL(event.target.files[0]);
		}
	</script>
	 						   
</body>
</html>