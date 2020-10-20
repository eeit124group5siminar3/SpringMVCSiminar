<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {  
	background:#EBFFEB;
}

div{
 	text-align:center; 	
/*   	border:8px #FFD382 groove;  */
 	top:5px;
      
 	
}

</style>
</head>
<body>
	
	
		<!-- 		<a href="recipe_upload.jsp" name="upload_rec">新增食譜</a><br> -->
		<!-- 		<a href="recipe.Recipe_Servlet_update" name="update_rec">修改食譜 </a><br> -->
		<!-- 		<a href="recipe_upload.jsp" name="">搜尋食譜 </a><br> -->
		<form action="../Recipe_Servlet" method="post">
		<c:set var="funcName" value="ORD" scope="session" /> 
		<jsp:include page="/top.jsp" />
		<h1 style="text-align: center;">食譜管理</h1>
		<div>
			<input type="submit" name="upload" value="上傳" />
<!-- 		</form> -->

<!-- 		<form action="./Recipe_Servlet_update" method="post"> -->
			<input type="submit" name="update" value="更新" />
<!-- 		</form> -->

<!-- 		<form action="./Recipe_Servlet_search" method="post"> -->
			<input type="submit" name="search" value="搜尋" />
<!-- 		</form> -->

<!-- 		<form action="./Recipe_Servlet_delete" method="post"> -->
			<input type="submit" name="del" value="刪除" />
			</div>
		</form>

	

</body>
</html>