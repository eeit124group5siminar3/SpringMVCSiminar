<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>一日農夫活動申請</title>
</head>
<body>
<h1>一日農夫申請活動</h1>
<form:form action="" modelAttribute="farmerinsert" method="POST">
<table>
	<tr>
		<td><form:label path="actId">活動編號</form:label></td>
		<td><form:input path="actId"></form:input></td>
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
		<td><form:label path="actDateSta">活動開始日期:</form:label></td>
		<td><form:input path="actDateSta" type="date"/></td>
		<td><form:label path="actTimeSta">活動開始時間:</form:label></td>
		<td><form:input path="actTimeSta"></form:input></td>
	</tr>
	<tr>
		<td><form:label path="actDateEnd">活動結束日期:</form:label></td>
		<td><form:input path="actDateEnd" type="date"/></td>
		<td><form:label path="actTimeEnd">活動結束時間:</form:label></td>
		<td><form:input path="actTimeEnd"></form:input></td>
	</tr>
	<tr>
		<td><form:label path="numLim">活動人數上限:</form:label></td>
		<td><form:input path="numLim" type="text"/></td>
	</tr>
	<tr>
		<td><form:label path="price">活動費用:</form:label></td>
		<td><form:input path="price" type="text"/></td>
	</tr>
	<tr>
		<td><form:label path="actDescri">活動描述:</form:label></td>
<%-- 		<td><form:input path="actDescri" type="text" required="required"/></td> --%>
		<td><form:textarea cols="50" rows="6" path="actDescri"></form:textarea></td>
	</tr>
	<tr>
		<td><form:label path="actImg">活動海報:</form:label></td>
		<td><form:input path="actImg" type="file" required="required"/></td>
	</tr>
	<tr>
		<td><form:label path="signDateSta">報名開始日期:</form:label></td>
		<td><form:input path="signDateSta" type="date"/></td>
		<td><form:label path="signTimeSta">報名開始時間:</form:label></td>
		<td><form:input path="signTimeSta"></form:input></td>
	</tr>
	<tr>
		<td><form:label path="signDateEnd">報名結束日期:</form:label></td>
		<td><form:input path="signDateEnd" type="date"/></td>
		<td><form:label path="signTimeEnd">報名結束時間:</form:label></td>
		<td><form:input path="signTimeEnd"></form:input></td>
	</tr>
	<tr>
		<td><form:label path="sigStat">報名狀態:</form:label></td>
		<td>
			<form:radiobutton path="sigStat" value="未開放"/>未開放
			<form:radiobutton path="sigStat" value="開放中" CHECKED/>開放中
			<form:radiobutton path="sigStat" value="已截止"/>已截止			
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