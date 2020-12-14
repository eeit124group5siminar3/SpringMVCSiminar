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
<title>農郁-報名管理</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!--------------------------------- 原本的Bootstrap--------------------------------------- -->
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

<!--------------------------------- 管理員  -------------------------------- -->
<link
	href="https://bootstrap.hexschool.com/docs/4.2/dist/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<!-- -------------------DataTable引入的CDN---------------------------------------------------------------------- -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">

<style>


#project_backstage {
	width: 150px;
	position: absolute;
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
<script type="text/javascript">
	function backHome() {
		document.act.action = "maintainActFarmer.do";
		document.act.submit();
		//window.location.herf="${pageContext.request.contextPath}/allActFarmer.do";
	}
</script>
</head>

<body class="goto-here">

<!-- --------Header------------------------------------- -->
	<jsp:include page="/WEB-INF/pages/header.jsp" />

<div class="form-group">
<!-- --------管理左邊bar-------------------------------- -->
<section class="content-wrapper d-flex justify-content-center">
<div class="nav">
	<jsp:include page="/WEB-INF/pages/testLeft.jsp" />	
</div>
<!-------------------------內容區--------------------------------->
<div class="col-9" style="width:80%; margin:0 auto" >
<h3 align="center">報名管理-一日農夫</h3>
	
	<table id="actOrd" class="table table-striped table-bordered" style="width:100%" >
        <thead>
            <tr>
                <th>訂單編號</th>
				<th>會員名稱</th>
				<th>會員連絡電話</th>
				<th>會員信箱</th>
				<th>報名人數</th>
				<th>總金額</th>
				<th>訂單狀態</th>
				<th>下單時間</th>
				<th width="150">Action</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="actOrd" items="${collOrd}">
			<tr>
				<td>${actOrd.actOrdId}</td>
				<td>${actOrd.memName}</td>
				<td>${actOrd.memTel}</td>
				<td>${actOrd.memEmail}</td>
				<td>${actOrd.ordActNum}</td>
				<td>${actOrd.totalPrice}</td>
				<td>${actOrd.actOrdStatusWord}</td>
				<td>${actOrd.ordTime}</td>
				
               	<td>
                <div class="form-inline justify-content-center">
                	<form action="<c:url value='/actAdminPreUpdate.do'/>" method="POST">
                		<input type="hidden" id="actOrdId" name="actOrdId" value="${actOrd.actOrdId}"> 
						<input type="hidden" id="actId" name="actId" value="${actOrd.actFarmer.actId}"> 
						<input class="btn btn-primary py-2 px-3"name="update" type="submit" value="修改" >
					</form>
					&emsp;
					<form action="<c:url value='/actOrdDelet.do'/>" method="POST">
						<input type="hidden" id="actOrdId" name="actOrdId" value="${actOrd.actOrdId}">  
						<input class="btn btn-primary py-2 px-3 " name="delet" type="submit" value="刪除" >
					</form>
				</div>
                </td>
            </tr>
		</c:forEach>
        </tbody>
    </table>
</div>
</div>
</section>
<!-------------------------/.內容區--------------------------------->

<!-- --------footer------------------------------------- -->
	<footer class=" footer">
		<jsp:include page="/WEB-INF/pages/footer.jsp" />
	</footer>

	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" /> 
 			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
 		</svg>
 	</div>


<!-- -------------------DataTable引入的js---------------------------------------------------------------------- -->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
	<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
	
<!-- -------------------DataTable的javascript---------------------------------------------------------------------- -->
	<script>
	$(document).ready(function() {
	    $('#actOrd').DataTable();
	} );
	</script>
</body>

</html>