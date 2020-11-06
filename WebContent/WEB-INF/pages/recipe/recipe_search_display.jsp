<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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
	<form action="workpage.controller" method="post" runat="server">
		<jsp:include page="/top.jsp" />
		<fieldset>
			<legend>搜尋結果</legend>
			<c:forEach var='BeanToken' items="${List}">
				<div class="line">
					<a href='${BeanToken.name}'></a> <label>名稱 :
						${BeanToken.name}</label>
				</div>
				<br>
				<div id="line">
					<label>食材: ${BeanToken.ingredients_A} </label>
					<%-- 				<label for="">份量: ${BeanToken.gram_A}  </label> g --%>
				</div>
				<br>
				<div class="line">
					<label>介紹 : ${BeanToken.desc}</label>
				</div>
				<br>
				<div class="line">
					<label>料理方法 : ${BeanToken.method}</label>
				</div>
				<br>
				<!-- 			<div class="line"> -->
				<%-- 				<label>圖片 : ${BeanToken.method}</label> --%>
				<!-- 			</div> -->
				<hr>
			</c:forEach>
			<div style="text-align: center;">
				<label>
					<input type="submit" name="back" value="回首頁" />
				</label>
			</div>
		</fieldset>
	</form>
</body>
</html>