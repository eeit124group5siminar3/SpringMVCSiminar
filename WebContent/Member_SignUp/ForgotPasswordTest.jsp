<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1 no-cache不能存快取
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘記密碼</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body {
	background: #EBFFEB;
}
</style>
</head>
<body>
	<jsp:include page="/top.jsp" />
	<h2>忘記密碼</h2>
	<form action="..\ResetPasswordTest_Servler" method="post">
		<table cellspacing="2" cellpadding="1" border="1" width="100%">
		<br>
			<tr>
				<td>請輸入註冊的Email</td>
				<td><input type="text" name="member_email" size="20"
					maxlength="20" placeholder="必填"></td>
			</tr>
			<tr>
				<td>請輸入註冊的身份證字號</td>
				<td><input type="text" name="member_id" size="30"
					maxlength="30" placeholder="必填"></td>
			</tr>
			<tr>
				<td>請輸入註冊的姓名</td>
				<td><input type="text" name="member_name" placeholder="必填"></td>
			</tr>
			<tr>
				<td>請輸入註冊的電話</td>
				<td><input type="text" name="member_cellphone" placeholder="必填"></td>
			</tr>
		</table>
		<center>
			<input type="submit" name="submit" value="送出"> <input
				type="reset" value="重置">
		</center>
	</form>

</body>
</html>