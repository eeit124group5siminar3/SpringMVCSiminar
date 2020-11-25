<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload recipe</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<style>

.formform{
	margin:auto;
	
	width:600px;
}
</style>
</head>
<body>
	<fieldset>
			<form:form class="formform" action="uploadSubmit.controller" method="post" modelAttribute="details" runat="server" enctype="multipart/form-data">		
		<legend style="color:black;font-size:23px">上傳食譜</legend>
				
				<div class="form-group">
				<form:label for="formGroupExampleInput" path="name" style="font-size:20px;">名稱: </form:label> 
				<form:input
					type="text" class="form-control" id="formGroupExampleInput"
					value="${name}" path="name"/>
			</div>
<br>
		<div class="form-group">
			<form:label path="cate" style="font-size:20px;">種類: </form:label>
			<select class="form-control" required name="cate">
				<option value="">Open this select menu</option>
				<option value="雞肉">雞肉</option>
				<option value="豬肉">豬肉</option>
				<option value="牛肉">牛肉</option>
				<option value="蔬食">蔬食</option>
			</select>
			<div class="invalid-feedback">請輸入資料</div>
		</div>


			<br>


			<div class="form-row">
				<div class="col">
					<form:label path="ingredients_A" style="font-size:20px;">食材: </form:label> 
					<form:input type="text" class="form-control" value="${ingredients_A}"
						path="ingredients_A" />
				</div>
				<div class="col">
					<form:label path="gram_A" style="font-size:20px;">份量: </form:label>
					<form:input type="text" class="form-control" value="${gram_A}"
						path="gram_A" /> 
				</div>
			</div>

			<br>
			<div class="form-row">
				<div class="col">
					<form:label path="ingredients_B"></form:label> 
					<form:input type="text" class="form-control" value="${ingredients_B}"
						path="ingredients_B" /> 
				</div>
				<div class="col">
					<form:label path="gram_B"></form:label>
					<form:input type="text" class="form-control" value="${gram_B}"
						path="gram_B" />
				</div>
			</div>
<br>
			<div class="form-group">
				<form:label for="exampleFormControlTextarea1" path="desc" style="font-size:20px;">介紹: </form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3" path="desc" value="${desc}"></form:textarea>
			</div>
			<div class="form-group">
				<form:label for="exampleFormControlTextarea1" path="method" style="font-size:20px;">料理方法: </form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3" path="method" value="${method}"></form:textarea>
			</div>

<br>
			<div class="custom-file">
				<form:input type="file" class="custom-file-input"
					id="validatedCustomFile" path="multipartFile"/>
				<form:label class="custom-file-label" for="validatedCustomFile" path="multipartFile">Choose
					file</form:label>
				<div class="invalid-feedback">請上傳圖片</div>
			</div>

			<hr>
			<div style="text-align: center;">
				<input id="send" type="submit" name="action"
					value="送出" onclick="doUpload()" />
				</label> 
<!-- 				<label> <input type="submit" name="action" value="回首頁" /> -->

			</div>			
		</form:form>
	</fieldset>
	
	
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
</body>
</html>