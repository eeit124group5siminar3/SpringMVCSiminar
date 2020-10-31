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
	<center>
		<h2>修改成功</h2>
		<label for=""> <input type="reset"
			onclick="javascript:location.href='recipe/recipe_workpage.jsp'"
			value="回到首頁"></input>
		</label>
	</center>
</body>
</html>