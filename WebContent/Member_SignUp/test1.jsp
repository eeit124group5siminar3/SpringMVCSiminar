<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊資料確認</title>
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
	<!-- 直接用Bean抓取DAO資料出來 -->
	<jsp:useBean id="reg_buyer" class="member_SignUp.model.Member_SignUp"
		scope="session" />
	<h2>會員註冊資料如下</h2>
	<form action="../member_SignUp/model/Test" method="post">
		<table cellspacing="2" cellpadding="1" border="1" width="100%">
			<br>
			<tr>
				<td>會員身份</td>
				<td>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline1"
							class="custom-control-input" checked="true" disabled> <label
							class="custom-control-label" for="customRadioInline1">買家</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline2"
							class="custom-control-input" disabled> <label
							class="custom-control-label" for="customRadioInline2">買家與賣家</label>
					</div>
					<div style="display: none">
						<jsp:getProperty name="reg_buyer" property="member_permissions" />
					</div>
				</td>
			</tr>

			<tr>
				<td>Email</td>
				<td><jsp:getProperty name="reg_buyer" property="member_email" /></td>
			</tr>
			<tr>
				<td>密碼</td>
				<td><jsp:getProperty name="reg_buyer"
						property="member_password" /></td>
			</tr>
			<tr>
				<td>身分證字號</td>
				<td><jsp:getProperty name="reg_buyer" property="member_id" /></td>
			</tr>
			<tr>
				<td>姓名</td>
				<td><jsp:getProperty name="reg_buyer" property="member_name" /></td>
			</tr>
			<tr>
				<td>生日</td>
				<td><jsp:getProperty name="reg_buyer"
						property="member_birthday" /></td>
			</tr>
			<tr>
				<td>電話</td>
				<td><jsp:getProperty name="reg_buyer"
						property="member_cellphone" /></td>
			</tr>
			<tr>
				<td>地址</td>
				<td><jsp:getProperty name="reg_buyer" property="member_address" /></td>
			</tr>
			<tr>
				<td>統一編號</td>
				<td><jsp:getProperty name="reg_buyer"
						property="member_gui_number" /></td>
			</tr>
		</table>
		<center>
			<input type="submit" name="confirm" value="確認" /> <input
				type="button" onclick="history.back()" value="修改"></input>
		</center>
	</form>
</body>
</html>