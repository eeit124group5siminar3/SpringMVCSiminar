<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<!-- <script type="text/javascript"> -->


<!-- </script> -->
<title>一日農夫活動申請</title>
<meta charset="UTF-8">

</head>
<body class="goto-here">

<h1 align="center">一日農夫申請活動</h1>
<form:form action="actFarmerInsert" modelAttribute="farmerinsert" method="POST" enctype="multipart/form-data">
<table align="center">
	<tr>
<%-- 		<td><form:label path="actId" type="hidden">活動編號</form:label></td> --%>
		<td><form:input path="actId" type="hidden" ></form:input></td>
	</tr>
	<tr>
		<td><form:label path="actName">活動名稱</form:label></td>
		<td><form:input path="actName" type="text" id=""/></td>
	</tr>
	<tr>
		<td><form:label path="actType">活動類型:</form:label></td>
		<td><form:select path="actType" type="text" id="">		
				<form:option value="體驗類">體驗類</form:option>
				<form:option value="採收類">採收類</form:option>
				<form:option value="文藝類">文藝類</form:option>
				<form:option value="綜合類">綜合類</form:option>			
			</form:select>	
		</td>
	</tr>
	<tr>
		<td><form:label path="actAddr">活動地址:</form:label></td>
		<td><form:input path="actAddr" type="text" id=""/></td>
	</tr>
	<tr>
		<td><form:label path="tel">連絡電話:</form:label></td>
		<td><form:input path="tel" type="text" id=""/></td>
	</tr>
	<tr>
		<td><form:label path="actDateSta">活動開始日期:</form:label></td>
		<td><form:input path="actDateSta" type="date" id=""/></td>
		<td><form:label path="actTimeSta">活動開始時間:</form:label></td>
		<td><form:input path="actTimeSta"  type="time" id=""></form:input></td>
	</tr>
	<tr>
		<td><form:label path="actDateEnd">活動結束日期:</form:label></td>
		<td><form:input path="actDateEnd" type="date" id="actDateEnd"/></td>
		<td><form:label path="actTimeEnd">活動結束時間:</form:label></td>
		<td><form:input path="actTimeEnd" type="time" id="actTimeEnd"></form:input></td>
	</tr>
	<tr>
		<td><form:label path="numLim">活動人數上限:</form:label></td>
		<td><form:input path="numLim" type="text" id="numLim"/></td>
	</tr>
	<tr>
		<td><form:label path="price">活動費用:</form:label></td>
		<td><form:input path="price" type="text" id="price"/></td>
	</tr>
	<tr>
		<td><form:label path="actDescri">活動描述:</form:label></td>
<%-- 		<td><form:input path="actDescri" type="text" required="required"/></td> --%>
		<td><form:textarea cols="50" rows="6" path="actDescri" id="actDescri"></form:textarea></td>
	</tr>
	<tr>
		<td><form:label path="actImg">活動海報:</form:label></td>
		<td><form:input path="multipartFile" type="file" /></td>
	</tr>
	<tr>
		<td><form:label path="signDateSta">報名開始日期:</form:label></td>
		<td><form:input path="signDateSta" type="date" id="signDateSta"/></td>
		<td><form:label path="signTimeSta">報名開始時間:</form:label></td>
		<td><form:input path="signTimeSta" type="time" id="signTimeSta"></form:input></td>
	</tr>
	<tr>
		<td><form:label path="signDateEnd">報名結束日期:</form:label></td>
		<td><form:input path="signDateEnd" type="date" id="signDateEnd"/></td>
		<td><form:label path="signTimeEnd">報名結束時間:</form:label></td>
		<td><form:input path="signTimeEnd"  type="time" id="signTimeEnd"></form:input></td>
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
		<td><form:button value="Send">送出</form:button></td>
		<td><form:button value="back">回首頁</form:button></td>
	</tr>

</table>
</form:form>
	
</body>
</html>