<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	function backHome() {
		document.act.action = "maintainActFarmer.do";
		document.act.submit();
		//window.location.herf="${pageContext.request.contextPath}/allActFarmer.do";
	}
</script>

<title>一日農夫活動申請</title>
</head>

<body class="goto-here">
	<!-- --------Header------------------------------------- -->
	<jsp:include page="/WEB-INF/pages/header.jsp" />

	<!-- --------管理左邊bar-------------------------------- -->
	<jsp:include page="/WEB-INF/pages/testLeft.jsp" />

	<!-- --------一日農夫管理 內容區------------------------ -->
<section class="ftco-section ftco-degree-bg">
	<div align="center" id="backstage_page">

		<div>
			<h1 align="center">活動管理-一日農夫</h1>
			<table align="center" style="border: 8px gray groove;" border="1"; >
				<!-- 		<h2>活動列表</h2> -->
				<tr>
					<td style="border: 0px" align="right" colspan="10">
						<form action="<c:url value='/actFarmerPreInsert.do'/>" method="get">
							<input name="apply" type="submit" value="申請">
						</form>
					</td>
					<td style="border: 0px" align="right" colspan="2">
						<form action="<c:url value='/maintainActFarmer.do'/>" method="get">
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
						<td><c:out value="${actFarmer.actDateSta}" />&nbsp; <c:out
								value="${actFarmer.actTimeSta}" /> 到 <c:out
								value="${actFarmer.actDateEnd}" />&nbsp; <c:out
								value="${actFarmer.actTimeEnd}" /></td>
						<td><c:out value="${actFarmer.numLim}" /></td>
						<td><c:out value="${actFarmer.price}" /></td>
						<td><c:out value="${actFarmer.signDateSta}" /> <c:out
								value="${actFarmer.signTimeSta}" /> 到 <c:out
								value="${actFarmer.signDateEnd}" /> <c:out
								value="${actFarmer.signTimeEnd}" /></td>
						<td><c:out value="${actFarmer.actNum}" /></td>
						<td><c:out value="${actFarmer.sigStat}" /></td>
						<td>
							<form action="<c:url value='/actFarmerPreRead.do'/>" method="get">
								<input type="hidden" id="actId" name="actId"
									value="${actFarmer.actId}"> <input name="look"
									type="submit" value="檢視">
							</form>
						</td>
						<td>
							<form action="<c:url value='/actFarmerPreUpdate.do'/>"
								method="get">
								<input type="hidden" id="actId" name="actId"
									value="${actFarmer.actId}"> <input name="update"
									type="submit" value="修改">
							</form>
						</td>
						<td>
							<form action="<c:url value='/actFarmerDelete.do'/>" method="post">
								<input type="hidden" id="actId" name="actId"
									value="${actFarmer.actId}"> <input name="delete"
									type="submit" value="刪除">
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
						<form action="<c:url value='/SelectNameSeller.do'/>" method="get">
							<label for="">活動名稱:</label> <input type="text" id="selectname"
								name="selectname"> &nbsp; <input name="selectone"
								type="submit" value="查詢">
						</form>
					</td>
			</table>
	</div>
	<!-- 以下為控制第一頁、前一頁、下一頁、最末頁 等超連結-->
	<form>
	<div id="bpaging">
	<table border="1" style="margin-right: 0px;">
	<tr align="center">
		<td width='80' height='20'><c:if test="${MaintainPageNo > 1}">
			<div id="blfirst"><a
				href="<c:url value='maintainActFarmer.do?MaintainPageNo=1' />"> 
				<img border='0' alt='第一頁' height='30' width='30'
				src='./images/first-icon.png' /> </a></div>
		</c:if></td>
		<td width='80'><c:if test="${MaintainPageNo > 1}">
			<div id="blprev"><a
				href="<c:url value='maintainActFarmer.do?MaintainPageNo=${MaintainPageNo-1}' />">
			<img border='0' alt='前一頁' height='30' width='30'
				src='./images/prev-icon.png' /></a></div>
		</c:if></td>
		<td width='76'>${MaintainPageNo} / ${totalPages}</td>
		<td width='80'><c:if test="${MaintainPageNo != totalPages}">
			<div id="blnext"><a
				href="<c:url value='maintainActFarmer.do?MaintainPageNo=${MaintainPageNo+1}' />">
			<img border='0' alt='最末頁' height='30' width='30'
				src='./images/next-icon.png'/> </a></div>
		</c:if></td>
		<td width='80'><c:if test="${MaintainPageNo != totalPages}">
			<div id="bllast"><a
				href="<c:url value='maintainActFarmer.do?MaintainPageNo=${totalPages}' />">
			<img border='0' alt='最末頁' height='30' width='30'
				src='./images/last-icon.png' /> </a></div>
		</c:if></td>
	</tr>
</table>
</div>
</form>
</div>
</section>
			<!-- --------footer------------------------------------- -->
			<footer class="ftco-footer backstage-footer-ground">
				<jsp:include page="/WEB-INF/pages/footer.jsp" />
			</footer>

			<div id="ftco-loader" class="show fullscreen">
				<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" /> 
 			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
 				</svg>
 				</div>
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
				content = `<td>\${data.timeId}</td><td>\${data.timeName}</td>`;
				
			$("#test_id").html(content);
            
       }
   });
	</script>
</body>
</html>