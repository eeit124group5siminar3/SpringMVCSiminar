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
#btn {
	left: 0px;
}
#div1{

}
</style>
</head>
<body>
<jsp:include page="/top.jsp" />
	<fieldset>
		<legend>上傳食譜</legend>
		<form action="../Recipe_Servlet" method="post" runat="server"> 
<!-- 		enctype="multipart/form-data" >-->		
			<div class="line">
				<label for="">名稱: <input type="text" name="recipe_name" /></label>

			</div>
			<br>
			<div class="">
				<label for="">種類: </label> <select name="cate">
					<option value="雞肉">雞肉</option>
					<option value="豬肉">豬肉</option>
					<option value="牛肉">牛肉</option>
					<option value="蔬食">蔬食</option>
				</select>
			</div>
			<br>
			<div id="line">
				<label for="">食材: <input type="text" name="ingredients_A" /> 份 
				</label> 
				<label for="">份量: <input type="text" name="gram_A" /> g 
				</label>
			</div>
			<br>
			<div id="line">
				<label for="">食材: <input type="text" name="ingredients_B" />
					份
				</label> 
				<label for="">份量: <input type="text" name="gram_B" /> g
				</label>
			</div>
			<br>

			<div id="line">
				<label for="">食材: <input type="text" name="ingredients_C" />
					份
				</label> 
				<label for="">份量: <input type="text" name="gram_C" /> g
				</label>
			</div>
			<br>

			<div id="line">
				<label for="">食材: <input type="text" name="ingredients_D" />
					份
				</label> 
				<label for="">份量: <input type="text" name="gram_D" /> g
				</label>
			</div>
			<br>
			<div class="input-dyna-add"></div>
			<!-- 食材: <input type="text" class="add" name="ingredients" disabled/> 份
                份量: <input type="text" class="add" name="gram" disabled/> g
                <br> -->
			<button id="btn" onclick="addinput()">新增</button>

			<hr>
			<div class="">
				<label for="">方法: </label>
				<textarea cols="40" rows="5" name="method"></textarea>
			</div>
			<br>
			<div class="">
				<label for="">介紹: </label>
				<textarea cols="40" rows="5" name="desc"></textarea>
			</div>
			<br>
			<div>
<!-- 				<label for="">照片上傳: </label><input type="file" name="img" /> -->

  			<img id="blah" src="#" alt="your image" />
  			<br>
  			<input type='file' id="imgInp" name="img" />

			</div>
			<br>
			<div style="text-align: center;">
				<label for=""><input type="submit" name="submit" value="送出"></label> <label
					for=""><input type="reset" value="取消"></label>
			</div>
		</form>
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