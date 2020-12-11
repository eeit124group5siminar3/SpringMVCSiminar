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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<style>
.backstage-footer-ground {
	width: 100%;
	top: 800px;
	position: absolute;
	box-sizing: border-box;
	
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

input{

align-content: center;
border: #82ae46 2px solid;

}

</style>
<script type="text/javascript">
//============================返回頁面=====================================================//

function backHome(){
	document.act.action="maintainActFarmer.do";
    document.act.submit();
	//window.location.herf="${pageContext.request.contextPath}/allActFarmer.do";
}

//============================神奇按鈕=====================================================//

function fastinsert(){
	var actName="活動test";
	var actType="採收類";
	var actAddr="桃園市中壢區中大路300號";
	var tel="034221152"
	var actDateSta="2021-03-01";
	var actTimeSta="09:00"
	var actDateEnd="2021-03-01";
	var actTimeEnd="17:00";
	var numLim="30";
	var price="100";
	var actDescri="2019花在彰化活動將從2月5日到2月19日新春期間，在溪州公園盛大開幕，展出各式的彰化在地花卉，結合彰化縣燈會，邀請全國民眾利用春節期間攜家帶眷，前來彰化參觀走春，並到溪州公園白日看花、晚間遊園賞燈，期間還有各式豐富精采的表演，歡迎來彰化玩！";
	var signDateSta="2020-12-01";
	var signTimeSta="17:00";
	var signDateEnd="2021-02-01";
	var signTimeEnd="17:00";
	
		$("#actName").val(actName);
		$("#actType").val(actType);
		$("#actAddr").val(actAddr);
		$("#tel").val(tel);
		$("#actDateSta").val(actDateSta);
		$("#actTimeSta").val(actTimeSta);
		$("#actDateEnd").val(actDateEnd);
		$("#actTimeEnd").val(actTimeEnd);
		$("#numLim").val(numLim);
		$("#price").val(price);
		$("#actDescri").val(actDescri);
		$("#signDateSta").val(signDateSta);
		$("#signTimeSta").val(signTimeSta);
		$("#signDateEnd").val(signDateEnd);
		$("#signTimeEnd").val(signTimeEnd);		
}

//============================datetimepicker=====================================================//



</script>

<title>一日農夫活動申請</title>
</head>

<body class="goto-here">
<!-- --------Header------------------------------------- -->
	<jsp:include page="/WEB-INF/pages/header.jsp" />
<section class="ftco-section ftco-degree-bg">
<!-- --------管理左邊bar-------------------------------- -->
	<jsp:include page="/WEB-INF/pages/testLeft.jsp" />
	
<div>
<h3 align="center">一日農夫申請活動 <button class="btn btn-primary " value="fastinsert" onclick="fastinsert()">一鍵生成</button></h3>	
<form:form action="actFarmerInsert.do" modelAttribute="farmerinsert" method="POST" enctype="multipart/form-data" name="act"  >
<table align="center">
	<tr>
<%-- 		<td><form:label path="actId" type="hidden">活動編號</form:label></td> --%>
		<td><form:input path="actId" type="hidden" ></form:input></td>
	</tr>
	<tr>
		<td><form:label for="actName" path="actName">活動名稱<span style="color: red">*</span></form:label></td>
		<td><form:input path="actName" type="text" id="actName" /><span id="nameMsg"></span></td>
	</tr>
	<tr>
		<td><form:label path="actType">活動類型</form:label></td>
		<td><form:select path="actType" type="text" id="actType" >		
				<form:option value="體驗類">體驗類</form:option>
				<form:option value="採收類">採收類</form:option>
				<form:option value="文藝類">文藝類</form:option>
				<form:option value="綜合類">綜合類</form:option>			
			</form:select>	
		</td>
	</tr>
	<tr>
		<td><form:label path="actAddr">活動地址<span style="color: red">*</span></form:label></td>
		<td><form:input path="actAddr" type="text" id="actAddr"/><span id="addrMsg"></span></td>
	</tr>
	<tr>
		<td><form:label path="tel">連絡電話<span style="color: red">*</span></form:label></td>
		<td><form:input path="tel" type="text" id="tel" /><span id="telMsg"></span></td>
	</tr>
	<tr>
		<td><form:label path="actDateSta">活動開始日期<span style="color: red">*</span></form:label></td>
		<td><form:input path="actDateSta" type="date" id="actDateSta"/></td>
		<td><form:label path="actTimeSta">活動開始時間<span style="color: red">*</span></form:label></td>
		<td><form:input path="actTimeSta" type="time" id="actTimeSta"></form:input></td>
	</tr>
	<tr>
		<td><form:label path="actDateEnd">活動結束日期<span style="color: red">*</span></form:label></td>
		<td><form:input path="actDateEnd" type="date" id="actDateEnd" /></td>
		<td><form:label path="actTimeEnd">活動結束時間<span style="color: red">*</span></form:label></td>
		<td><form:input path="actTimeEnd" type="time" id="actTimeEnd" ></form:input></td>
	</tr>
	<tr>
		<td><form:label path="numLim">活動人數上限<span style="color: red">*</span></form:label></td>
		<td><form:input path="numLim" type="text" id="numLim" /><span id="numLimMsg"></span></td>
	</tr>
	<tr>
		<td><form:label path="price">活動費用<span style="color: red">*</span></form:label></td>
		<td><form:input path="price" type="text" id="price" /><span id="priceMsg"></span></td>
	</tr>
	<tr>
		<td><form:label path="actDescri">活動描述:</form:label></td>
<%-- 		<td><form:input path="actDescri" type="text" required="required"/></td> --%>
		<td colspan="2"><form:textarea cols="50" rows="6" path="actDescri" id="actDescri"></form:textarea><span id="descriMsg"></span></td>
	</tr>
	<tr>
		<td><form:label path="actImg">活動海報<span style="color: red">*</span></form:label></td>
		<td><form:input path="multipartFile" type="file" id="imgfile" /><span id="fileMsg"></span></td>
	</tr>
	<tr>
		<td><form:label path="signDateSta">報名開始日期<span style="color: red">*</span></form:label></td>
		<td><form:input path="signDateSta" type="date" id="signDateSta" /></td>
		<td><form:label path="signTimeSta">報名開始時間<span style="color: red">*</span></form:label></td>
		<td><form:input path="signTimeSta" type="time" id="signTimeSta" ></form:input></td>
	</tr>
	<tr>
		<td><form:label path="signDateEnd">報名結束日期<span style="color: red">*</span></form:label></td>
		<td><form:input path="signDateEnd" type="date" id="signDateEnd" /></td>
		<td><form:label path="signTimeEnd">報名結束時間<span style="color: red">*</span></form:label></td>
		<td><form:input path="signTimeEnd" type="time" id="signTimeEnd" ></form:input></td>
	</tr>
	<tr>
		<td><form:label path="sigStat" required="ture">報名狀態:</form:label></td>
		<td>
			<form:radiobutton path="sigStat" value="0" id="sigStat"/>未開放
			<form:radiobutton path="sigStat" value="1" id="sigStat"/>開放中
			<form:radiobutton path="sigStat" value="2" id="sigStat"/>已截止			
		</td>
	</tr>
	
	<tr>

		<td colspan="2" align="center"><form:button class="btn btn-primary py-2 px-3" value="Send" id="send">送出</form:button></td>	
		<td><form:button class="btn btn-primary py-2 px-3" value="back" onclick="backHome()">回管理頁面</form:button></td>		
	</tr>
</table>
</form:form>
</div>
<!-- --------------footer----------------------------------------------------------- -->
</section>
	
	<jsp:include page="/WEB-INF/pages/footer.jsp" />
	

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
	<script src= "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> 
</script> 
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
})

$(document).ready(function(){
	$("#send").click(function(){
		if($("#actName").val() == ""){
			 $("#nameMsg").append("請輸入活動名稱");
			 eval("document.form1['actName'].focus()");
		}else if($("#actName").val() !=""){
		 	$("#nameMsg").empty();

	 	
		}else if(("#actAddr").val() ==""){
		 	$("#addrMsg").append("請輸入活動地址");
		 	eval("document.form1['actAddr'].focus()");
		}else if($("#actAddr").val() !=""){
			 	$("#addrMsg").empty();

	 	
		}else if(("#tel").val() ==""){
			$("#telMsg").append("請輸入電話");
			eval("document.form1['tel'].focus()");
		}else if($("#tel").val() !=""){
		 	$("#telMsg").empty();

 			 
		}else if(("#numLim").val() ==""){
			$("#numLimMsg").append("請輸入活動人數上限");
			eval("document.form1['numLim'].focus()");
		}else if($("#numLim").val() !=""){
		 	$("#numLimMsg").empty();
			
			
		}else if(("#price").val() ==""){
			$("#priceMsg").append("請輸入活動費用");
			eval("document.act['price'].focus()");
		}else if($("#price").val() !=""){
		 	$("#priceMsg").empty();

			
		}else if(("#actDescri").val() ==""){
			$("#descriMsg").append("請輸入活動描述");
			eval("document.act['actDescri'].focus()");
		}else if($("#actDescri").val() !=""){
		 	$("#descriMsg").empty();
			
			
		}else if(("#file").val() ==""){
			$("#fileMsg").append("請上傳圖片");
			eval("document.act['file'].focus()");
		}else if($("#file").val() !=""){
		 	$("#fileMsg").empty();
		}else if(dateVaild());
		
		}else{
			document.act.submit();
		};
	})
})


</script>

	
</body>
</html>