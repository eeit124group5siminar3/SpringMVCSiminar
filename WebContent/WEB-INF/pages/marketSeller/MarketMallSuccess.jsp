<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
<head>
<meta charset="UTF-8">
<title>成功</title>
<jsp:include page="../header.jsp"/>


</head>
<body>	
<div align="center">
<table>
<tr><td ALIGN='CENTER'><img src="images/farmer_mall.jpg" style="width:200px; height:200px"></td></tr>
<tr><td ALIGN='CENTER'><H1 >成功</H1></td></tr>
<tr><td ALIGN='CENTER'><a href="<c:url value='/MarketProduct.selectAll'/>">前往管理商品</a>
<tr><td ALIGN='CENTER'><a href="<c:url value='backstage.controller'/>">回首頁</a>
</table>
</div>
<jsp:include page="/WEB-INF/pages/footer.jsp"/>
</body>
</html>