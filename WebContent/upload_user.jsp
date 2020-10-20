<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
fieldset {
	position: absolute;
	width: 600px;
	border: 3px solid blue;
}

#btn {
	left: 0px;
}
</style>
</head>
<body>
	<fieldset>
		<legend>上傳食譜</legend>
		<form action=".\Recipe_Servlet" method="get">
			<div class="line">
				<label for="">名稱: <input type="text" name="recipe_name" /></label>

			</div>
			<br>
			<div class="">
				<label for="">種類: </label> <select name="cate">
					<option value="chicken">雞肉</option>
					<option value="pork">豬肉</option>
					<option value="beef">牛肉</option>
					<option value="vegan">蔬食</option>
				</select>
			</div>
			<br>
			<div id="line">
				<label for="">食材: <input type="text" name="ingredients" />
					份
				</label> <label for="">份量: <input type="text" name="gram" /> g
				</label>
			</div>
			<br>
			<div id="line">
				<label for="">食材: <input type="text" name="ingredients_B" />
					份
				</label> <label for="">份量: <input type="text" name="gram_B" /> g
				</label>
			</div>
			<br>

			<div id="line">
				<label for="">食材: <input type="text" name="ingredients_C" />
					份
				</label> <label for="">份量: <input type="text" name="gram_C" /> g
				</label>
			</div>
			<br>

			<div id="line">
				<label for="">食材: <input type="text" name="ingredients_D" />
					份
				</label> <label for="">份量: <input type="text" name="gram_D" /> g
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
				<label for="">介紹: </label>
				<textarea cols="40" rows="5" name="desc"></textarea>
			</div>
			<br>
			<div>
				<label for="">照片上傳: </label><input type="file" name="img" />
			</div>
			<br>
			<div style="text-align: center;">
				<label for=""><input type="submit" value="送出"></label> <label
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
        
</script>

</body>
</html>