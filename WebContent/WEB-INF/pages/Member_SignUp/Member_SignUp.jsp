
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<title>會員註冊</title>
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
	<h2>會員註冊</h2>
	<form action="memberSignUp.controller" method="post">
		<table cellspacing="2" cellpadding="1" border="1" width="100%">
			<br>
			<tr>
				<td>會員身份</td>
				<td>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline1"
							name="member_permissions" class="custom-control-input" value="0"
							checked="true"> <label class="custom-control-label"
							for="customRadioInline1">買家</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline2"
							name="member_permissions" class="custom-control-input" value="1">
						<label class="custom-control-label" for="customRadioInline2">買家與賣家</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="email" name="member_email" size="40"
					maxlength="40" placeholder="example@yahoo.com.tw" required></td>
			</tr>
			<tr>
				<td>密碼</td>
				<td><input type="text" name="member_password" minlength="8"
					size="30" maxlength="20"
					pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
					title="密碼長度至少8碼，須包含大寫、小寫英文及數字" placeholder="password" required></td>
			</tr>
			<tr>
				<td>身分證字號</td>
				<td><input type="text" name="member_id" size="15"
					maxlength="10" pattern="^[A-Za-z]\d{9}$" title="身分證格式錯誤"
					placeholder="A123456789" required></td>
			</tr>
			<tr>
				<td>姓名</td>
				<td><input type="text" name="member_name" size="30"
					pattern="^[\u4e00-\u9fa5]{0,}$" title="只接受中文字" placeholder="王小明"
					required></td>
			</tr>
			<tr>
				<td>生日</td>
				<td><input type="date" name="member_birthday"
					pattern="\d{4}\-?\d{2}\-?\d{2}" placeholder="yyyy-MM-dd"
					onkeydown="return false" required></td>
			</tr>
			<tr>
				<td>電話</td>
				<td><input type="text" name="member_cellphone"
					"pattern="09\d{8}" title="格式錯誤，例0900111222"
					placeholder="0900123456" required></td>
			</tr>
			<tr>
				<td>地址</td>
				<td><input type="text" name="member_address" size="50"
					pattern="^[\u4e00-\u9fa5\d]{0,}$" placeholder="桃園市中壢區中大路300號"
					required></td>
			</tr>
			<tr>
				<td>統一編號</td>
				<td><input type="text" name="member_gui_number" size="20"
					value="" pattern="\d{8}" title="需輸入8位數字" placeholder="選填"></td>
			</tr>


		</table>
		<div align="center">
			<input type="checkbox" name="e_paper" value="1" checked="true">
			<label>訂閱電子報</label>
		</div>
		<br>
		<center>
			<input type="submit" name="submit" value="送出"> <input
				type="reset" value="重置">
		</center>
	</form>
</body>
</html>