<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改成功</title>
<style>
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<form action="frontPage.controller" method="get">
		<div style="text-align: center;">
			<h2>修改成功</h2>
			<label> 
				<input type="submit" name="back" value="回首頁" />
			</label>
		</div>
	</form>
</body>
</html>