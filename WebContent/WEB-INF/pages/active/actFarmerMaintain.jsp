<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1 no-cache不能存快取
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html lang="zh">
<head>
<title>農郁</title>
<meta charset="utf-8">
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
</head>
<body class="goto-here">

<!-- --------Header------------------------------------- -->
	<jsp:include page="/WEB-INF/pages/header.jsp" />
	
<!-- --------管理左邊bar-------------------------------- -->
	<jsp:include page="/WEB-INF/pages/testLeft.jsp" />

<!-- --------一日農夫管理 內容區------------------------ -->
<div align="center" id="backstage_page">

	<h1 align="center">活動管理-一日農夫</h1>
	<table align="center" style="border: 8px gray groove;" border="1" >
<!-- 		<h2>活動列表</h2> -->
			<tr>			
				<td style="border: 0px" align="right" colspan="10">
					<form action="<c:url value='/actFarmerPreInsert.do'/>" method="get">
						<input name="apply" type="submit" value="申請">
					</form>
				</td>
				<td style="border: 0px" align="right" colspan="2">	
					<form action="<c:url value='/maintainAct-Farmer.do'/>" method="get">
						<input name="selectAll" type="submit" value="查詢全部">
					</form>
				</td>			
			</tr>
			<tr>
				<th>活動編號</th>
				<th>活動名稱</th>
				<th>活動類型</th>				
				<th>活動日期/時間</th>
				<th>人數上限</th>
				<th>價格</th>
				<th>報名日期/時間</th>
				<th>報名人數</th>	
				<th>報名狀態</th>			
				<th colspan="3">Action</th>
			</tr>
			<c:forEach var="actFarmer" items="${collFarmer}">
					<tr>
						<td><c:out value="${actFarmer.actId}" /></td>
						<td><c:out value="${actFarmer.actName}" /></td>
						<td><c:out value="${actFarmer.actType}" /></td>						
						<td><c:out value="${actFarmer.actDateSta}" />&nbsp;
							<c:out value="${actFarmer.actTimeSta}" />
							到
							<c:out value="${actFarmer.actDateEnd}" />&nbsp;
							<c:out value="${actFarmer.actTimeEnd}" />							
						</td>
						<td><c:out value="${actFarmer.numLim}" /></td>
						<td><c:out value="${actFarmer.price}" /></td>
						<td><c:out value="${actFarmer.signDateSta}" />
							<c:out value="${actFarmer.signTimeSta}" />
							到
							<c:out value="${actFarmer.signDateEnd}" />
							<c:out value="${actFarmer.signTimeEnd}" />							
						</td>
						<td><c:out value="${actFarmer.actNum}" /></td>
						<td><c:out value="${actFarmer.sigStat}" /></td>						
						<td>
							<form action="<c:url value='/actFarmerPreRead.do'/>" method="get">
								<input type="hidden" id="actId" name="actId" value="${actFarmer.actId}">
								<input name="look" type="submit" value="檢視">
							</form>
						</td>
						<td>
							<form action="<c:url value='/actFarmerPreUpdate.do'/>" method="get">
								<input type="hidden" id="actId" name="actId" value="${actFarmer.actId}">
								<input name="update" type="submit" value="修改">
							</form> 
						</td>
						<td>
							<form action="<c:url value='/actFarmerDelete.do'/>" method="post">
								<input type="hidden" id="actId" name="actId" value="${actFarmer.actId}">
								<input name="delete" type="submit" value="刪除">								
							</form>	
						</td>
					</tr>
				</c:forEach>
				
<!-- 				ajax -->
<!-- 					<tr id="test_id"> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td>						 -->
									
<!-- 						<td>檢視</td> -->
<!-- 						<td>修改</td> -->
<!-- 						<td>刪除</td> -->
<!-- 					</tr> -->
<!-- 				ajax -->
				
				<tr>
					<td style="border: 0px" colspan="6"></td>
					<td style="border: 0px" colspan="6">
						<form action="<c:url value='/'/>" method="get">
							<label for="">活動名稱:</label>
							<input type="text" id="selectname" name="selectname">
							&nbsp;
							<input name="selectone" type="submit" value="查詢單筆">
						</form>
					</td>
				
			</table>

	</div>

<!-- -------------------------------- -->

<!-- --------footer------------------------------------- -->

	<footer class="ftco-footer backstage-footer-ground">
	<jsp:include page="/WEB-INF/pages/footer.jsp" />
	</footer>

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
	
	<script type="text/javascript">
	$.post({
        url:"${pageContext.request.contextPath}/test",
        data:{'param1':"param value"},
        success:function (data) {
            console.log(data);
            //let data = JSON.parse(data);
            let content = "";
//             content = 
//                 <td>\${data.actId}</td>
// 				<td>\${data.actName}</td>
// 				<td>\${data.actType}</td>						
							
// 				<td>檢視</td>
// 				<td>修改</td>
// 				<td>刪除</td>`;
// 				content = "<td>"+data.timeId+"</td><td>"+data.timeName+"</td>";
				content = `<td>\${data.timeId}</td><td>\+${data.timeName}</td>`;
				
			$("#test_id").html(content);
            
       }
   });
	</script>
</body>
</html>