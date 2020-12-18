<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1 no-cache不能存快取
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html lang="zh">
<head>
<title>農郁-活動管理</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://bootstrap.hexschool.com/docs/4.2/dist/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<!-- -------------------DataTable引入的CDN---------------------------------------------------------------------- -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">

<!-- -------------------Sweetalert引入的CDN---------------------------------------------------------------------- -->
<link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
<style>
  .billboard{

    margin-top: 10%;
    margin-left: 10%;
    margin-right: 10%;
  }

  table,th,td{
    text-align: center;

    border-collapse:collapse;
    border: 1px solid black;
  }
  .login-form {
	width: 400px;
	height: 600px;
	position: relative;
	top: 150px;
	left: 60%;
	/* right:50px; */
}

.login-form-fieldset {
	width: 500px;
	margin: 10px;
	padding: 50px;
	border: 1px double;
}

.btn-primary{
	background-color: #b8cdd4;
	border-color:#b8cdd4;
}

a{
	color:#6970db;
}

</style>

</head>


<body class="goto-here">

	<jsp:include page="/WEB-INF/pages/testAdminH.jsp" />
	
	<!-------------------------內容區--------------------------------->
<div style="width:80%; margin:0 auto" >
<h3 align="center">報名管理</h3>

	<table id="actord" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>訂單編號</th>            
                <th>訂購人</th>
                <th>報名活動</th>
                <th>報名人數</th>
                <th>總金額</th>
                <th>訂單狀態</th>
                <th>付款方式</th>
                <th>訂單成立時間</th>
                <th>ACTION</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="actord" items="${collActOrds}">
            <tr>
                <td><a href="<c:url value='/actAdminSignR.do?actOrdId=${actord.actOrdId}'/>" >${actord.actOrdId}</a></td>
                <td>${actord.memName}</td>
                <td>${actord.actFarmer.actName}</td>
                <td>${actord.ordActNum}</td>
                <td>${actord.totalPrice}</td>
                <td>${actord.actOrdStatusWord}</td>
                <td>${actord.actPayWayStatusWord}</td>
                <td>${actord.ordTime}</td>
                <td>
                <div class="form-inline justify-content-center">
                	<form action="<c:url value='/actAdminPreSignU.do'/>" method="POST">
						<input type="hidden" id="actOrdId" name="actOrdId" value="${actord.actOrdId}"> 
						<input class="btn btn-primary py-1 px-2"name="update" type="submit" value="修改" >
					</form>
					<br><br>
					<form action="<c:url value='/actAdminSignD.do'/>" method="POST">
						<input type="hidden" id="actOrdId" name="actOrdId" value="${actord.actOrdId}"> 
						<input class="btn btn-primary py-1 px-2 " id="delete" name="delete" type="button" value="刪除" >
					</form>
				</div>
                </td>
            </tr>
		</c:forEach>
        </tbody>
<!--         <tfoot> -->
<!--             <tr> -->
<!--                 <th>活動狀態</th>             -->
<!--                 <th>活動編號</th> -->
<!--                 <th>活動名稱</th> -->
<!--                 <th>活動時間</th> -->
<!--                 <th>會員編號</th> -->
<!--                 <th>ACTION</th> -->
<!--             </tr> -->
<!--         </tfoot> -->
    </table>
</div>

<!-------------------------/.內容區--------------------------------->





<!-- -------------------DataTable引入的js---------------------------------------------------------------------- -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
	
<!-- -------------------SweetAlert引入的js---------------------------------------------------------------------- -->	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>		
	
<!-- -------------------DataTable的javascript---------------------------------------------------------------------- -->
	<script>
	$(document).ready(function() {
	    $('#actord').DataTable();
	} );
	</script>
	
	<script>
	
	<!-- -------------------SweetAlert引入的javascript---------------------------------------------------------------------- -->	
	
	$('input[name=delete]').click(function() {
		console.log("why you are not here!");
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