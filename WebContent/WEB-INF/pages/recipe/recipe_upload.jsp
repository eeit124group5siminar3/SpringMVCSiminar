<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.formform {
	margin: auto;
	width: 600px;
}
</style>
</head>
<body class="goto-here">
	<jsp:include page="../header.jsp" />


	<!-------------------------內容區--------------------------------->

<!-- 	<nav class="navbar navbar-expand-lg navbar-light bg-light"> -->
<!-- 		<a class="navbar-brand">Recipe</a> -->
<!-- 		<button class="navbar-toggler" type="button" data-toggle="collapse" -->
<!-- 			data-target="#navbarSupportedContent" -->
<!-- 			aria-controls="navbarSupportedContent" aria-expanded="false" -->
<!-- 			aria-label="Toggle navigation"> -->
<!-- 			<span class="navbar-toggler-icon"></span> -->
<!-- 		</button> -->

<!-- 		<div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
<!-- 			<ul class="navbar-nav mr-auto"> -->
<!-- 				<li class="nav-item active"><a class="nav-link" -->
<%-- 					href="<c:url value='blogPage.controller'/>">User Blog<span --%>
<!-- 						class="sr-only">(current)</span></a></li> -->
<!-- 				<li class="nav-item"><a class="nav-link" -->
<%-- 					href="<c:url value='uploadPage.controller'/>">Upload</a></li> --%>
<!-- 				<li class="nav-item"><a class="nav-link" -->
<%-- 					href="<c:url value='updatePage.controller'/>">Update</a></li> --%>
<!-- 				<li class="nav-item"><a class="nav-link" -->
<%-- 					href="<c:url value='myRecipe'/>">Bookmark</a></li> --%>

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
<!-- 			</ul> -->

			<%--     <form class="form-inline my-2 my-lg-0" action='<c:url value="/searchSubmit.controller"/>' method="post"> --%>
			<!--       <input class="form-control mr-sm-2" type="search" placeholder="search delicious" aria-label="Search"> -->
			<!--       <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="action">Search</button> -->
			<%--     </form> --%>
<!-- 		</div> -->
<!-- 	</nav> -->


	<form:form class="formform" action="uploadSubmit.controller"
		method="post" modelAttribute="details" runat="server"
		enctype="multipart/form-data">
		<fieldset>
			<legend style="color: black; font-size: 23px">上傳食譜</legend>

			<div class="form-group">
				<form:label for="formGroupExampleInput" path="name"
					style="font-size:20px;">名稱: </form:label>
				<form:input type="text" class="form-control"
					id="formGroupExampleInput" placeholder="" path="name" />
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
					<form:input type="text" class="form-control" placeholder="食材"
						path="ingredients_A" />
				</div>
				<div class="col">
					<form:label path="gram_A" style="font-size:20px;">份量: </form:label>
					<form:input type="text" class="form-control" placeholder="重量  g"
						path="gram_A" />
				</div>
			</div>

			<br>
			<div class="form-row">
				<div class="col">
					<form:label path="ingredients_B"></form:label>
					<form:input type="text" class="form-control" placeholder="食材"
						path="ingredients_B" />
				</div>
				<div class="col">
					<form:label path="gram_B"></form:label>
					<form:input type="text" class="form-control" placeholder="重量  g"
						path="gram_B" />
				</div>
			</div>
			<br>
			<div class="form-group">
				<form:label for="exampleFormControlTextarea1" path="desc"
					style="font-size:20px;">介紹: </form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="6" path="desc"></form:textarea>
			</div>
			<div class="form-group">
				<form:label for="exampleFormControlTextarea1" path="method"
					style="font-size:20px;">料理方法: </form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="6" path="method"></form:textarea>
			</div>

			<br>
			<div align="center">
				<img id="image" src="" width="60%">
			</div>
			<br>
			<div class="custom-file">
				<form:input type="file" class="custom-file-input"
					id="validatedCustomFile" path="multipartFile"
					onchange="loadImageFile(event)" />
				<form:label class="custom-file-label" for="validatedCustomFile"
					path="multipartFile">Choose
					file</form:label>
				<div class="invalid-feedback">請上傳圖片</div>
			</div>

			<hr>
			<div style="text-align: center;">
				<input id="send" type="submit" name="action"
					class="btn btn-outline-success" value="送出" onclick="doUpload()" />
				</label>
				<!-- 				<label> <input type="submit" name="action" value="回首頁" /> -->

			</div>

		</fieldset>

	</form:form>
	<br>

	<!------------------------------------------------------------------>

	<jsp:include page="../footer.jsp" />



	<script type="text/javascript">
		function loadImageFile(event) {
			var image = document.getElementById('image');
			image.src = URL.createObjectURL(event.target.files[0]);
		};
	</script>

</body>
</html>