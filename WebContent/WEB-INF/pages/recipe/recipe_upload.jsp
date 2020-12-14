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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Kristi%7cPoppins:400,500,600,700%7cYeseva+One&display=swap">

<style>
.formform {
	width: 1000px;
	margin: auto;
	display: flex;
	align-items: center;
}

.wrap {
	width: 1000px;
	margin: auto;
	display: flex;
	align-items: center;
	margin-top: 30px;
}

.wrap1 {
	width: 50%;
	margin-left: 50px;
}

.txt {
	width: 50%;
	margin-left: 95px;
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
					style="font-size:20px;" class="input-group-text">名稱: </form:label>
				<form:input type="text" class="form-control"
					id="formGroupExampleInput" placeholder="" path="name" />
			</div>
			<br>
			<div class="form-group">
				<form:label path="cate" style="font-size:20px;" class="input-group-text">
				種類: </form:label>
				<select class="form-control" required name="cate">
					<option value="">Open this select menu</option>
					<option value="五榖根莖">五榖根莖</option>
					<option value="奶類">奶類</option>
					<option value="蛋豆魚肉類">蛋豆魚肉類</option>
					<option value="蔬菜類">蔬菜類</option>
					<option value="水果類">水果類</option>
					<option value="油脂類">油脂類</option>
				</select>
				<div class="invalid-feedback">請輸入資料</div>
			</div>


			<br>


			<div class="form-row">
				<div class="col">
					<form:label path="ingredients_A" style="font-size:20px;" class="input-group-text">食材: </form:label>
					<form:input type="text" class="form-control" placeholder="食材"
						path="ingredients_A" />
				</div>
				<div class="col">
					<form:label path="gram_A" style="font-size:20px;" class="input-group-text">份量: </form:label>
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


			<div class="form-row">
				<div class="col">
					<form:label path="ingredients_C" style="font-size:20px;"></form:label>
					<form:input type="text" class="form-control" placeholder="食材"
						path="ingredients_C" />
				</div>
				<div class="col">
					<form:label path="gram_C" style="font-size:20px;"></form:label>
					<form:input type="text" class="form-control" placeholder="重量  g"
						path="gram_C" />
				</div>
			</div>

			<br>
			<div class="form-row">
				<div class="col">
					<form:label path="ingredients_D"></form:label>
					<form:input type="text" class="form-control" placeholder="食材"
						path="ingredients_D" />
				</div>
				<div class="col">
					<form:label path="gram_D"></form:label>
					<form:input type="text" class="form-control" placeholder="重量  g"
						path="gram_D" />
				</div>
			</div>
			<br>
			<div class="form-group">
				<form:label for="exampleFormControlTextarea1" path="desc"
					style="font-size:20px;" class="input-group-text">介紹: </form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="8" path="desc"></form:textarea>
			</div>

			<br>
			<!---------------- 上傳圖片、步驟  o -------------------------------------------->
			<label class="input-group-text" style="font-size:20px;">步驟一</label>
			<div align="center" class="wrap">
				<div style="width: 50%" class="wrap1">
					<div>
						<img id="imageA" src="" width="400px">
					</div>
					<br>

					<div class="custom-file" style="width: 400px;">
						<form:input type="file" class="custom-file-input"
							id="validatedCustomFile" path="multipartFile_A"
							onchange="loadImageFileA(event)" />

						<form:label class="custom-file-label" for="validatedCustomFile"
							path="multipartFile_A">Choose file</form:label>
						<div class="invalid-feedback">請上傳圖片</div>
					</div>
				</div>

				<div class="txt" class="form-group">
					<form:label for="exampleFormControlTextarea1" path="method_A"
						style="font-size:20px;"></form:label>
					<form:textarea class="form-control"
						id="exampleFormControlTextarea1" rows="11" path="method_A"></form:textarea>
				</div>

			</div>
			<hr>
			<label class="input-group-text" style="font-size:20px;">步驟二</label>
			<div align="center" class="wrap">
				<div style="width: 50%" class="wrap1">
					<div>
						<img id="imageB" src="" width="400px">
					</div>
					<br>

					<div class="custom-file" style="width: 400px;">
						<form:input type="file" class="custom-file-input"
							id="validatedCustomFile" path="multipartFile_B"
							onchange="loadImageFileB(event)" />

						<form:label class="custom-file-label" for="validatedCustomFile"
							path="multipartFile_B">Choose file</form:label>
						<div class="invalid-feedback">請上傳圖片</div>
					</div>
				</div>

				<div class="txt" class="form-group">
					<form:label for="exampleFormControlTextarea1" path="method_B"
						style="font-size:20px;"></form:label>
					<form:textarea class="form-control"
						id="exampleFormControlTextarea1" rows="11" path="method_B"></form:textarea>
				</div>

			</div>
			<hr>
			<label class="input-group-text" style="font-size:20px;">步驟三</label>
			<div align="center" class="wrap">
				<div style="width: 50%" class="wrap1">
					<div>
						<img id="imageC" src="" width="400px">
					</div>
					<br>

					<div class="custom-file" style="width: 400px;">
						<form:input type="file" class="custom-file-input"
							id="validatedCustomFile" path="multipartFile_C"
							onchange="loadImageFileC(event)" />

						<form:label class="custom-file-label" for="validatedCustomFile"
							path="multipartFile_C">Choose file</form:label>
						<div class="invalid-feedback">請上傳圖片</div>
					</div>
				</div>

				<div class="txt" class="form-group">
					<form:label for="exampleFormControlTextarea1" path="method_C"
						style="font-size:20px;"></form:label>
					<form:textarea class="form-control"
						id="exampleFormControlTextarea1" rows="11" path="method_C"></form:textarea>
				</div>

			</div>
			<hr>
			<label class="input-group-text" style="font-size:20px;">步驟四</label>
			<div align="center" class="wrap">
				<div style="width: 50%" class="wrap1">
					<div>
						<img id="imageD" src="" width="400px">
					</div>
					<br>

					<div class="custom-file" style="width: 400px;">
						<form:input type="file" class="custom-file-input"
							id="validatedCustomFile" path="multipartFile_D"
							onchange="loadImageFileD(event)" />

						<form:label class="custom-file-label" for="validatedCustomFile"
							path="multipartFile_D">Choose file</form:label>
						<div class="invalid-feedback">請上傳圖片</div>
					</div>
				</div>

				<div class="txt" class="form-group">
					<form:label for="exampleFormControlTextarea1" path="method_D"
						style="font-size:20px;"></form:label>
					<form:textarea class="form-control"
						id="exampleFormControlTextarea1" rows="11" path="method_D"></form:textarea>
				</div>

			</div>
			<hr>
			<label 	>步驟五</label>
			<div align="center" class="wrap">
				<div style="width: 50%" class="wrap1">
					<div>
						<img id="imageE" src="" width="400px">
					</div>
					<br>

					<div class="custom-file" style="width: 400px;">
						<form:input type="file" class="custom-file-input"
							id="validatedCustomFile" path="multipartFile_E"
							onchange="loadImageFileE(event)" />

						<form:label class="custom-file-label" for="validatedCustomFile"
							path="multipartFile_E">Choose file</form:label>
						<div class="invalid-feedback">請上傳圖片</div>
					</div>
				</div>

				<div class="txt" class="form-group">
					<form:label for="exampleFormControlTextarea1" path="method_E"
						style="font-size:20px;"></form:label>
					<form:textarea class="form-control"
						id="exampleFormControlTextarea1" rows="11" path="method_E"></form:textarea>
				</div>

			</div>

			<hr>
			<div style="text-align: center;">
				<input id="send" type="submit" class="btn btn-outline-success"
					value="送出" onclick="funUpload()" /> <label> <input
					type="submit" class="btn btn-outline-success"
					onclick="javascript:location.href='<c:url value='frontPage.controller'/>'"
					value="回首頁" /></label>

			</div>

		</fieldset>

	</form:form>
	<br>
	<!------------------------------------------------------------------>
	<jsp:include page="../footer.jsp" />



	<script type="text/javascript">
		function loadImageFileA(event) {
			var image = document.getElementById('imageA');
			image.src = URL.createObjectURL(event.target.files[0]);
		}
		function loadImageFileB(event) {
			var image = document.getElementById('imageB');
			image.src = URL.createObjectURL(event.target.files[0]);
		};
		function loadImageFileC(event) {
			var image = document.getElementById('imageC');
			image.src = URL.createObjectURL(event.target.files[0]);
		};
		function loadImageFileD(event) {
			var image = document.getElementById('imageD');
			image.src = URL.createObjectURL(event.target.files[0]);
		};
		function loadImageFileE(event) {
			var image = document.getElementById('imageE');
			image.src = URL.createObjectURL(event.target.files[0]);
		};
	</script>
	<script type="text/javascript">
		function funUpload() {
			alert('上傳成功');
		}
	</script>
</body>
</html>