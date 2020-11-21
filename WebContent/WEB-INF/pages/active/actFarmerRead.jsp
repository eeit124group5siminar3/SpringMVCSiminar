<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<script language="javascript"> 
//直接等於值 
// document.getElementById("actType").value="<c:out value='${afBean.actType}'/>"; 
// document.getElementById("sigStat").value="<c:out value='${afBean.sigStat}'/>"; 
</script> 
<meta charset="UTF-8">
<title>一日農夫活動檢視</title>
</head>
<body>
<h1 align="center">一日農夫活動檢視</h1>
<form:form action="actFarmerPreUpdate.do" modelAttribute="afBean" method="GET" enctype="multipart/form-data" name="act">
<table align="center">
	<tr>
		<td><form:label path="actId" type="hidden">活動編號:</form:label></td>
		<td><form:label path="actId" >${afBean.actId}</form:label></td>
	</tr>
	<tr>
		<td><form:label path="actName">活動名稱:</form:label></td>
		<td><form:label path="actName">${afBean.actName}</form:label></td>
	</tr>
	<tr>
		<td><form:label path="actType">活動類型:</form:label></td>
		<td><form:label path="actType">${afBean.actType}</form:label></td>
	</tr>
	<tr>
		<td><form:label path="actAddr">活動地址:</form:label></td>
		<td><form:label path="actAddr">${afBean.actAddr}</form:label></td>
	</tr>
	<tr>
		<td><form:label path="tel">連絡電話:</form:label></td>
		<td><form:label path="tel">${afBean.tel}</form:label></td>		
	</tr>
	<tr>
		<td><form:label path="actDateSta">活動開始日期:</form:label></td>
		<td><form:label path="actDateSta">${afBean.actDateSta}</form:label></td>
		<td><form:label path="actTimeSta">活動開始時間:</form:label></td>
		<td><form:label path="actTimeSta">${afBean.actTimeSta}</form:label></td>
	</tr>
	<tr>
		<td><form:label path="actDateEnd">活動結束日期:</form:label></td>
		<td><form:label path="actDateEnd">${afBean.actDateEnd}</form:label></td>
		<td><form:label path="actTimeEnd">活動結束時間:</form:label></td>
		<td><form:label path="actTimeEnd">${afBean.actTimeEnd}</form:label></td>
	</tr>
	<tr>
		<td><form:label path="numLim">活動人數上限:</form:label></td>
		<td><form:label path="numLim">${afBean.numLim}</form:label></td>
	</tr>
	<tr>
		<td><form:label path="price">活動費用:</form:label></td>
		<td><form:label path="price">${afBean.price}</form:label></td>
	</tr>
	<tr>
		<td><form:label path="actDescri">活動描述:</form:label></td>
<%-- 		<td><form:input path="actDescri" type="text" required="required"/></td> --%>
		<td><form:label path="actDescri">${afBean.actDescri}</form:label></td>

	</tr>
	<tr>
		<td><form:label path="actImg">活動海報:</form:label></td>				
		<td><img height='120' width='96' src="<c:url value='ActImageController?id=${afBean.actId}&type=ACTFARMER'/>"/>		
	</tr>
	<tr>
		<td><form:label path="signDateSta">報名開始日期:</form:label></td>
		<td><form:label path="signDateSta">${afBean.signDateSta}</form:label></td>
		<td><form:label path="signTimeSta">報名開始時間:</form:label></td>
		<td><form:label path="signTimeSta">${afBean.signTimeSta}</form:label></td>
	</tr>
	<tr>
		<td><form:label path="signDateEnd">報名結束日期:</form:label></td>
		<td><form:label path="signDateEnd">${afBean.signDateEnd}</form:label></td>
		<td><form:label path="signTimeEnd">報名結束時間:</form:label></td>
		<td><form:label path="signTimeEnd">${afBean.signTimeEnd}</form:label></td>
	</tr>
	<tr>
		<td><form:label path="sigStat">報名狀態:</form:label></td>
		<td><form:label path="sigStat">${afBean.sigStat}</form:label></td>
	</tr>
	<tr>
		<td colspan="3" align="center">	
		<input type="hidden" id="actId" name="actId" value="${afBean.actId}"/>
		<form:button value="edit" >修改</form:button>
		</td>
		<td><form:button value="back" onclick="backHome()">回首頁</form:button></td>		
	</tr>

</table>
</form:form>
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