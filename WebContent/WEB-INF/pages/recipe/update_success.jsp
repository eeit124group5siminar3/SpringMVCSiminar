<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改成功</title>
<style>
	body {  
	background:#EBFFEB;
}
</style>
</head>
<body>
	<jsp:include page="/top.jsp" />
	<form action="workpage.controller" method="post">
		<div style="text-align: center;">
			<h2>修改成功</h2>
			<label> 
				<input type="submit" name="back" value="回首頁" />
			</label>
		</div>
	</form>
</body>
</html>