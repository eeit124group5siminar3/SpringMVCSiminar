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

fieldset {
	width: 500px;
	margin: 0px auto;
	border :8px #FFD382 groove;
	border-radius: 15px;
}
body {  
	background:#EBFFEB;
	}
#btn {
	left: 0px;
}
</style>
</head>
<body>
<jsp:include page="/top.jsp" />
	<fieldset>
		<legend>上傳食譜</legend>
<%-- 		<form:form action='<c:url value="/uploadSubmit.controller"/>' method="post" modelAttribute="details" runat="server">  --%>
			<form:form action="uploadSubmit.controller" method="post" modelAttribute="details" runat="server">
		
		
			<div class="line">
				<form:label path="name">名稱: </form:label>
				<form:input path="name"/>

			</div>
			<br>
			<div>
 				<form:label path="cate">種類: </form:label> <select name="cate">
					<option value="雞肉">雞肉</option>
					<option value="豬肉">豬肉</option>
					<option value="牛肉">牛肉</option>
					<option value="蔬食">蔬食</option>
				</select>
			</div>
			<br>
			<div id="line">
				<form:label path="ingredients_A">食材: </form:label> 
				<form:input path="ingredients_A" /> 份 
				<form:label path="gram_A">份量: </form:label>
				<form:input path="gram_A" /> g
			</div>
			<br>
<!-- 			<div id="line"> -->
<%-- 				<form:label path="ingredients_B">食材: <form:input type="text" path="ingredients_B" /> --%>
<!-- 					份 -->
<%-- 				</form:label>  --%>
<%-- 				<form:label path="gram_B">份量: <form:input type="text" path="gram_B" /> g --%>
<%-- 				</form:label> --%>
<!-- 			</div> -->
<!-- 			<br> -->

<!-- 			<div id="line"> -->
<%-- 				<form:label path="ingredients_C">食材: <form:input type="text" path="ingredients_C" /> --%>
<!-- 					份 -->
<%-- 				</form:label>  --%>
<%-- 				<form:label path="gram_C">份量: <form:input type="text" path="gram_C" /> g --%>
<%-- 				</form:label> --%>
<!-- 			</div> -->
<!-- 			<br> -->

<!-- 			<div id="line"> -->
<%-- 				<form:label path="ingredients_D">食材: <form:input type="text" path="ingredients_D" /> --%>
<!-- 					份 -->
<%-- 				</form:label>  --%>
<%-- 				<form:label path="gram_D">份量: <form:input type="text" path="gram_D" /> g --%>
<%-- 				</form:label> --%>
<!-- 			</div> -->
<!-- 			<br> -->
<!-- 			<div class="input-dyna-add"></div> -->
<%-- 			 食材: <form:input  class="add" path="ingredients" disabled /> 份 --%>
<%--                 	 份量: <form:input  class="add" path="gram"disabled /> g  --%>
<!--                 <br> -->
<%-- 			<form:button id="btn" onclick="addinput()" value=>新增</form:button> --%>

<!-- 			<hr> -->

			<div>
				<form:label path="desc">介紹: </form:label>
				<br>
				<textarea cols="40" rows="5" path="desc"></textarea>
			</div>
			<br>
			<div>
				<form:label path="method">料理方法: </form:label>
				<br>
				<textarea cols="40" rows="5" path="method"></textarea>
			</div>
			<br>
			<div>
				<%--  				<form:label path="">照片上傳: </form:label><input type="file" name="img" />  --%>

				<!--   			<img id="blah" src="#" alt="your image" /> -->
				<!--   			<br> -->
				<%--   			<form:input type='file' id="imgInp" path="img" /> --%>

				<!-- 			</div> -->
				<!-- 			<br> -->
				<div style="text-align: center;">
					<form:button value="submit">送出</form:button>
					<%-- 					<form:button onclick="javascript:location.href='recipe/recipe_workpage.jsp'" value="reset">回首頁</form:button> --%>
					<label> <%--  					<a href="<c:url value='./index.jsp' />">回首頁</a> --%>
						<a href="<c:url value='./recipe_workpage.jsp' />">回首頁</a> 
						<%-- <a href="<c:url value='./recipe/recipe_workpage.jsp' />">回首頁</a> --%>
					</label>

				</div>
		</form:form>
	</fieldset>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
	<script>
        function addinput(){
            // $("#btn").click(function(){
            //     $(".add").attr('disabled',true);
            // });
            var input = $(" <div class='input-group form-inline'>食材: <input type='text' name='ingredients' /> 份 份量: <input type='text' name='gram' /> g</div>'");
            $(".input-dyna-add").append(input);
        }
        
        function readURL(input) {
        	  if (input.files && input.files[0]) {
        	    var reader = new FileReader();
        	    
        	    reader.onload = function(e) {
        	      $('#blah').attr('src', e.target.result);
        	    }
        	    
        	    reader.readAsDataURL(input.files[0]); // convert to base64 string
        	  }
        	}

        	$("#imgInp").change(function() {
        	  readURL(this);
        	});
        	
        	$("#blah").width(300);
        
</script>

</body>
</html>