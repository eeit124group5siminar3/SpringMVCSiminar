<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分享食譜</title>

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
<body>
	<jsp:include page="../header.jsp" />

	<div align="center" class="form-group">
        <form:form action="./blogPostUpdate" method='post'
 			modelAttribute="memBean" style="width: 60%" enctype="multipart/form-data">
 				<form:label for="MsgTextarea" path="introduction"
 				style="font-size: 30px;" class="input-group-text">自我介紹 : <span
					style="font-size: 15px;">最多400字</span> 	
					<br>
			</form:label>
			<form:textarea class="form-control" id="MsgTextarea" rows="10"
 				cols="40" path="introduction" style="font-size: 20px;"></form:textarea> 
			<div>
 			<form:label path="title" style="font-size: 30px;" class="input-group-text">文章標題 :  <span style="font-size: smaller;">最多15個字</span></form:label> 
			<form:input path="title" class="form-control"/>
			</div>
			
			<div>
				<label style="font-size: 30px;" class="input-group-text">封面圖片 :  </label>
			</div>
			<br>
			<img id="image" src="<c:url value='/getBlogImage?blog_id=${memBean.blog_id}'/>"
				style="max-height: 100%; max-width: 100%; width: auto; height: auto;zoom=1">
			<div class="custom-file">
				<form:input type="file" class="custom-file-input"
					id="validatedCustomFile" path="multipartFile"
					onchange="loadImageFile(event)" />
				<form:label class="custom-file-label" for="validatedCustomFile"
					path="multipartFile">Choose
					file</form:label>
				<div class="invalid-feedback">請上傳圖片</div>
			</div>
			<br>
			
			
			
			<div>
			<form:label for="editor" path="content" style="font-size: 30px;" class="input-group-text">文章介紹 : </form:label>
			<form:textarea id="editor" path="content" ></form:textarea>
			</div> 
			<br>
			<div align="center"> 
			<button type="submit" class="btn btn-primary" id="btn">送出</button>
			</div>

		</form:form>
</div>

<jsp:include page="../footer.jsp" />
	
	<script src="js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		function loadImageFile(event) {
			var image = document.getElementById('image');
			image.src = URL.createObjectURL(event.target.files[0]);
		};
	</script>

	<script type="text/javascript">  
	window.onload = function()
	{
	    CKEDITOR.replace( 'editor');
	    extraAllowedContent: "img[src,alt,width,height]";
	        
	        
	};

 </script>
		 <script>
//     function processData(){
//    // getting data
//    var data = $("#editor").val();
//    alert(data);
//   }
 </script>
</body>
</html>