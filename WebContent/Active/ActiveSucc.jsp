<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成功</title>
<jsp:include page="/top.jsp" />


</head>s
<body>	
<div align="center">
<form action="<c:url value='/ActiveHomeServlet'/>" method="post">
<table>
<tr><td ALIGN='CENTER'><img src="../images/farmer.png" style="width:200px; height:200px"></td></tr>
<tr><td ALIGN='CENTER'><H1 >成功</H1></td></tr>
<tr><td ALIGN='CENTER'><input type="submit" value="回活動首頁"></td></tr>
</table>
</form>

</div>
</body>
</html>