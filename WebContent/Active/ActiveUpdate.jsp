<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新表單</title>
<script language="javascript"> 
//直接等於值 
document.getElementById("actType").value="<c:out value='${Active.act_type}'/>"; 
</script> 
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
<h1 align="center">活動修改:一日農夫</h1>
	<form action="./ActiveUpdateServlet" method="post">
		<fieldset>
			<legend>活動基本資料</legend>
			<c:forEach var="Active" items="${list}">
			<div>
				<label for="">編號:${Active.act_id}</label>
				<input type=hidden name="actid" value="${Active.act_id}"/>
			</div>
			<div>
				<label for="">活動名稱:</label>
				<input type="text" id="actName" name="actName" value="${Active.act_name}" >
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
				<input type="text" id="actAddr" name="actAddr" value="${Active.act_addr}" >
			</div>
			<div>
				<label for="">連絡電話:</label> 
				<input type="text" id="tel" name="tel" value="${Active.tel}">
			</div>
			<div>
				<label for="">活動日期:</label> 
				<input type="date" id="actDate" name="actDate" value="${Active.act_date}">
			</div>
			<div>
				<label for="">報名起始日:</label> 
				<input type="date" id="dateSta" name="dateSta" value="${Active.date_sta}"> 
				<label for="">報名結束日:</label> 
				<input type="date" id="dateEnd" name="dateEnd" value="${Active.date_end}">
			</div>
			<div>
				<label for="">活動人數:</label> 
				<input type="text" id="expNum" name="expNum" value="${Active.exp_num}">
			</div>
			<div>
				<label for="">活動費用:</label> 
				<input type="text" id="price" name="price" value="${Active.price}">
			</div>
			<div>
				<label for="">活動描述:</label> <br>
				<textarea cols="50" rows="6" id="actDescri" name="actDescri"></textarea>
			</div>
			<div>
				<label for="">活動海報:</label> <br> 
				<input type="file" id="actImg" name="actImg">
			</div>
			<div>
				<label for="">活動影片:</label> <br> 
				<input type="file" id="actVideo" name="actVideo">
			</div>
		  </c:forEach>
			<input name="update" type="submit" value="更新" > 
			<input name="acthome" type="submit" value="活動首頁">
			
		</fieldset>
	</form>
</body>
</html>