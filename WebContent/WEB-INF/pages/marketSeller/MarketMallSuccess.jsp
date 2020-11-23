<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成功</title>
<jsp:include page="/top.jsp" />


</head>
<body>	
<div align="center">
<table>
<tr><td ALIGN='CENTER'><img src="images/farmer_mall.jpg" style="width:200px; height:200px"></td></tr>
<tr><td ALIGN='CENTER'><H1 >成功</H1></td></tr>
<tr><td ALIGN='CENTER'><a href="<c:url value='/MarketProduct.selectAll'/>">前往管理商品</a>
<tr><td ALIGN='CENTER'><a href="<c:url value='/'/>">回首頁</a>
</table>
</div>
</body>
</html>