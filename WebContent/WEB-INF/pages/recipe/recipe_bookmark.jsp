<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1 no-cache不能存快取
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html lang="zh">
<head>
<title>我的最愛</title>
<meta charset="utf-8">
<!-- -------------------DataTable引入的CDN---------------------------------------------------------------------- -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
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

#project_backstage {
	width: 150px;
	font-weight: bold;
	top: 150px;
	left: 15px;
	color: white;
	display: block;
}

#backstage_page {
	position: absolute;
	top: 150px;
	left: 250px;
	right: 50px;
	text-align: center;
}

.btn-primary{
	background-color: #b8cdd4;
	border-color:#b8cdd4;
	hover :#ccc6ad;
}
.btn:hover{
	background-color:#79a6ad;
	border-color:#79a6ad;
	
}

a{
	color:#3a728a;
}

</style>
</head>

<body class="goto-here">

<div id="deleteSuccess">
	<jsp:include page="../header.jsp" />
	

<!-------------------------內容區--------------------------------->
<section class="content-wrapper justify-content-center">
<div class="col-9" style="width:80%; margin:0 auto" >
	<div class="form-inline row justify-content-center align-items-center">
		<h2 >我的最愛</h2>&emsp;&emsp;&emsp;
	 </div>	
	<table id="myRecipe" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
				<th width="50">食譜名稱</th>
				<th width="50">介紹</th>
				<th width="50">上傳日期</th>
				<th width="50">作者</th>
				<th width="50">瀏覽量</th>
				<th width="100"></th>
			</tr>
        </thead>
        <tbody>
        <c:forEach var="bean" items="${allRecipe}">
			<tr>
<!-- 				<td> -->
<%--         	<c:forEach begin="1" end="${allRecipe.size()}" step="1" var="i"> --%>
<%-- 				${i} --%>
<%-- 			</c:forEach> --%>
<!-- 				</td> -->
				
				<td>${bean.name}</td>						
				<td>${bean.desc}</td>						
				<td>${bean.date}</td>
				<td>${bean.mem_name}</td>
				<td>${bean.views}</td>
				<td>
				<div class="form-inline justify-content-center">
						<a href="#" class="btn btn-primary py-2 px-3 " onclick="fun(${bean.rec_id})">移除</a> 
					&emsp;
						<a href="<c:url value='/recipeDetail.controller?rec_id=${bean.rec_id}'/>" class="btn btn-primary py-2 px-3 ">查詢</a> 
				</div>
				</td>
			</tr>
		</c:forEach>
        </tbody>
    </table>
</div>
</section>
<!-------------------------/.內容區--------------------------------->

		<jsp:include page="../footer.jsp" />

	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" /> 
 			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
 		</svg>
 	</div>
 	</div>
 

<!-- -------------------DataTable引入的js---------------------------------------------------------------------- -->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
	<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
	
<!-- -------------------DataTable的javascript---------------------------------------------------------------------- -->
	<script>
	$(document).ready(function() {
	    $('#myRecipe').DataTable();
	} );
	</script>
		<script type="text/javascript">
function fun(rec_id){
	var deleteSuccess=$("#deleteSuccess");
	console.log('rec_id: '+rec_id);
	var mymessage=confirm("確定要刪除？");
	if(mymessage==true)
	{
	$.ajax({
		type:"GET",
		url:"./removeMyRecipe",
		data:{
			"rec_id":rec_id
			},
		success:function(response){
			$("#deleteSuccess").html(response);
			console.log('response:'+response);
			
			}
		});
	}
}
</script>
</body>

</html>