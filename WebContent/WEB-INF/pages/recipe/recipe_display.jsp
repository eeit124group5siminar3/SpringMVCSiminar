<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>完成</title>
<style>
body {  
	background:#EBFFEB;
}
fieldset {
	width: 500px;
	margin: 0px auto;
	border :8px #FFD382 groove;
	border-radius: 15px;
}
        table{
            border-collapse: collapse;
        }
</style>
</head>
<body>
<jsp:include page="/top.jsp" />
<h1 style="text-align: center;">確認頁面</h1>
	<fieldset>
	<form action='<c:url value="/uploadConfirm.controller"/>' method="post" >
		<table cellspacing="2" cellpadding="1" border="1" width="100%">
			<tr>
				<td>名稱</td>
				<td>${name}</td>
			</tr>
			<tr>
				<td>種類</td>
				<td>${cate}</td>
			</tr>
			<tr>
				<td>食材</td>
				<td>${ingredients_A}</td>
			</tr>
			<tr>
				<td>份量</td>
				<td>${gram_A}</td>
			</tr>
			<tr>
				<td>介紹</td>
				<td>${desc}</td>
			</tr>
			<tr>
				<td>料理方法</td>
				<td>${method}</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td>照片</td> -->
<%-- 				<td></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>檔名</td> -->
<%-- 				<td></td> --%>
<!-- 			</tr> -->

		</table>
		<br>
		<center>
			<input type="submit" name="confirm" value="確認" />
			<label for="" style="text-align:center;"> <input type="reset"
			onclick="javascript:location.href='recipe/recipe_workpage.jsp'" value="回到首頁"></input>
		
		</label>
		</center>
	</form>
	</fieldset>
		
</body>
</html>