<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>重置密碼</title>
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
	<jsp:useBean id="reg_buyer" class="member_SignUp.model.Member_SignUp"
		scope="session" />
	<h2>修改密碼</h2>
	<form action=".\Member_ResetPassword_Servler" method="post">
		<table cellspacing="2" cellpadding="1" border="1" width="100%">
			<tr style="display:none">
				<td>Email</td>
				<td><jsp:getProperty name="reg_buyer"
						property="member_email" /></td>
			</tr>
			<tr>
				<td>舊密碼</td>
				<td><jsp:getProperty name="reg_buyer"
						property="member_password" /></td>
			</tr>
			<br>
			<br>
			<tr>
				<td>設定新密碼</td>
				<td><input type="password" name="member_password" size="30"
					maxlength="30" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" title="密碼長度至少8碼，須包含大寫、小寫英文及數字" placeholder="必填" required></td>
			</tr>
			<tr>
				<td>再輸入一次新密碼</td>
				<td><input type="password" name="member_password1" size="30"
					maxlength="30"  pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" title="密碼長度至少8碼，須包含大寫、小寫英文及數字" placeholder="必填" required></td>
			</tr>


		</table>
		<center>
			<input type="submit" name="confirm" value="確認" />
		</center>
	</form>
</body>
</html>