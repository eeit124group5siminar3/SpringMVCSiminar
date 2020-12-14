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
	document.act.action="allActFarmer.do";
    document.act.submit();
	//window.location.herf="${pageContext.request.contextPath}/allActFarmer.do";
}

//============================神奇按鈕=====================================================//

function fastinsert(){
	var actName="捏陶藝術體驗";
	var actType="採收類";
	var actAddr="高雄市杉林區";
	var tel="07-6776463"
	var actDateSta="2020-12-26";
	var actTimeSta="8:00"
	var actDateEnd="2020-12-26";
	var actTimeEnd="16:30";
	var numLim="30";
	var price="1150";
	var actDescri="12月番茄成熟的季節來來往往的人呀!走在鄉間小路!旁邊就是滿滿的小番茄!不摘下來吃就是對不起自己啊!!!!這次除了摘番茄體驗之外呢!還要帶著大家一起體驗另一項的手工藝坊竹編!!用竹片編織成桌墊 自己做的絕對是最珍貴的!再動手做的過程中，也會讓自己更加的專注，以及放鬆！趕快來參加吧！！！";
	var signDateSta="2020-10-28";
	var signTimeSta="12:01";
	var signDateEnd="2021-12-02";
	var signTimeEnd="23:59";
	
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

function fastinsert2(){
	var actName="薑黃染DIY";
	var actType="綜合類";
	var actAddr="苗栗縣大湖鄉栗林村薑麻園9鄰13-3號";
	var tel="037-951870"
	var actDateSta="2021-01-25";
	var actTimeSta="08:00"
	var actDateEnd="2021-01-25";
	var actTimeEnd="17:00";
	var numLim="30";
	var price="250";
	var actDescri="薑麻園休閒農業區最大的特點，除了欣賞美麗的山色景觀之外，更適合全家同遊、摘採桃李，或是享用這裡才有的桃李大餐。有機會遇到薑麻園節慶時，還可參與趣味的草編DIY、搗麻糬DIY等，都是小朋友喜愛的活動呢！這裡結合各種客家傳統及現代文化的活動，都令人感到趣味、有活力；而充分利用「薑」所研發出來的特色產品，如薑母糖、薑餅、薑麻養身茶等，更為傳統農業創造新生機。也正因為這份農村特色的魅力，96年時還曾經獲選為「農情萬種」的十大經典農村；由此可知，薑麻園休閒農業區不只有完善的建設，更有客家傳統文化以及溫馨的人情味。入選十大經典農漁村的苗栗縣大湖鄉薑麻園休閒農業區，及三義鄉雙潭休閒農業區，擁有鄉土田園的自然風光，以及風土人文的藝術體驗，能滿足多種旅遊需求的兩處休閒農業區。薑麻園特產當然就是「薑」，可以到薑園裡去找看看，平日作菜時少不了的薑，到底是生長在哪裡？薑麻園的許多特產與特色小吃都與薑脫不了關係，從薑母茶、薑糖、老薑泡澡粉到加入地瓜改良口感的薑母軟糖都是不錯的伴手禮。還可以來一杯香醇好喝的薑汁撞奶，在冬天時喝一杯暖身俱有十足的驅寒效果，搭配幾片薑汁渣做成的薑餅，便是一份薑麻園特有的下午茶組合。沿著苗130線往西走，就到了三義鄉的雙潭休閒農業區，受到三義木雕工藝的影響，這裡有獨一無二的臉譜推廣協會，以彩筆代替雕刻刀彩繪木雕臉譜，是項老少咸宜的DIY 活動，另也可體驗拉坯製作陶藝用品的樂趣、有機植物的客家藍染。在薑麻園和雙潭休閒農業區裡還有更多的體驗等著您，歡迎親自來一趟，才能把真正的樂活帶回家。";
	var signDateSta="2020-12-01";
	var signTimeSta="17:00";
	var signDateEnd="2021-01-10";
	var signTimeEnd="23:59";
	
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

function fastinsert3(){
	var actName="梨之鄉休閒農業區";
	var actType="體驗類";
	var actAddr="臺中市東勢區中嵙里東崎路四段242號";
	var tel="04-25881829"
	var actDateSta="2021-03-01";
	var actTimeSta="09:00"
	var actDateEnd="2021-03-01";
	var actTimeEnd="17:00";
	var numLim="30";
	var price="500";
	var actDescri="梨之鄉休閒農業區位於東勢區中嵙里，是政府輔導的新興休閒農業區。由東勢區農會推動整合園區軟、硬體規劃，由在地人組合成立推廣在地農業、生態景觀及人文技藝，每年11月到隔年2月開始嫁接梨枝，到了初夏整棵樹上掛著黃澄澄水果，豐收景象相當壯觀，除此之外，梨之鄉休閒農業區也種植柑橘、柿子、梅子...等水果。梨之鄉休閒農業還有其他優質農業生產，蘭花、咖啡等也非常有名，以及在地人提供藝術工藝DIY體驗，如陶藝、木藝、漆藝、染布等，讓遊客可以親自體驗DIY的樂趣。";
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
<!-- --------管理左邊bar-------------------------------- -->
<div class="nav">
	<jsp:include page="/WEB-INF/pages/testLeft.jsp" />
</div>	
<section class="content-wrapper row justify-content-center">
<div>
<div class="form-inline" >
<h3>一日農夫申請活動</h3>&emsp;&emsp;&emsp;
  <button class="btn btn-primary " value="fastinsert" onclick="fastinsert()">活動1</button>&ensp;
  <button class="btn btn-primary " value="fastinsert" onclick="fastinsert2()">活動2</button>&ensp;
  <button class="btn btn-primary " value="fastinsert" onclick="fastinsert3()">活動3</button>&ensp;
</div>	
<form:form action="actFarmerInsert.do" modelAttribute="farmerinsert" method="POST" enctype="multipart/form-data" name="act"  >
<table class="justify-content-right">
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
		<td><form:input path="multipartFile" type="file" class="InputClass" id="imgInp" accept="image/*"/><span id="fileMsg"></span> 
<!-- 			<img height='230' width='230' id="blah" src="#" alt="上傳照片" />		 -->
		</td>
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
	<script src= "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> </script> 
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