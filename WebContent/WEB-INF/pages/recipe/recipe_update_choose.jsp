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

	<form action="../Recipe_Servlet_update" method="post"> 	
	<jsp:include page="/top.jsp" />
		
	<fieldset>
		<legend>修改食譜</legend>
		<h2>已上傳食譜</h2>		
		<c:forEach  var='BeanToken' items="${user_recipe}">		
			<div>
<%-- 						${BeanToken.rec_id} --%>
			
				<a href="Recipe_Servlet_update?name='${BeanToken.rec_id}'">${BeanToken.name}</a>
			</div>		
			<br>

		</c:forEach>
		
		<label for="" style="text-align:center;"> <input type="reset"
			onclick="javascript:location.href='recipe/recipe_workpage.jsp'" value="回到首頁"></input>
		</label>
	</fieldset>
	</form>



</body>
</html>