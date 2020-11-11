<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
	<title>會員資料修改</title>
<style>
body {
	background: #EBFFEB;
}

#project {
	width: 150px;
	position: absolute;
	font-weight: bold;
	top: 150px;
	left: 15px;
	color: white;
	display: block;
}

#backstage_page {
	position: absolute;
	top: 150px;
	left: 250px;
	right: 50px;
	text-align: center;
}
</style>

</head>
<body>
	<jsp:include page="/top.jsp" />
	<!-- 直接用Bean抓取DAO資料出來 -->
	<jsp:useBean id="reg_buyer"
		class="tw.group5.member_SignUp.model.Member_SignUp" scope="session" />

	<!-- ----------左邊項目---------- -->

	<div id="project">
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#demo">會員管理</button>
			<div id="demo" class="collapse">
				<br>
				<form name="form1" action="memberUpdate.controller" method="post">
					<li align="left"><a href="javascript:document.form1.submit();"
						class="hyperlink">資料修改</a></li>
				</form>
				<li align="left"><a href="" class="hyperlink">評價查詢</a></li>
			</div>
		</div>
		<br> <br>
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#demo1">商城管理</button>
			<div id="demo1" class="collapse">
				<li align="left"><a href="" class="hyperlink">????</a></li>
				<li align="left"><a href="" class="hyperlink">????</a></li>
			</div>
		</div>
		<br> <br>
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#demo2">市場管理</button>
			<div id="demo2" class="collapse">
				<li align="left"><a href="" class="hyperlink">????</a></li>
				<li align="left"><a href="" class="hyperlink">????</a></li>
			</div>
		</div>
		<br> <br>
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#demo3">食譜管理</button>
			<div id="demo3" class="collapse">
				<li align="left"><a href="" class="hyperlink">食譜新增</a></li>
				<li align="left"><a href="" class="hyperlink">食譜修改</a></li>
			</div>
		</div>
		<br> <br>
		<div style="margin-left: 25px">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#demo4">活動管理</button>
			<div id="demo4" class="collapse">
				<li align="left"><a href="" class="hyperlink">????</a></li>
				<li align="left"><a href="" class="hyperlink">????</a></li>
			</div>
		</div>
	</div>
	<!-- ----------------------------------------- -->
	<div id="backstage_page">
		<h2>會員資料修改</h2>
		<form action="memberBackstageUpDate.controller" name="myForm"
			method="post">
			<table cellspacing="2" cellpadding="1" border="1" width="100%">
				<br>
				<tr>
					<td>會員身份</td>
					<td><c:if test="${reg_buyer.member_permissions =='0'}">
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="customRadioInline1"
									name="member_permissions" id="member_permissions"
									class="custom-control-input" value="0" checked="true">
								<label class="custom-control-label" for="customRadioInline1">買家</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="customRadioInline2"
									name="member_permissions" id="member_permissions1"
									class="custom-control-input" value="1"> <label
									class="custom-control-label" for="customRadioInline2">買家與賣家</label>
							</div>
						</c:if> <c:if test="${reg_buyer.member_permissions == '1'}">
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="customRadioInline1"
									name="member_permissions" id="member_permissions"
									class="custom-control-input" value="0"> <label
									class="custom-control-label" for="customRadioInline1">買家</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="customRadioInline2"
									name="member_permissions" id="member_permissions1"
									class="custom-control-input" value="1" checked="true">
								<label class="custom-control-label" for="customRadioInline2">買家與賣家</label>
							</div>
						</c:if></td>
				</tr>

				<tr>
					<td>Email</td>
					<td><jsp:getProperty name="reg_buyer" property="member_email" /></td>
				</tr>
				<tr>
					<td>密碼</td>
					<td><input type="text" name="member_password"
						id="member_password" minlength="8" size="30" maxlength="20"
						value="${reg_buyer.member_password}"
						pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
						title="密碼長度至少8碼，須包含大寫、小寫英文及數字" placeholder="password" required></td>
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
					<td><input type="text" name="member_cellphone"
						pattern="09\d{8}" title="格式錯誤，例0900111222" id="member_cellphone"
						value="${reg_buyer.member_cellphone}" required></td>
				</tr>
				<tr>
					<td>地址</td>
					<td><input type="text" name="member_address" size="50"
						pattern="^[\u4e00-\u9fa5\d]{0,}$" id="member_address"
						value="${reg_buyer.member_address}" required></td>
				</tr>
				<tr>
					<td>統一編號</td>
					<td><jsp:getProperty name="reg_buyer"
							property="member_gui_number" /></td>
				</tr>
			</table>

			<div align="center">
				<c:if test="${reg_buyer.e_paper =='1'}">
					<input type="checkbox" name="e_paper" id="e_paper" value="1"
						checked="true">
				</c:if>
				<c:if test="${reg_buyer.e_paper =='0'}">
					<input type="checkbox" name="e_paper" id="e_paper" value="1">
				</c:if>
				<label>訂閱電子報</label>
			</div>

			<br>
			<center>
				<input type="submit" id="submit" value="確認" /> <input type="reset"
					value="重置">
			</center>
	</div>
	</form>
</body>
</html>