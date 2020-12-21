<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html lang="zh">
<head>
<title>農郁-活動管理</title>
<meta charset="utf-8">

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


<!-- -------------------DataTable引入的CDN---------------------------------------------------------------------- -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"> -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">

<!-- -------------------Sweetalert引入的CDN---------------------------------------------------------- -->
<link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">


<script type="text/javascript">
	function backHome() {
		document.act.action = "maintainActFarmer.do";
		document.act.submit();
		//window.location.herf="${pageContext.request.contextPath}/allActFarmer.do";
	}
</script>
</head>

<body class="goto-here">

<!-- --------Header&sideBar------------------------------------- -->
	<jsp:include page="/WEB-INF/pages/bar.jsp"/>

	<c:if test="${!empty login_ok}">
		<jsp:include page="/WEB-INF/pages/Message.jsp" />
	</c:if>
<!-------------------------內容區--------------------------------->
<section class="content-wrapper justify-content-center" style="background-color: #FFFFFF">
<div class="col-12" style="width:98%; margin:20px" >
	<div class="form-inline row justify-content-center align-items-center">
		<h2 >活動列表</h2>&emsp;&emsp;&emsp;
	    <form action="<c:url value='/actFarmerPreInsert.do'/>" method="POST">
			<input name="apply" type="submit" value="申請活動" class="btn btn-primary">
		</form>
	 </div>	
	<table id="actFarmer" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
				<th>活動狀態</th>
				<th>活動編號</th>
				<th>活動名稱</th>
				<th>活動類型</th>
				<th>活動日期/時間</th>
				<th>人數上限</th>
				<th>價格</th>
				<th>報名日期/時間</th>
				<th>報名人數</th>
				<th>報名狀態</th>
				<th width="250">Action</th>
			</tr>
        </thead>
        <tbody>
        <c:forEach var="actFarmer" items="${collFarmer}">
			<tr>
				<td>${actFarmer.actStatusWord}</td>
				<td>${actFarmer.actId}</td>						
				<td><a href="<c:url value='/actFarmerPreRead.do?actId=${actFarmer.actId}'/>" >${actFarmer.actName}</a></td>
				<td>${actFarmer.actType}</td>
				<td>
					${actFarmer.actDateSta}&nbsp;${actFarmer.actTimeSta} 到
					${actFarmer.actDateEnd}&nbsp;${actFarmer.actTimeEnd}
				</td>
				<td>${actFarmer.numLim}</td>
				<td>${actFarmer.price}</td>
				<td>
					${actFarmer.signDateSta}&nbsp;${actFarmer.signTimeSta} 到
					${actFarmer.signDateEnd}&nbsp;${actFarmer.signTimeEnd}
				</td>
				<td>${actFarmer.actNumTol}</td>
				<td>${actFarmer.actSignStatusWord}</td>
				<td>
				<div class="form-inline justify-content-center">
				
					<form action="<c:url value='/actFarmerPreUpdate.do'/>" method="get">
						<input type="hidden" id="actId" name="actId" value="${actFarmer.actId}"> 
						<input class="btn btn-primary py-2 px-3 " name="update" type="submit" value="修改" >
					</form>
					&emsp;		
					<form action="<c:url value='/actFarmerDeleteF.do'/>" method="post">
						<input type="hidden" id="actId" name="actId" value="${actFarmer.actId}"> 
						<input class="btn btn-primary py-2 px-3 "name="delete" type="button" value="刪除" > 
					</form>
					&emsp;
					<form action="<c:url value='/actOrdList.do'/>" method="post">
						<input type="hidden" id="actId" name="actId" value="${actFarmer.actId}"> 
						<input class="btn btn-primary py-2 px-3 " name="select" type="submit" value="查詢訂單" > 
					</form>
				</div>
				</td>
			</tr>
			
		</c:forEach>
        </tbody>
<!--         <tfoot> -->
<!--         	<tr> -->
<!-- 				<td style="border: 0px" colspan="8"></td> -->
<!-- 				<td style="border: 0px" colspan="5"> -->
<%-- 					<form action="<c:url value='/SelectNameSeller.do'/>" method="POST"> --%>
<!-- 						<label for="">活動名稱:</label> <input type="text" id="selectname" name="selectname"> &nbsp;  -->
<!-- 						<input name="selectone" type="submit" value="查詢" class="btn btn-primary"> -->
<%-- 					</form> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!--         </tfoot> -->
    </table>
</div>
</div>
</section>
<!-------------------------/.內容區--------------------------------->

<!-- --------footer------------------------------------- -->
<!-- 	<footer class=" footer"> -->
<%-- 		<jsp:include page="/WEB-INF/pages/footer.jsp" /> --%>
<!-- 	</footer> -->

	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" /> 
 			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
 		</svg>
 	</div>


<!-- -------------------DataTable引入的js---------------------------------------------------------------------- -->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
	<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>

<!-- -------------------SweetAlert引入的js---------------------------------------------------------------------- -->	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>		
	

	
<!-- -------------------DataTable的javascript---------------------------------------------------------------------- -->
	<script>
	$(document).ready(function() {
	    $('#actFarmer').DataTable({
	    	language: {
	    	    "lengthMenu": "顯示 _MENU_ 筆資料",
	    	    "sProcessing": "處理中...",
	    	    "sZeroRecords": "没有匹配结果",
	    	    "sInfo": "目前有 _MAX_ 筆資料",
	    	    "sInfoEmpty": "目前共有 0 筆紀錄",
	    	    "sInfoFiltered": " ",
	    	    "sInfoPostFix": "",
	    	    "sSearch": "尋找:",
	    	    "sEmptyTable": "尚未有資料紀錄存在",
	    	    "oPaginate": {
	    	        "sFirst": "首頁",
	    	        "sPrevious": "上一頁",
	    	        "sNext": "下一頁",
	    	        "sLast": "末頁"
	    	    }
	    	}

		    });
	} );
	</script>
	
<!-- -------------------SweetAlert引入的javascript---------------------------------------------------------------------- -->	
	<script>
	//foreach 寫法 //按鈕形態要改button 不可以是sumbit
		$('input[name=delete]').click(function() {
		Swal.fire({
			  title: '確定要刪除此筆資料嗎?',
			  text: "提醒您，一旦刪除無法復原喔!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '確定刪除!',
			  cancelButtonText: '取消'
			}).then((result) => {
			  if (result.isConfirmed) {
			    $(this).parent().submit();
			  }
			})
	});
	</script>
</body>

</html>