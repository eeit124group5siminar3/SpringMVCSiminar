<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分享食譜</title>
<link rel="stylesheet"
 href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="css/fontawesome-free/all.min.css">
<link rel="stylesheet"
 href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="css/dist/adminlte.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<c:if test="${!empty login_ok}">
<jsp:include page="/WEB-INF/pages/Message.jsp" />
</c:if>
<jsp:include page="/WEB-INF/pages/bar.jsp"/>
<section class="content-wrapper justify-content-center" style="background-color: #FFFFFF">

	<div align="center" class="form-group">
        <form:form action="./blogPostUpdate" method='post'
 			modelAttribute="memBean" style="width: 60%" enctype="multipart/form-data">
<%--  				<form:label for="MsgTextarea" path="introduction" --%>
<%--  				style="font-size: 30px;" class="input-group-text">自我介紹 : <span --%>
<!-- 					style="font-size: 15px;">最多400字</span> 	 -->
<!-- 					<br> -->
<%-- 			</form:label> --%>
<%-- 			<form:textarea class="form-control" id="MsgTextarea" rows="10" --%>
<%--  				cols="40" path="introduction" style="font-size: 20px;"></form:textarea>  --%>
			<div>
 			<form:label path="title" style="font-size: 30px;" class="input-group-text">文章標題 :  <span style="font-size: smaller;">最多15個字</span></form:label> 
			<form:input path="title" class="form-control"/>
			</div>
			<div>
				<form:label for="inputCate" path="cate" style="font-size: 30px;"
					class="input-group-text">種類: ${memBean.cate}</form:label>
				<c:set var="val" value="${memBean.cate}"></c:set>
				<select class="form-control" required name="cate">
					<option value='<c:out value="${val}"></c:out>'>照舊</option>
					<option value="米食">米食</option>
					<option value="麵食">麵食</option>
					<option value="素食/蔬食">素食/蔬食</option>
					<option value="炸物">炸物</option>
					<option value="焗烤">焗烤</option>	
					<option value="沙拉">沙拉</option>
					<option value="焗烤">焗烤</option>
					<option value="家常菜">家常菜</option>
					<option value="湯">湯</option>
				</select>
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
			<button type="submit" class="btn btn-primary" 
			onclick="javascript:location.href='<c:url value='blog_personal'/>'">取消</button>
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