<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動首頁</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
</style>
</head>
<body>
<c:set var="funcName" value="ACT" scope="session" />
<jsp:include page="/top.jsp" />
	<h1 align="center">一日農夫</h1>
		<div align="center">
			<table style="border: 8px #FFD382 groove;" border="1" cellpadding="5">
			<h2>活動列表</h2>
				<tr>
					<td style="border: 0px" align="right" colspan="11" class="container text-left">
				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">新增活動</a></td>
				</tr>
				<tr>
					<th>活動編號</th>
					<th>活動名稱</th>
					<th>活動類型</th>
					<th>活動地址</th>
					<th>連絡電話</th>
					<th>活動日期</th>
					<th>活動人數</th>
					<th>活動費用</th>
					<th>活動描述</th>
					<th>報名期間</th>
					<th>Actions</th>
				</tr>
				<c:forEach var="Active" items="${listAct}">
					<tr>
						<td><c:out value="${Active.actId}" /></td>
						<td><c:out value="${Active.actName}" /></td>
						<td><c:out value="${Active.actType }"/></td>
						<td><c:out value="${Active.actAddr}" /></td>
						<td><c:out value="${Active.tel}" /></td>
						<td><c:out value="${Active.actDate}" /></td>
						<td><c:out value="${Active.numLim}" /></td>
						<td><c:out value="${Active.price}" /></td>
						<td><c:out value="${Active.act_type}" /></td>
						<td><c:out value="${Active.signStaDate}" />到 <c:out
								value="${Active.signEndDate}" /></td>
						<td><a href="edit?id=<c:out value='${Active.act_id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${Active.act_id}' />">Delete</a></td>				
					</tr>
				</c:forEach>
			</table>
		</div>

	</form>
</body>
</html>