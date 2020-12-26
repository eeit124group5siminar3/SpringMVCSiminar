<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>上傳食譜</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
 href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="css/fontawesome-free/all.min.css">
<link rel="stylesheet"
 href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="css/dist/adminlte.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<style>
.formform {
	width: 1000px;
	margin: auto;
	display: flex;
	align-items: center;
}

.wrap {
	width: 1000px;
	margin: auto;
	display: flex;
	align-items: center;
	margin-top: 30px;
}

.wrap1 {
	width: 50%;
	margin-left: 50px;
}

.txt {
	width: 50%;
	margin-left: 95px;
}
</style>
</head>
<body class="goto-here">
<c:if test="${!empty login_ok}">
<jsp:include page="/WEB-INF/pages/Message.jsp" />
</c:if>
<jsp:include page="/WEB-INF/pages/bar.jsp"/>
<section class="content-wrapper justify-content-center" style="background-color: #FFFFFF">


	<!-------------------------內容區--------------------------------->
	<form:form class="formform" action="uploadSubmit.controller"
		method="post" modelAttribute="details" runat="server"
		enctype="multipart/form-data">
		<fieldset>
			<legend style="color: black; font-size: 23px">上傳食譜</legend>
			<a href="#" onclick="input()">一鍵輸入</a>

			<div class="form-group">
				<form:label for="inputName" path="name"
					style="font-size:20px;" class="input-group-text">名稱: </form:label>
				<form:input type="text" class="form-control"
					id="inputName" placeholder="" path="name" />
			</div>
			<br>
			<div class="form-group">
				<form:label path="cate" style="font-size:20px;" class="input-group-text">
				種類: </form:label>
				<select class="form-control" required name="cate">
					<option value="">請選擇</option>
					<option value="五榖根莖">五榖根莖</option>
					<option value="奶類">奶類</option>
					<option value="蛋豆魚肉類">蛋豆魚肉類</option>
					<option value="蔬菜類">蔬菜類</option>
					<option value="水果類">水果類</option>
					<option value="油脂類">油脂類</option>
				</select>
				<div class="invalid-feedback">請輸入資料</div>
			</div>


			<br>


			<div class="form-row">
				<div class="col">
					<form:label for="inputIngredients_A" path="ingredients_A" style="font-size:20px;" class="input-group-text">食材: </form:label>
					<form:input id="inputIngredients_A" type="text" class="form-control" placeholder="食材"
						path="ingredients_A" />
				</div>
				<div class="col">
					<form:label for="inputGram_A" path="gram_A" style="font-size:20px;" class="input-group-text">份量: </form:label>
					<form:input id="inputGram_A" type="text" class="form-control" placeholder="重量  g"
						path="gram_A" />
				</div>
			</div>

			<br>
			<div class="form-row">
				<div class="col">
					<form:label for="inputIngredients_B" path="ingredients_B"></form:label>
					<form:input id="inputIngredients_B" type="text" class="form-control" placeholder="食材"
						path="ingredients_B" />
				</div>
				<div class="col">
					<form:label for="inputGram_B" path="gram_B"></form:label>
					<form:input id="inputGram_B" type="text" class="form-control" placeholder="重量  g"
						path="gram_B" />
				</div>
			</div>
			<br>


			<div class="form-row">
				<div class="col">
					<form:label for="inputIngredients_C" path="ingredients_C" style="font-size:20px;"></form:label>
					<form:input id="inputIngredients_C" type="text" class="form-control" placeholder="食材"
						path="ingredients_C" />
				</div>
				<div class="col">
					<form:label for="inputGram_C" path="gram_C" style="font-size:20px;"></form:label>
					<form:input id="inputGram_C" type="text" class="form-control" placeholder="重量  g"
						path="gram_C" />
				</div>
			</div>

			<br>
			<div class="form-row">
				<div class="col">
					<form:label for="inputIngredients_D" path="ingredients_D"></form:label>
					<form:input id="inputIngredients_D" type="text" class="form-control" placeholder="食材"
						path="ingredients_D" />
				</div>
				<div class="col">
					<form:label for="inputGram_D" path="gram_D"></form:label>
					<form:input id="inputGram_D" type="text" class="form-control" placeholder="重量  g"
						path="gram_D" />
				</div>
			</div>
			<br>
			<div class="form-group">
				<form:label for="inputDesc" path="desc"
					style="font-size:20px;" class="input-group-text">介紹: </form:label>
				<form:textarea class="form-control" id="inputDesc"
					rows="8" path="desc"></form:textarea>
			</div>

			<br>
			<!---------------- 上傳圖片、步驟  o -------------------------------------------->
			<label class="input-group-text" style="font-size:20px;">步驟一</label>
			<div align="center" class="wrap">
				<div style="width: 50%" class="wrap1">
					<div>
						<img id="imageA" src="" width="400px">
					</div>
					<br>

					<div class="custom-file" style="width: 400px;">
						<form:input type="file" class="custom-file-input"
							id="validatedCustomFile" path="multipartFile_A"
							onchange="loadImageFileA(event)" />

						<form:label class="custom-file-label" for="validatedCustomFile"
							path="multipartFile_A">Choose file</form:label>
						<div class="invalid-feedback">請上傳圖片</div>
					</div>
				</div>

				<div class="txt" class="form-group">
					<form:label for="inputMethod_A" path="method_A"
						style="font-size:20px;"></form:label>
					<form:textarea class="form-control"
						id="inputMethod_A" rows="11" path="method_A"></form:textarea>
				</div>

			</div>
			<hr>
			<label class="input-group-text" style="font-size:20px;">步驟二</label>
			<div align="center" class="wrap">
				<div style="width: 50%" class="wrap1">
					<div>
						<img id="imageB" src="" width="400px">
					</div>
					<br>

					<div class="custom-file" style="width: 400px;">
						<form:input type="file" class="custom-file-input"
							id="validatedCustomFile" path="multipartFile_B"
							onchange="loadImageFileB(event)" />

						<form:label class="custom-file-label" for="validatedCustomFile"
							path="multipartFile_B">Choose file</form:label>
						<div class="invalid-feedback">請上傳圖片</div>
					</div>
				</div>

				<div class="txt" class="form-group">
					<form:label for="inputMethod_B" path="method_B"
						style="font-size:20px;"></form:label>
					<form:textarea class="form-control"
						id="inputMethod_B" rows="11" path="method_B"></form:textarea>
				</div>

			</div>
			<hr>
			<label class="input-group-text" style="font-size:20px;">步驟三</label>
			<div align="center" class="wrap">
				<div style="width: 50%" class="wrap1">
					<div>
						<img id="imageC" src="" width="400px">
					</div>
					<br>

					<div class="custom-file" style="width: 400px;">
						<form:input type="file" class="custom-file-input"
							id="validatedCustomFile" path="multipartFile_C"
							onchange="loadImageFileC(event)" />

						<form:label class="custom-file-label" for="validatedCustomFile"
							path="multipartFile_C">Choose file</form:label>
						<div class="invalid-feedback">請上傳圖片</div>
					</div>
				</div>

				<div class="txt" class="form-group">
					<form:label for="inputMethod_C" path="method_C"
						style="font-size:20px;"></form:label>
					<form:textarea class="form-control"
						id="inputMethod_C" rows="11" path="method_C"></form:textarea>
				</div>

			</div>
			<hr>
			<label class="input-group-text" style="font-size:20px;">步驟四</label>
			<div align="center" class="wrap">
				<div style="width: 50%" class="wrap1">
					<div>
						<img id="imageD" src="" width="400px">
					</div>
					<br>

					<div class="custom-file" style="width: 400px;">
						<form:input type="file" class="custom-file-input"
							id="validatedCustomFile" path="multipartFile_D"
							onchange="loadImageFileD(event)" />

						<form:label class="custom-file-label" for="validatedCustomFile"
							path="multipartFile_D">Choose file</form:label>
						<div class="invalid-feedback">請上傳圖片</div>
					</div>
				</div>

				<div class="txt" class="form-group">
					<form:label for="inputMethod_D" path="method_D"
						style="font-size:20px;"></form:label>
					<form:textarea class="form-control"
						id="inputMethod_D" rows="11" path="method_D"></form:textarea>
				</div>

			</div>
			<hr>
			<label class="input-group-text" style="font-size:20px;">步驟五</label>
			<div align="center" class="wrap">
				<div style="width: 50%" class="wrap1">
					<div>
						<img id="imageE" src="" width="400px">
					</div>
					<br>

					<div class="custom-file" style="width: 400px;">
						<form:input type="file" class="custom-file-input"
							id="validatedCustomFile" path="multipartFile_E"
							onchange="loadImageFileE(event)" />

						<form:label class="custom-file-label" for="validatedCustomFile"
							path="multipartFile_E">Choose file</form:label>
						<div class="invalid-feedback">請上傳圖片</div>
					</div>
				</div>

				<div class="txt" class="form-group">
					<form:label for="inputMethod_E" path="method_E"
						style="font-size:20px;"></form:label>
					<form:textarea class="form-control"
						id="inputMethod_E" rows="11" path="method_E"></form:textarea>
				</div>

			</div>

			<hr>
			<div style="text-align: center;">
				<input id="send" type="submit" class="btn btn-outline-success"
					value="送出" onclick="funUpload()" /> <label> <input
					type="submit" class="btn btn-outline-success"
					onclick="javascript:location.href='<c:url value='frontPage.controller'/>'"
					value="回首頁" /></label>

			</div>

		</fieldset>

	</form:form>
	<br>
	<!------------------------------------------------------------------>
	<jsp:include page="../footer.jsp" />



	<script type="text/javascript">
		function loadImageFileA(event) {
			var image = document.getElementById('imageA');
			image.src = URL.createObjectURL(event.target.files[0]);
		}
		function loadImageFileB(event) {
			var image = document.getElementById('imageB');
			image.src = URL.createObjectURL(event.target.files[0]);
		};
		function loadImageFileC(event) {
			var image = document.getElementById('imageC');
			image.src = URL.createObjectURL(event.target.files[0]);
		};
		function loadImageFileD(event) {
			var image = document.getElementById('imageD');
			image.src = URL.createObjectURL(event.target.files[0]);
		};
		function loadImageFileE(event) {
			var image = document.getElementById('imageE');
			image.src = URL.createObjectURL(event.target.files[0]);
		};
	</script>
	<script type="text/javascript">
		function input(){
			$("#inputName").val("［零失敗料理］咖哩牛肉蛋包飯");
			$("#inputIngredients_A").val("牛肉");
			$("#inputIngredients_B").val("紅蘿蔔");
			$("#inputIngredients_C").val("馬鈴薯");
			$("#inputIngredients_D").val("咖喱塊");
			$("#inputGram_A").val("300");
			$("#inputGram_B").val("100");
			$("#inputGram_C").val("50");
			$("#inputGram_D").val("200");
			$("#inputDesc").val("新手都能上手的日式料理，其實用咖喱塊真的很方便，步驟也很簡單又好上手");
			$("#inputMethod_A").val("備菜-牛肉 - 切塊,馬鈴薯 - 切塊,紅蘿蔔 - 切塊,洋蔥 - 切大絲狀");
			$("#inputMethod_B").val("同時再依序把洋蔥、紅蘿蔔炒熟");
			$("#inputMethod_C").val("加入咖哩塊、糖，用湯匙或鏟子把咖哩塊攪散，煮個5分鐘即可食用");
			$("#inputMethod_D").val("試味道，即可完成");
			$("#inputMethod_E").val("完成！");

			}

	
		function funUpload() {
			alert('上傳成功');
		}
	</script>
</body>
</html>