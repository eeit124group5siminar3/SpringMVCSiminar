<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
fieldset {
	width: 500px;
	margin: 0px auto;
	border :8px #FFD382 groove;
	border-radius: 15px;
}
	body {  
		background:#EBFFEB;
	}	
</style>
</head>
<body>
<%-- 	<jsp:useBean id="user_recipe" class="recipe.Recipe_Obj" scope="session"></jsp:useBean> --%>

	<form action='<c:url value="/updateProcess.controller"/>' method="post"> 	
	<jsp:include page="/top.jsp" />
		
	<fieldset>
		<legend>修改食譜</legend>
		<h2>已上傳食譜</h2>		
		<c:forEach  var='BeanToken' items="${user_recipe}">		
		<li>
			<div>
				<label>
					<a href="<c:url value='/updateProcess.controller?choose=${BeanToken.rec_id}' />">${BeanToken.name}</a> 
				</label>
			</div>		
			<br>
		</li>
		<li>
			<div>
				<label>
					<ul>${BeanToken.date}</ul> 
				</label>
			</div>		
		</c:forEach>
		</li>
			<div style="text-align: center;">
				<label>
					<input type="submit" name="action" value="回首頁">
				</label>
			</div>
	</fieldset>
	</form>



</body>
</html>