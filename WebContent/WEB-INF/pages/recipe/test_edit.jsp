<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分享食譜</title>
</head>
<body>
	<div align="center">
        <form:form action="./blogPostUpdate" method='post'
			modelAttribute="memBean" style="width: 70%">
			<div>
			<form:label path="title" style="font-size:20px;">標題 :  </form:label>
			<form:input path="title" /><span style="font-size: smaller;">最多十個字</span>
			</div>
			<div>
			<form:textarea path="content" id="editor"></form:textarea>
			</div>

			<button type="submit" class="btn btn-primary" id="btn">送出</button>

		</form:form>

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