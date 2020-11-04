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
	<form action='<c:url value="/submitChoose.controller"/>' method="post" runat="server">
	<jsp:include page="/top.jsp" />	
	<fieldset>
		<legend>修改食譜</legend>		
		<c:forEach  var='BeanToken' items="${recipe_table}">	
		<div>
		<input type="hidden" name="rec_id" value="${BeanToken.rec_id}" />
			<label for="">名稱: <input type="text" name="name" value="${BeanToken.name}" /></label>
		</div>
			<br>
			<div>
				<label>種類: </label> <select name="cate">
					<option value="雞肉">雞肉</option>
					<option value="豬肉">豬肉</option>
					<option value="牛肉">牛肉</option>
					<option value="蔬食">蔬食</option>
				</select>
			</div>		
			<br>
			<div id="line">
				<label>食材: <input type="text" name="ingredients_A" value="${BeanToken.ingredients_A}" /> 份 
				</label> 
<%-- 				<label for="">份量: <input type="text" name="recipe_table" value="${BeanToken.gram_A}" /> g  --%>
<!-- 				</label> -->
			</div>
			<br>
			<div id="line">
				<label>食材: <input type="text" name="ingredients_B" value="${BeanToken.ingredients_B}" />
					份
 				</label> 
<%--				<label>份量: <input type="text" name="gram_B" value="${BeanToken.gram_B}" /> g --%>
<!-- 				</label> -->
			</div>
			<br>

			<div id="line">
				<label for="">食材: <input type="text" name="ingredients_C" value="${BeanToken.ingredients_C}" />
					份
				</label>
<%-- 				 <label>份量: <input type="text" name="gram_C" value="${BeanToken.gram_C}" /> g --%>
<!-- 				</label> -->
			</div>
			<br>

			<div id="line">
				<label>食材: <input type="text" name="ingredients_D" value="${BeanToken.ingredients_D}" />
					份
				</label> 
<%-- 				<label>份量: <input type="text" name="gram_D" value="${BeanToken.gram_D}" /> g --%>
<!-- 				</label> -->
			</div>
			<br>
			<div class="input-dyna-add"></div>
			<!-- 食材: <input type="text" class="add" name="ingredients" disabled/> 份
                份量: <input type="text" class="add" name="gram" disabled/> g
                <br> -->
			<button id="btn" onclick="addinput()">新增</button>

			<hr>
			<div>
				<label>方法: </label>
				<textarea cols="40" rows="5" name="method" >${BeanToken.method}</textarea>
			</div>
			<br>
			<div>
				<label>介紹: </label>
				<textarea cols="40" rows="5" name="desc" >${BeanToken.desc}</textarea>
			</div>
			<br>
			<div>
<!-- 				<label>照片上傳: </label><input type="file" name="img" /> -->

  			<img id="blah" src="#" alt="your image" />
  			<br>
  			<input type='file' id="imgInp" name="img" />

			</div>
			</c:forEach>
			<br>
			<div style="text-align: center;">
				<label><input type="submit" name="action" value="確認修改"></label>
				<label><input type="submit" name="action" value="刪除"></label>
				<label><input type="reset"
			onclick="javascript:location.href='recipe/recipe_workpage.jsp'" value="取消"></input>
		</label>
			</div>
			
			</fieldset>
		</form>
</body>
</html>