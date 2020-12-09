<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form class="formSet" id="updaeteForm" name="updaeteForm"	
		action="./updateRecipe" method="post" 
		enctype="multipart/form-data" modelAttribute="updateBean">
	<fieldset>
		<legend style="color:black;font-size:23px">修改食譜</legend>		
		
				<div class="form-group">
				<form:label for="formGroupExampleInput" path="name" 
					style="font-size:20px;">名稱: </form:label>
				<form:input type="text" class="form-control"
					id="formGroupExampleInput" placeholder="" path="name"/>
			</div>
			<br>
			<div class="form-group">
				<form:label path="cate" style="font-size:20px;">種類: </form:label>
				<span style="font-size:20px;">${updateBean.cate}</span>
				<c:if test="${updateBean.cate!=null}">
					<c:set var="val" value="${updateBean.cate}"></c:set>
				<select class="form-control" required name="cate">
					<option value='<c:out value="${val}"></c:out>'>照舊</option>
					<option value="雞肉">雞肉</option>
					<option value="豬肉">豬肉</option>
					<option value="牛肉">牛肉</option>
					<option value="蔬食">蔬食</option>
				</select>
				</c:if>
				<div class="invalid-feedback">請輸入資料</div>
			</div>


			<br>


			<div class="form-row">
				<div class="col">
					<form:label path="ingredients_A" style="font-size:20px;">食材: </form:label>
					<form:input type="text" class="form-control" placeholder="食材"
						path="ingredients_A"/>
				</div>
				<div class="col">
					<form:label path="gram_A" style="font-size:20px;">份量: </form:label>
					<form:input type="text" class="form-control" placeholder="重量  g"
						path="gram_A" />
				</div>
			</div>

			<br>
			<div class="form-row">
				<div class="col">
					<form:label path="ingredients_B"></form:label>
					<form:input type="text" class="form-control" placeholder="食材"
						path="ingredients_B"/>
				</div>
				<div class="col">
					<form:label path="gram_B" ></form:label>
					<form:input type="text" class="form-control" placeholder="重量  g"
						path="gram_B"/>
				</div>
			</div>
			<br>
			<div class="form-group">
				<form:label for="exampleFormControlTextarea1" path="desc"
					style="font-size:20px;">介紹: </form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3" path="desc"></form:textarea>
			</div>
			<div class="form-group">
				<form:label for="exampleFormControlTextarea1" path="method"
					style="font-size:20px;">料理方法: </form:label>
				<form:textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3" path="method"></form:textarea>
			</div>

			<br>
			<div align="center">
				<img id="image" src="<c:url value='/getALLImage.controller?rec_id=${updateBean.rec_id}'/>" width="60%">
			</div>

			<br>
			<div class="custom-file">
				<form:input type="file" class="custom-file-input"
					id="validatedCustomFile" path="multipartFile"
					onchange="loadImageFile(event)" />
				<form:label class="custom-file-label" for="validatedCustomFile"
					path="multipartFile">Choose
					file</form:label>
				<div class="invalid-feedback">請上傳圖片</div>
			</div>
			<br>
<hr>
								<div style="text-align: center;">
									<button type="submit" class="btn btn-primary" >確認修改</button>
									<button type="submit" class="btn btn-primary">刪除</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal"
										onclick="javascript:location.href='<c:url value='/updatePage.controller'/>'">Close</button>
								</div>
		</fieldset>
		</form:form>
		
		<script type="text/javascript">
		$(function(){
			$("#delete").click(function(){
				alert('刪除成功');

				});
			});
		
		$(function(){
			$("#send").click(function(){
				alert('修改成功');

				});
			});
		
 	</script>
 		<script type="text/javascript">
		function loadImageFile(event) {
			var image = document.getElementById('image');
			image.src = URL.createObjectURL(event.target.files[0]);
		}
	</script>