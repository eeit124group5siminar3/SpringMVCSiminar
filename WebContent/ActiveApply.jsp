<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>活動申請</title>
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
		<h1 align="center">活動申請:一日農夫</h1>
		<form action="insert" method="post">
			<div>
			<fieldset>
				<legend>活動基本資料</legend>
				<div>
					<label for="">編號: 待會告訴你</label>
				</div>
				<div>
					<label for="">活動名稱:</label> <input type="text" id="actName"
						name="actName">
				</div>
				<div>
					<label for="">活動類型:</label> 
					<select name="actType">
						<option value="體驗類">體驗類</option>
						<option value="採收類">採收類</option>
						<option value="文藝類">文藝類</option>
						<option value="綜合類">綜合類</option>
					</select>
				</div>
				<div>
					<label for="">活動地址:</label> 
					<input type="text" id="actAddr" name="actAddr">
				</div>
				<div>
					<label for="">連絡電話:</label> 
					<input type="text" id="tel" name="tel">
				</div>
				<div>
					<label for="">活動日期:</label> 
					<input type="date" id="actDate" name="actDate">
				</div>
				<div>
					<label for="">報名起始日:</label> 
					<input type="date" id="dateSta" name="dateSta"> 
					<label for="">報名結束日:</label> 
					<input type="date" id="dateEnd" name="dateEnd"/>
				</div>
				<div>
					<label for="">活動人數:</label> <input type="text" id="expNum" name="expNum">
				</div>
				<div>
					<label for="">活動費用:</label> <input type="text" id="price" name="price">
				</div>
				<div>
					<label for="">活動描述:</label> <br>
					<textarea cols="50" rows="6" id="actDescri" name="actDescri"></textarea>
				</div>
				<div>
					<label for="">活動海報:</label> <br> 
					<input type="file" id="actImg" name="actImg">
				</div>
				<br>
				<input name="apply" type="submit" value="申請"> 
				<input name="acthome" type="submit" value="活動首頁">
			</fieldset>
			</div>
		</form>
	
	
	</body>
</html>