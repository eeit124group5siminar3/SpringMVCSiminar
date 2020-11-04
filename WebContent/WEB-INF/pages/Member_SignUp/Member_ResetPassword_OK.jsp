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
	<h2>修改成功</h2>
	<h2>請重新登錄</h2>
	<br>
	<a>5秒後自動跳轉至登錄頁面</a><br>
	<a>如果沒有跳轉，請按</a><a href="login.controller">這裡</a>！！！
	<%response.setHeader("refresh","5;URL=login.controller");%>
</body>
</html>