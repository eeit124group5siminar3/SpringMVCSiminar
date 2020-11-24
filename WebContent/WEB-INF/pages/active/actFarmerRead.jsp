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

<style>
.backstage-footer-ground {
	width: 100%;
	top: 800px;
	position: absolute;
}

#project_backstage {
	width: 150px;
	position: absolute;
	font-weight: bold;
	top: 150px;
	left: 15px;
	color: white;
	display: block;
}

#backstage_page {
	position: absolute;
	top: 150px;
	left: 250px;
	right: 50px;
	text-align: center;
}
</style>

<script type="text/javascript">

</script>

<title>一日農夫活動檢視</title>
</head>
<body>
<!-- --------Header------------------------------------- -->
	<jsp:include page="/WEB-INF/pages/header.jsp" />
	
<!-- --------管理左邊bar-------------------------------- -->
	<jsp:include page="/WEB-INF/pages/testLeft.jsp" />

<!-- --------內容-------------------------------- -->

<!-- <h1 align="center">一日農夫活動檢視</h1> -->
<%-- <form:form action="actFarmerPreUpdate.do" modelAttribute="afBean" method="GET" enctype="multipart/form-data" name="act"> --%>
<!-- <table align="center"> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="actId" type="hidden">活動編號:</form:label></td> --%>
<%-- 		<td><form:label path="actId" >${afBean.actId}</form:label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="actName">活動名稱:</form:label></td> --%>
<%-- 		<td><form:label path="actName">${afBean.actName}</form:label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="actType">活動類型:</form:label></td> --%>
<%-- 		<td><form:label path="actType">${afBean.actType}</form:label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="actAddr">活動地址:</form:label></td> --%>
<%-- 		<td><form:label path="actAddr">${afBean.actAddr}</form:label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="tel">連絡電話:</form:label></td> --%>
<%-- 		<td><form:label path="tel">${afBean.tel}</form:label></td>		 --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="actDateSta">活動開始日期:</form:label></td> --%>
<%-- 		<td><form:label path="actDateSta">${afBean.actDateSta}</form:label></td> --%>
<%-- 		<td><form:label path="actTimeSta">活動開始時間:</form:label></td> --%>
<%-- 		<td><form:label path="actTimeSta">${afBean.actTimeSta}</form:label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="actDateEnd">活動結束日期:</form:label></td> --%>
<%-- 		<td><form:label path="actDateEnd">${afBean.actDateEnd}</form:label></td> --%>
<%-- 		<td><form:label path="actTimeEnd">活動結束時間:</form:label></td> --%>
<%-- 		<td><form:label path="actTimeEnd">${afBean.actTimeEnd}</form:label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="numLim">活動人數上限:</form:label></td> --%>
<%-- 		<td><form:label path="numLim">${afBean.numLim}</form:label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="price">活動費用:</form:label></td> --%>
<%-- 		<td><form:label path="price">${afBean.price}</form:label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="actDescri">活動描述:</form:label></td> --%>
 <%-- 		<td><form:input path="actDescri" type="text" required="required"/></td> --%> 
<%-- 		<td><form:label path="actDescri">${afBean.actDescri}</form:label></td> --%>

<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="actImg">活動海報:</form:label></td>				 --%>
<%-- 		<td><img height='120' width='96' src="<c:url value='ActImageController?id=${afBean.actId}&type=ACTFARMER'/>"/>		 --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="signDateSta">報名開始日期:</form:label></td> --%>
<%-- 		<td><form:label path="signDateSta">${afBean.signDateSta}</form:label></td> --%>
<%-- 		<td><form:label path="signTimeSta">報名開始時間:</form:label></td> --%>
<%-- 		<td><form:label path="signTimeSta">${afBean.signTimeSta}</form:label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="signDateEnd">報名結束日期:</form:label></td> --%>
<%-- 		<td><form:label path="signDateEnd">${afBean.signDateEnd}</form:label></td> --%>
<%-- 		<td><form:label path="signTimeEnd">報名結束時間:</form:label></td> --%>
<%-- 		<td><form:label path="signTimeEnd">${afBean.signTimeEnd}</form:label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td><form:label path="sigStat">報名狀態:</form:label></td> --%>
<%-- 		<td><form:label path="sigStat">${afBean.sigStat}</form:label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td colspan="3" align="center">	 -->
<%-- 		<input type="hidden" id="actId" name="actId" value="${afBean.actId}"/> --%>
<%-- 		<form:button value="edit" >修改</form:button> --%>
<!-- 		</td> -->
<%-- 		<td><form:button value="back" onclick="backHome()">回管理頁面</form:button></td>		 --%>
<!-- 	</tr> -->

<!-- </table> -->
<%-- </form:form> --%>

<div>	
<h3 align="center">一日農夫活動修改</h3>
<form:form action="actFarmerPreUpdate.do" modelAttribute="afBean" method="GET" enctype="multipart/form-data" name="act">
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
		<td><form:select path="actType" type="text" readonly="true">		
				<form:option value="體驗類">體驗類</form:option>
				<form:option value="採收類">採收類</form:option>
				<form:option value="文藝類">文藝類</form:option>
				<form:option value="綜合類">綜合類</form:option>			
			</form:select>	
		</td>
	</tr>
	<tr>
		<td><form:label path="actAddr">活動地址:</form:label></td>
		<td><form:input path="actAddr" type="text" readonly="true"/></td>
	</tr>
	<tr>
		<td><form:label path="tel">連絡電話:</form:label></td>
		<td><form:input path="tel" type="text" readonly="true"/></td>
	</tr>
	<tr>
		<td><form:label path="actDateSta">活動開始日期/時間:</form:label></td>
		<td><form:input path="actDateSta" type="date" readonly="true"/>
			<form:input path="actTimeSta"  type="time" readonly="true"/>
		</td>
	</tr>
	<tr>
		<td><form:label path="actDateEnd">活動結束日期/時間:</form:label></td>
		<td><form:input path="actDateEnd" type="date" readonly="true"/>
			<form:input path="actTimeEnd" type="time" readonly="true" />
		</td>
	</tr>
	<tr>
		<td><form:label path="numLim">活動人數上限:</form:label></td>
		<td><form:input path="numLim" type="text" readonly="true"/></td>
	</tr>
	<tr>
		<td><form:label path="price">活動費用:</form:label></td>
		<td><form:input path="price" type="text" readonly="true"/></td>
	</tr>
	<tr>
		<td><form:label path="actDescri">活動描述:</form:label></td>
<%-- 		<td><form:input path="actDescri" type="text" required="required"/></td> --%>
		<td colspan="2"><form:textarea cols="50" rows="6" path="actDescri" readonly="true"></form:textarea></td>

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
		<td><form:input path="signDateSta" type="date" readonly="true"/>
			<form:input path="signTimeSta" type="time" readonly="true" />
		</td>
	</tr>
	<tr>
		<td><form:label path="signDateEnd">報名結束日期/時間::</form:label></td>
		<td><form:input path="signDateEnd" type="date" readonly="true"/>
			<form:input path="signTimeEnd" type="time" readonly="true"/>
		</td>
	</tr>
	<tr>
		<td><form:label path="sigStat">報名狀態:</form:label></td>
		<td>
			<form:radiobutton path="sigStat" value="未開放" id="sigStat" readonly="true"/>未開放
			<form:radiobutton path="sigStat" value="開放中" id="sigStat" readonly="true"/>開放中
			<form:radiobutton path="sigStat" value="已截止" id="sigStat" readonly="true"/>已截止			
		</td>
	</tr>
	
	<tr>
		<td colspan="3" align="center">	
		<input type="hidden" id="actId" name="actId" value="${afBean.actId}"/>
		<form:button value="edit" >修改</form:button>
		</td>
		<td><form:button value="back" onclick="backHome()">回管理頁面</form:button></td>		
	</tr>

</table>
</form:form>
</div>


<!-- --------footer------------------------------------- -->

<!-- 	<footer class="ftco-footer backstage-footer-ground"> -->
<%-- 		<jsp:include page="/WEB-INF/pages/footer.jsp" /> --%>
<!-- 	</footer> -->
	
		<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" /> 
 			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
 		</svg> 
		</div>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

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
	document.act.action="maintainActFarmer.do";
    document.act.submit();
}

</script>
</body>
</html>