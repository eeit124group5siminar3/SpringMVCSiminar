<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>修改資料</title>
<style>
.formform {
	width: 1000px;
	margin: auto;
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
	margin-left: 95px;
}

.txt {
	width: 100%;
}
</style>
</head>
<body class="goto-here">
	<jsp:include page="../header.jsp" />
	<c:if test="${memDetail!=null}">
	<form:form action="./updateDetail" method='post' class="formform" 
				modelAttribute="memDetail" enctype="multipart/form-data">

		<div align="center" class="wrap">

			<div class="txt">
				<form:label for="exampleFormControlTextarea1" path="name"
					style="font-size:20px;" class="input-group-text">暱稱:</form:label>
				<form:input class="form-control" id="exampleFormControlTextarea1"
					path="name" value="${memDetail.name}"></form:input>
			</div>
			
			<div style="width: 50%" class="wrap1">
				<div>
				<label for="exampleFormControlTextarea1"
					style="font-size:20px;" class="input-group-text">大頭貼:</label>
					<img id="image"
						src="<c:url value='getImageDetail?mem_no=${memDetail.mem_no}'/>"
						width="400px">
				</div>
				<br>

				<div class="custom-file" style="width: 400px;">
					<form:input type="file" class="custom-file-input"
						id="validatedCustomFile" path="multipartFile"
						onchange="loadImageFile(event)" />

					<form:label class="custom-file-label" for="validatedCustomFile"
						path="multipartFile">Choose file</form:label>
					<div class="invalid-feedback">請上傳圖片</div>
				</div>
			</div>

		</div>

<br>
		<form:label for="MsgTextarea" path="introduction"
			style="font-size: 30px;" class="input-group-text">自我介紹 : <span
				style="font-size: 15px;"> 最多400字</span>
			<br>
		</form:label>
		<form:textarea class="form-control" id="MsgTextarea" rows="8"
			cols="40" path="introduction" value="${memDetail.introduction}" placeholder="請輸入.."></form:textarea>

		<br>
		<br>
		<div align="center">
			<button type="submit" class="btn btn-outline-success" id="btn" onclick="funUpdate()">送出</button>
		</div>
	</form:form>
	</c:if>
	
	
	
	<c:if test="${memDetail==null}">	
	
	<form:form action="./insertDetail" method='post' class="formform" 
			modelAttribute="bean" enctype="multipart/form-data">
			<h4 align="center">請先完成基本資料</h4>
		<div align="center" class="wrap">
			<div class="txt">
				<form:label for="exampleFormControlTextarea1" path="name"
					style="font-size:20px;" class="input-group-text">暱稱:</form:label>
				<form:input class="form-control" id="exampleFormControlTextarea1"
					path="name"></form:input>
			</div>
			
			<div style="width: 50%" class="wrap1">
				<div>
				<label for="exampleFormControlTextarea1"
					style="font-size:20px;" class="input-group-text">大頭貼:</label>
					<img id="image" src="" width="400px">
				</div>
				<br>

				<div class="custom-file" style="width: 400px;">
					<form:input type="file" class="custom-file-input"
						id="validatedCustomFile" path="multipartFile"
						onchange="loadImageFile(event)" />

					<form:label class="custom-file-label" for="validatedCustomFile"
						path="multipartFile">Choose file</form:label>
					<div class="invalid-feedback">請上傳圖片</div>
				</div>
			</div>

		</div>

<br>
		<form:label for="MsgTextarea" path="introduction"
			style="font-size: 30px;" class="input-group-text">自我介紹 : <span
				style="font-size: 15px;"> 最多400字</span>
			<br>
		</form:label>
		<form:textarea class="form-control" id="MsgTextarea" rows="8"
			cols="40" path="introduction" placeholder="請輸入.."></form:textarea>

		<br>
		<br>
		<div align="center">
			<button type="submit" class="btn btn-outline-success" id="btn" onclick="funSend()">送出</button>
		</div>
	</form:form>
	</c:if>
	
	
	<jsp:include page="../footer.jsp" />
<script>
function loadImageFile(event) {
	var image = document.getElementById('image');
	image.src = URL.createObjectURL(event.target.files[0]);
}
function funSend(){
	alert('新增成功');
	
}
function funUpdate(){
	alert('修改成功');
	
}

</script>
</body>
</html>