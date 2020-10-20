
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
</head>
<body>
<jsp:include page="/top.jsp" />
	<script type="text/javascript">
		if (!alert("身分證字號輸入錯誤，請重新輸入"))
			document.location = "Member_SignUp/Member_SignUp.jsp";
	</script>
</body>
</html>