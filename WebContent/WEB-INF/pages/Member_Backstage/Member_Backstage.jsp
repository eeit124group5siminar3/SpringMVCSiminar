
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1 no-cache不能存快取
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員登錄</title>
<style>
body {
	background: #EBFFEB;
}

form {
	width: 200px;
	margin: auto;
	text-align: center;
}

div {
	margin-top: 50px;
	margin-left: 25px;
}

</style>
</head>
<body>
	<jsp:include page="/top.jsp" />

<div>
<a>會員管理</a>





</div>



</body>
</html>