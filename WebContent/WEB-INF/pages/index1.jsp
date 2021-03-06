<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>農遇</title>
<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
<style>
img{
	width:150px;
	height:150px;
}
td{
	width:200px;
}

body {  
	background:#EBFFEB;
}

div{
	padding :100px;
	}
h2{
	font-family: 'Permanent Marker', cursive;
	}
</style>
</head>
<body>

<div>

<table align="center">
<tr>
<td colspan="5" align="center"><h1 style="font-size:50px; color:orange"> 農遇</h1></td>
</tr>
<tr>
<td colspan="5" align="center"><h2 > Welcome </h2></td>
</tr>
<tr>
	<td align="center"><a href="RetrievePageProducts"><img src="images/crop.png"></a></td>
	<td align="center"><a href="<c:url value='/MarketProduct.selectAll'/>"><img src="images/market.png"></a></td>
	<td align="center"><a href="<c:url value='/frontPage.controller'/>"><img src="images/recipe.png"></a></td>
	<td align="center"><a href="<c:url value='/activeHomeSelectAll.controller'/>"><img src="images/footprint.png"></a></td>
		<td align="center">
		<c:if test="${empty login_ok}">
			<a href="<c:url value='login.controller' />">
				<img src="images/member.png">
			</a>
        </c:if>
        <c:if test="${!empty login_ok}">
			<a href="<c:url value='backstage.controller' />">
				<img src="images/member.png">
			</a>
        </c:if>
    </td>
</tr>
<tr>
	<td align="center"><h3>商城</h3></td>
	<td align="center"><h3>市場</h3></td>
	<td align="center"><h3>食譜</h3></td>
	<td align="center"><h3>活動</h3></td>
	<td align="center"><h3>會員</h3></td>
</tr>



</table>

</div>
<!--
<a href=""><img src="images/crop.png"></a>
<a href=""><img src="images/market.png"></a>
<a href=""><img src="images/recipe.png"></a>
<a href="ActiveHome.jsp"><img src="images/footprint.png"></a>
<a href="Member_SignUp/Member_Login.jsp"><img src="images/member.png"></a>
  -->
</body>
</html>