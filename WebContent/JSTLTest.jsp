<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	<c:set var="a123" value="123" />
	${a123}
</body>
</html>