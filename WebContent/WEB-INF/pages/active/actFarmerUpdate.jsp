<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">

<title>一日農夫活動修改</title>
</head>
<body>

<!-- --------Header------------------------------------- -->
	<jsp:include page="/WEB-INF/pages/header.jsp" />
<!-- --------管理左邊bar-------------------------------- -->
	<jsp:include page="/WEB-INF/pages/testLeft.jsp" />
	
<h1 align="center">一日農夫活動修改</h1>
<form:form action="actFarmerUpdate.do" modelAttribute="afBean" method="POST" enctype="multipart/form-data" name="act">
<table align="center">
	<tr>
		<td><form:label path="actId" type="hidden">活動編號</form:label></td>
		<td><form:input path="actId" readonly="true"></form:input></td>
	</tr>
	<tr>
		<td><form:label path="actName">活動名稱</form:label></td>
		<td><form:input path="actName" type="text"/></td>
	</tr>
	<tr>
		<td><form:label path="actType">活動類型:</form:label></td>
		<td><form:select path="actType" type="text">		
				<form:option value="體驗類">體驗類</form:option>
				<form:option value="採收類">採收類</form:option>
				<form:option value="文藝類">文藝類</form:option>
				<form:option value="綜合類">綜合類</form:option>			
			</form:select>	
		</td>
	</tr>
	<tr>
		<td><form:label path="actAddr">活動地址:</form:label></td>
		<td><form:input path="actAddr" type="text"/></td>
	</tr>
	<tr>
		<td><form:label path="tel">連絡電話:</form:label></td>
		<td><form:input path="tel" type="text"/></td>
	</tr>
	<tr>
		<td><form:label path="actDateSta">活動開始日期/時間:</form:label></td>
		<td><form:input path="actDateSta" type="date" />
			<form:input path="actTimeSta"  type="time"></form:input>
		</td>
	</tr>
	<tr>
		<td><form:label path="actDateEnd">活動結束日期/時間:</form:label></td>
		<td><form:input path="actDateEnd" type="date" />
			<form:input path="actTimeEnd" type="time" ></form:input>
		</td>
	</tr>
	<tr>
		<td><form:label path="numLim">活動人數上限:</form:label></td>
		<td><form:input path="numLim" type="text"/></td>
	</tr>
	<tr>
		<td><form:label path="price">活動費用:</form:label></td>
		<td><form:input path="price" type="text" /></td>
	</tr>
	<tr>
		<td><form:label path="actDescri">活動描述:</form:label></td>
<%-- 		<td><form:input path="actDescri" type="text" required="required"/></td> --%>
		<td colspan="2"><form:textarea cols="50" rows="6" path="actDescri"></form:textarea></td>

	</tr>
	<tr>
		<td><form:label path="actImg">活動海報:</form:label></td>				
		<td><img height='120' width='96' src="<c:url value='ActImageController?id=${afBean.actId}&type=ACTFARMER'/>"/>		
			<form:input path="multipartFile" type="file" class="InputClass" id="imgInp" accept="image/*"/>
			<img height='120' width='96' id="blah" src="#" alt="New image" />
		</td>
	</tr>
	<tr>
		<td><form:label path="signDateSta">報名開始日期/時間:</form:label></td>
		<td><form:input path="signDateSta" type="date" />
			<form:input path="signTimeSta" type="time" ></form:input>
		</td>
	</tr>
	<tr>
		<td><form:label path="signDateEnd">報名結束日期/時間::</form:label></td>
		<td><form:input path="signDateEnd" type="date" />
			<form:input path="signTimeEnd" type="time"></form:input>
		</td>
	</tr>
	<tr>
		<td><form:label path="sigStat">報名狀態:</form:label></td>
		<td>
			<form:radiobutton path="sigStat" value="未開放" id="sigStat"/>未開放
			<form:radiobutton path="sigStat" value="開放中" id="sigStat"/>開放中
			<form:radiobutton path="sigStat" value="已截止" id="sigStat"/>已截止			
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><form:button value="Send" >送出</form:button>
			<form:button value="back" onclick="backHome()">回管理頁面</form:button>
		</td>			
	</tr>

</table>
</form:form>

	<footer class="ftco-footer backstage-footer-ground">
		<jsp:include page="/WEB-INF/pages/footer.jsp" />
	</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script>
function readURL(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();

		reader.onload = function(e){
			$('#blah').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
$("#imgInp").change(function(){
		readURL(this);
	});
	
function backHome(){
	document.act.action="allActFarmer.do";
    document.act.submit();
}


</script>
</body>
</html>