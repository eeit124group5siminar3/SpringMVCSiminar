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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="css/fontawesome-free/all.min.css">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="css/dist/adminlte.min.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">


<script type="text/javascript">
function backHome(){
	document.act.action=new ModelAndView("allActFarmer.do");
    document.act.submit();
}
</script>

<title>一日農夫活動修改</title>

</head>
<body class="goto-here">
<!-- --------Header&sideBar------------------------------------- -->
	<jsp:include page="/WEB-INF/pages/bar.jsp"/>

<!-------------------------內容區--------------------------------->
<section class="content-wrapper row justify-content-center" style="background-color: #FFFFFF">
<div style="border-style: solid; border-color:#82ae46;margin:20px;padding:20px; width:800px" >
<h3 align="center">一日農夫活動修改</h3><hr>
<form:form action="actFarmerUpdate.do" modelAttribute="afBean" method="POST" enctype="multipart/form-data" name="act">
<table align="center">
	<tr>
		<td><form:label path="actId" type="hidden">活動編號</form:label></td>
		<td><form:input path="actId" readonly="true"></form:input></td>
	</tr>
	<tr>
		<td><form:label path="actName">活動名稱<span style="color: red">*</span></form:label></td>
		<td><form:input path="actName" type="text"/></td>
	</tr>
	<tr>
		<td><form:label path="actType">活動類型</form:label></td>
		<td><form:select path="actType" type="text">		
				<form:option value="體驗類">體驗類</form:option>
				<form:option value="採收類">採收類</form:option>
				<form:option value="文藝類">文藝類</form:option>
				<form:option value="綜合類">綜合類</form:option>			
			</form:select>	
		</td>
	</tr>
	<tr>
		<td><form:label path="actAddr">活動地址<span style="color: red">*</span></form:label></td>
		<td><form:input path="actAddr" type="text"/></td>
	</tr>
	<tr>
		<td><form:label path="tel">連絡電話<span style="color: red">*</span></form:label></td>
		<td><form:input path="tel" type="text"/></td>
	</tr>
	<tr>
		<td><form:label path="actDateSta">活動開始日期/時間<span style="color: red">*</span></form:label></td>
		<td><form:input path="actDateSta" type="date" />
			<form:input path="actTimeSta"  type="time"></form:input>
		</td>
	</tr>
	<tr>
		<td><form:label path="actDateEnd">活動結束日期/時間<span style="color: red">*</span></form:label></td>
		<td><form:input path="actDateEnd" type="date" />
			<form:input path="actTimeEnd" type="time" ></form:input>
		</td>
	</tr>
	<tr>
		<td><form:label path="numLim">活動人數上限<span style="color: red">*</span></form:label></td>
		<td><form:input path="numLim" type="text"/></td>
	</tr>
	<tr>
		<td><form:label path="price">活動費用<span style="color: red">*</span></form:label></td>
		<td><form:input path="price" type="text" /></td>
	</tr>
	<tr>
		<td><form:label path="actDescri">活動描述</form:label></td>
<%-- 		<td><form:input path="actDescri" type="text" required="required"/></td> --%>
		<td colspan="2"><form:textarea cols="50" rows="6" path="actDescri"></form:textarea></td>

	</tr>
	<tr>
		<td><form:label path="actImg">活動海報<span style="color: red">*</span></form:label></td>				
		<td><img height='120' width='96' src="<c:url value='ActImageController?id=${afBean.actId}&type=ACTFARMER'/>"/>		
			<form:input path="multipartFile" type="file" class="InputClass" id="imgInp" accept="image/*"/>
			<img height='120' width='96' id="blah" src="#" alt="New image" />
		</td>
	</tr>
	<tr>
		<td><form:label path="signDateSta">報名開始日期/時間<span style="color: red">*</span></form:label></td>
		<td><form:input path="signDateSta" type="date" />
			<form:input path="signTimeSta" type="time" ></form:input>
		</td>
	</tr>
	<tr>
		<td><form:label path="signDateEnd">報名結束日期/時間<span style="color: red">*</span></form:label></td>
		<td><form:input path="signDateEnd" type="date" />
			<form:input path="signTimeEnd" type="time"></form:input>
		</td>
	</tr>
	<tr>
		<td><form:label path="sigStat">報名狀態</form:label></td>
		<td>
			<form:radiobutton path="sigStat" value="0" id="sigStat"/>未開放
			<form:radiobutton path="sigStat" value="1" id="sigStat"/>開放中
			<form:radiobutton path="sigStat" value="2" id="sigStat"/>已截止			
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<form:button class="btn btn-primary py-1 px-2" value="Send" >送出</form:button>&emsp;
			<form:button class="btn btn-primary py-1 px-2" value="back" onclick="backHome()">回管理頁面</form:button>
		</td>			
	</tr>

</table>
</form:form>
</div>
</section>
<!-- --------------footer----------------------------------------------------------- -->

<!-- 	<footer class="ftco-footer backstage-footer-ground"> -->
		<jsp:include page="/WEB-INF/pages/footer.jsp" />
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
	
// function backHome(){
// 	document.act.action="allActFarmer.do";
//     document.act.submit();
// }


</script>
</body>
</html>