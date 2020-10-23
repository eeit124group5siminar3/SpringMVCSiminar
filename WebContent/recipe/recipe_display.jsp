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
	<jsp:useBean id="recipe_check" class="recipe.recipe_bean.Recipe_Bean" ></jsp:useBean>
	<fieldset>
	<form action="..\Recipe_Servlet" method="post" scope="session">
		<table cellspacing="2" cellpadding="1" border="1" width="100%">
			<tr>
				<td>名稱</td>
				<td><jsp:getProperty name="recipe_check" property="name" /></td>
			</tr>
			<tr>
				<td>種類</td>
				<td><jsp:getProperty name="recipe_check" property="cate" /></td>
			</tr>
			<tr>
				<td>食材</td>
				<td><jsp:getProperty name="recipe_check" property="ingredients_A" /></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td>份量</td> -->
<%-- 				<td><jsp:getProperty name="recipe_check" property="gram_A" /></td> --%>
<!-- 			</tr> -->
			<tr>
				<td>介紹</td>
				<td><jsp:getProperty name="recipe_check" property="desc" /></td>
			</tr>
			<tr>
				<td>料理方法</td>
				<td><jsp:getProperty name="recipe_check" property="method" /></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td>照片</td> -->
<%-- 				<td><jsp:getProperty name="rec_img" property="" /></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>檔名</td> -->
<%-- 				<td><jsp:getProperty name="recipe_check" property="img" /></td> --%>
<!-- 			</tr> -->

		</table>
		<br>
		<center>
			<input type="submit" name="confirm" value="確認" />
		</center>
	</form>
	</fieldset>
		
</body>
</html>