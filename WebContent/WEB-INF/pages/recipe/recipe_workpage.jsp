<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {  
	background:#EBFFEB;
}

div{
 	text-align:center; 	
/*   	border:8px #FFD382 groove;  */
 	top:5px;
      
 	
}

</style>
</head>
<body>
		<form action='<c:url value="/function.controller"/>' method="post">
		<c:set var="funcName" value="ORD" scope="session" /> 
		<jsp:include page="/top.jsp" />
		<h1 style="text-align: center;">食譜管理</h1>
		<div>
			<input type="submit" name="action" value="上傳食譜" />

			<input type="submit" name="action" value="修改食譜" />

			<input type="submit" name="action" value="搜尋料理" />

<!-- 			<input type="submit" name="action" value="刪除" /> -->
			</div>
		</form>

	

</body>
</html>