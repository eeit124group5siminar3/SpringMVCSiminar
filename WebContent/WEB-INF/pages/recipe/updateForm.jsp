<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.formform {
	width: 1000px;
	margin: auto;
	display: flex;
	align-items: center;
}

.wrap {
	width: 950px;
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
<form:form class="formform" id="updaeteForm" name="updaeteForm"
	action="./updateRecipe" method="post" enctype="multipart/form-data"
	modelAttribute="updateBean">
	<fieldset>
		<legend style="color: black; font-size: 23px">修改食譜</legend>

		<div class="form-group">
			<form:label for="formGroupExampleInput" path="name"
				class="input-group-text" style="font-size:20px;">名稱: </form:label>
			<form:input type="text" class="form-control"
				id="formGroupExampleInput" placeholder="" path="name" />
		</div>
		<br>
		<div class="form-group">
			<form:label path="cate" style="font-size:20px;"
				class="input-group-text">種類: <span
					style="font-size: 20px;">${updateBean.cate}</span>
			</form:label>

			<c:if test="${updateBean.cate!=null}">
				<c:set var="val" value="${updateBean.cate}"></c:set>
				<select class="form-control" required name="cate">
					<option value='<c:out value="${val}"></c:out>'>照舊</option>
					<option value="五榖根莖">五榖根莖</option>
					<option value="奶類">奶類</option>
					<option value="蛋豆魚肉類">蛋豆魚肉類</option>
					<option value="蔬菜類">蔬菜類</option>
					<option value="水果類">水果類</option>
					<option value="油脂類">油脂類</option>
				</select>
			</c:if>
			<div class="invalid-feedback">請輸入資料</div>
		</div>


		<br>


		<div class="form-row">
			<div class="col">
				<form:label path="ingredients_A" style="font-size:20px;"
					class="input-group-text">食材: </form:label>
				<form:input type="text" class="form-control" placeholder="食材"
					path="ingredients_A" />
			</div>
			<div class="col">
				<form:label path="gram_A" style="font-size:20px;"
					class="input-group-text">份量: </form:label>
				<form:input type="text" class="form-control" placeholder="重量  g"
					path="gram_A" />
			</div>
		</div>

		<br>
		<div class="form-row">
			<div class="col">
				<form:label path="ingredients_B"></form:label>
				<form:input type="text" class="form-control" placeholder="食材"
					path="ingredients_B" />
			</div>
			<div class="col">
				<form:label path="gram_B"></form:label>
				<form:input type="text" class="form-control" placeholder="重量  g"
					path="gram_B" />
			</div>
		</div>
		<div class="form-row">
			<div class="col">
				<form:label path="ingredients_C" style="font-size:20px;"></form:label>
				<form:input type="text" class="form-control" placeholder="食材"
					path="ingredients_C" />
			</div>
			<div class="col">
				<form:label path="gram_C" style="font-size:20px;"></form:label>
				<form:input type="text" class="form-control" placeholder="重量  g"
					path="gram_C" />
			</div>
		</div>

		<br>
		<div class="form-row">
			<div class="col">
				<form:label path="ingredients_D"></form:label>
				<form:input type="text" class="form-control" placeholder="食材"
					path="ingredients_D" />
			</div>
			<div class="col">
				<form:label path="gram_D"></form:label>
				<form:input type="text" class="form-control" placeholder="重量  g"
					path="gram_D" />
			</div>
		</div>

		<br>
		<div class="form-group">
			<form:label for="exampleFormControlTextarea1" path="desc"
				style="font-size:20px;" class="input-group-text">介紹: </form:label>
			<form:textarea class="form-control" id="exampleFormControlTextarea1"
				rows="8" path="desc"></form:textarea>
		</div>

		<br> <label class="input-group-text" style="font-size: 20px;">步驟一</label>
		<div align="center" class="wrap">
			<div style="width: 50%" class="wrap1">
				<div>
					<img id="imageA"
						src="<c:url value='/getImageA?rec_id=${updateBean.rec_id}'/>"
						width="400px">
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
				<form:label for="exampleFormControlTextarea1" path="method_A"
					style="font-size:20px;"></form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="11" path="method_A"></form:textarea>
			</div>

		</div>
		<hr>
		<label class="input-group-text" style="font-size: 20px;">步驟二</label>
		<div align="center" class="wrap">
			<div style="width: 50%" class="wrap1">
				<div>
					<img id="imageB"
						src="<c:url value='/getImageB?rec_id=${updateBean.rec_id}'/>"
						width="400px">
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
				<form:label for="exampleFormControlTextarea1" path="method_B"
					style="font-size:20px;"></form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="11" path="method_B"></form:textarea>
			</div>

		</div>
		<hr>
		<label class="input-group-text" style="font-size: 20px;">步驟三</label>
		<div align="center" class="wrap">
			<div style="width: 50%" class="wrap1">
				<div>
					<img id="imageC"
						src="<c:url value='/getImageC?rec_id=${updateBean.rec_id}'/>"
						width="400px">
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
				<form:label for="exampleFormControlTextarea1" path="method_C"
					style="font-size:20px;"></form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="11" path="method_C"></form:textarea>
			</div>

		</div>
		<hr>

		<label class="input-group-text" style="font-size: 20px;">步驟四</label>
		<div align="center" class="wrap">
			<div style="width: 50%" class="wrap1">
				<div>
					<img id="imageD"
						src="<c:url value='/getImageD?rec_id=${updateBean.rec_id}'/>"
						width="400px">
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
				<form:label for="exampleFormControlTextarea1" path="method_D"
					style="font-size:20px;"></form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="11" path="method_D"></form:textarea>
			</div>

		</div>
		<hr>
		<label>步驟五</label>
		<div align="center" class="wrap">
			<div style="width: 50%" class="wrap1">
				<div>
					<img id="imageE"
						src="<c:url value='/getImageE?rec_id=${updateBean.rec_id}'/>"
						width="400px">
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
				<form:label for="exampleFormControlTextarea1" path="method_E"
					style="font-size:20px;"></form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="11" path="method_E"></form:textarea>
			</div>

		</div>

		<hr>
		<div style="text-align: center;">
			<button type="submit" class="btn btn-primary">確認修改</button>
			<button type="button" class="btn btn-secondary" data-dismiss="modal"
				onclick="javascript:location.href='<c:url value='/updatePage.controller'/>'">Close</button>
		</div>
	</fieldset>
</form:form>
<script type="text/javascript">
		function loadImageFileA(event) {
			var image = document.getElementById('imageA');
			image.src = URL.createObjectURL(event.target.files[0]);
		}
		function loadImageFileB(event) {
			var image = document.getElementById('imageB');
			image.src = URL.createObjectURL(event.target.files[0]);
		}
		function loadImageFileC(event) {
			var image = document.getElementById('imageC');
			image.src = URL.createObjectURL(event.target.files[0]);
		}
		function loadImageFileD(event) {
			var image = document.getElementById('imageD');
			image.src = URL.createObjectURL(event.target.files[0]);
		}
		function loadImageFileE(event) {
			var image = document.getElementById('imageE');
			image.src = URL.createObjectURL(event.target.files[0]);
		}
	</script>