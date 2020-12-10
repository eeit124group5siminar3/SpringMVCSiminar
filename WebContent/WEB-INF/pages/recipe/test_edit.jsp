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
<link rel="stylesheet" href="css/ckeditor.css">
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div align="center">
        <form:form action="./blogPostUpdate" method='post'
 			modelAttribute="memBean" style="width: 70%"> 
			<div>
			<form:label path="title" style="font-size:20px;" value="${memBean.title}">標題 :   </form:label>
			<form:input path="title" /><span style="font-size: smaller;">最多15個字</span>
			</div>
			<div>
			<textarea id="editor" name="content">${memBean.content}</textarea>
			</div> 
	
			<button type="submit" class="btn btn-primary" id="btn">送出</button>

		</form:form>
</div>

<jsp:include page="../footer.jsp" />
	
<script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>


	<script type="text/javascript">  
var myEditor = null;
window.onload = function(){
     ClassicEditor
    .create(document.querySelector("#editor"))
    .then(editor => { 
        myEditor = editor; 
    }) 
    .catch(error => {
        console.error(error);
    });
}

 </script>
		 <script>
//    function processData(){
//    // getting data
//    var data = $("#editor").val();
//    alert(data);
//   }
 </script>
</body>
</html>