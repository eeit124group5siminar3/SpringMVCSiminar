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
					<td style="border: 0px" align="right" colspan="10">
					<form action="activePreInsert.controller" method="post">
						<input name="apply" type="submit" value="申請">
					</form>
					</td>
					<td style="border: 0px" align="right" colspan="1">	
					<form action="activeHomeSelectAll.controller" method="get">
						<input name="selectAll" type="submit" value="查詢全部">
					</form>
					</td>			
				</tr>
				<tr>
					<th>圖片</th> 					
					<th>活動編號</th>
					<th>活動名稱</th>
					<th>活動地址</th>
					<th>連絡電話</th>
					<th>活動日期</th>
					<th>活動人數</th>
					<th>價格</th>
					<th>活動類型</th>
					<th>報名期間</th>
					<th>Action</th>
				</tr>
				<c:forEach var="Active" items="${listAct}">
					<tr>
						<td width='80'><img src="${pageContext.request.contextPath }/${Active.actImg}"/></td> 
						<td><c:out value="${Active.actId}" /></td>
						<td><c:out value="${Active.actName}" /></td>
						<td><c:out value="${Active.actAddr}" /></td>
						<td><c:out value="${Active.tel}" /></td>
						<td><c:out value="${Active.actDate}" /></td>
						<td><c:out value="${Active.expNum}" /></td>
						<td><c:out value="${Active.price}" /></td>
						<td><c:out value="${Active.actType}" /></td>
						<td><c:out value="${Active.dateSta}" /> 到 <c:out
								value="${Active.dateEnd}" /></td>
						<td>
							<form action="<c:url value='/acitveDelet.controller'/>" method="post">
								<input type="hidden" id="actId" name="actId" value="${Active.actId}">
								<input name="delete" type="submit" value="刪除">
							</form> 
							<form action="activePreUpdate.controller" method="post">
								<input type="hidden" id="actId" name="actId" value="${Active.actId}">
								<input name="update" type="submit" value="更新">
							</form>
							
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td style="border: 0px" colspan="5"></td>

					<td style="border: 0px" colspan="6">
						<form action="<c:url value='/activeSelectone.controller'/>" method="get">
							<label for="">活動名稱:</label>
							<input type="text" id="selectname" name="selectname">
							&nbsp;&nbsp;&nbsp; 
							<input name="selectone" type="submit" value="查詢單筆">
						</form>
					</td>
				</tr>
			</table>
		</div>

	
</body>
</html>