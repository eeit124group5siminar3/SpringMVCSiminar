
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

fieldset {
	width: 220px;
	margin: auto;
	margin-top: 200px;
}

form {
	width: 200px;
	margin: auto;
	text-align: center;
}

button {
	margin-top: 5px;
}
</style>
</head>
<body>
	<jsp:include page="/top.jsp" />
	<fieldset>
		<legend>會員登入</legend>
		<form action="checkLogin.controller" method="post">
			<table cellspacing="2" cellpadding="1" border="1" width="100%">
				<label for="">Email:<input type="text" name="email"
					size="20" value="${requestScope.user}${param.email}"></label>
				<br>
				<br>
				<label for="">密碼: <input type="password" name="password"
					size="20" value="${requestScope.password}${param.password}"></label>
				<br>
				<br>
				<input type="checkbox" name="remember" <c:if test='${requestScope.remember==true}'>checked='checked'</c:if> 
             value="true">
				<label for="">記住Email與密碼</label>
				<br>
				<button type="submit" name="login">登入</button>
				<button type="reset">重置</button>
				</form>
				<br>
				<br>
				<a href="Member_ForgotPassword.jsp" style="float: left">忘記密碼</a>
				<a href="Member_SignUp.jsp" style="float: right">註冊</a>
				</fieldset>
</body>
</html>