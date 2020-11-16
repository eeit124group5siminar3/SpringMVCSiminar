<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
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
	<form action='<c:url value="/searchSubmit.controller"/>' method="post">
		<jsp:include page="/top.jsp" />
		<h2 style="text-align: center;">搜尋食譜</h2>
		<div style="text-align: center;">
			<label> 
			
					請輸入: <input type="text" name="input" id="inputVal" onblur="ch()"  placeholder="請輸入"/><span id="sp"></span>
			
			</label>
			</div>
			<br>
			<div style="text-align: center;">
				<label> 
					<input type="submit" name="action" value="查詢">
				</label> 
				<label> 
					<input type="submit" name="action" value="回首頁">
				</label>
			</div>
	
	<hr>
	<c:forEach var='BeanToken'  items="${searchAll}">
	
			<div style="text-align: center;">
					<div>
					<label>
						<a href="<c:url value='/searchSubmit.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a>
					</label>
				</div>
				<br>
				<div>
					<label>食材: ${BeanToken.ingredients_A} </label>
				</div>
				<br>
				<div>
					<label>介紹 : ${BeanToken.desc}</label>
				</div>
				<br>
				<div>
					<label>料理方法 : ${BeanToken.method}</label>
				</div>
				<br>
				<hr>
	</div>
	</c:forEach>
	</form>
<script type="text/javascript">
	function ch() {

		let search = document.getElementById("inputVal").value;
		let inputLen = search.length;
		let spid = document.getElementById("sp");
		if (search == "") {
			spid.innerHTML = "請輸入";
		}
	}
</script>
</body>

</html>