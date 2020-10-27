<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background: #EBFFEB;
}
</style>
</head>
<body>
<jsp:include page="/top.jsp" />
	<h2>註冊成功</h2>
	<br>
	<a>5秒後自動跳轉至首頁</a><br>
	<a>如果沒有跳轉，請按</a><a href="../index.jsp">這裡</a>！！！
	<%response.setHeader("refresh","5;URL=../index.jsp");%>
</body>
</html>