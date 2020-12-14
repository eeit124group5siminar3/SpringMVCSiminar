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
	background-color: #e6e1d3;
	border-color:#e6e1d3;
	hover :#ccc6ad;
	font-weight:bold
}
.btn:hover{
	background-color:#ccc6ad;
	border-color:#ccc6ad;
	
}
</style>


<title>農郁-活動管理</title>
</head>
<body class="goto-here">

	<jsp:include page="/WEB-INF/pages/testAdminH.jsp" />
	
<!-------------------------內容區--------------------------------->
<section class="content-wrapper d-flex justify-content-center">
  <form:form action="actAdminSignU.do" modelAttribute="aoBean" method="POST" enctype="multipart/form-data" name="actAdmin">
    <div class="card card-info" style="width: 50rem; ">
      <div class="card-header" style="background-color: #e6e1d3;">
        <span class="card-title" style="font-size: 40px;font-weight:bold;color:#594a2d">報名訂單修改 </span>
        <span style="font-size: 20px;color:#594a2d">訂購時間: ${aoBean.ordTime }</span>
      </div>
      <div class="card-body">
      <div class="form-group">
            <form:label path="actOrdId">訂單編號:</form:label>
          	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
          	<form:label path="memNo">購買人會員編號:</form:label>
          <div class="form-inline">
          	<form:input path="actOrdId" type="text" class="form-control col" readonly="true"/>&emsp;&emsp;
            <form:input path="memNo" type="text" class="form-control col" readonly="true"/>
          </div>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="memName">訂購人姓名:</form:label>
          <form:input path="memName" type="text" class="form-control" readonly="true"/>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="memTel">訂購人電話:</form:label>
          <form:input path="memTel" type="text" class="form-control" readonly="true"/>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="memEmail">訂購人信箱:</form:label>
          <form:input path="memEmail" type="text" class="form-control" readonly="true"/>
        </div>
        <!-- /.form group -->
         <div class="form-group">
          <form:label path="actFarmer.actName">訂購活動:</form:label>
          <div class="form-inline">
	          <form:input path="actFarmer.actName" type="text" class="form-control col-6" readonly="true"/>&emsp;&emsp;
	          <form:button readonly="true" class="btn btn-primary py-1 px-1 col-2" value="read" onclick="readAct()">查看活動</form:button>
          </div>
        </div>
        <!-- /.form group -->
        <div class="form-group">
            <form:label path="ordActNum">訂購人數:</form:label>
          	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
          	<form:label path="totalPrice">訂購總金額:</form:label>
          <div class="form-inline">
          	<form:input path="ordActNum" type="text" class="form-control col" readonly="true"/>&emsp;&emsp;
            <form:input path="totalPrice" type="text" class="form-control col" readonly="true"/>
          </div>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="ordState" readonly="true">訂單狀態</form:label>
          <div class="form-inline" >
            <form:radiobutton path="ordState" value="0" id="sigStat"/>尚未付款&emsp;&emsp;
			<form:radiobutton path="ordState" value="1" id="sigStat" />已付款&emsp;&emsp;
			<form:radiobutton path="ordState" value="2" id="sigStat" />訂單取消
          </div>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="actPayWayStatusWord">付款方式:</form:label>
          <form:input path="actPayWayStatusWord" type="text" class="form-control" readonly="true"/>
        </div>
        <!-- /.form group -->
        
<!--         <div class="form-group"> -->
<%--           <form:label path="payWay">付款方式:</form:label> --%>
<%--           <form:select path="payWay" type="text" class="form-control" readonly="true">		 --%>
<%-- 				<form:option value="0">信用卡</form:option> --%>
<%-- 				<form:option value="1">網路ATM</form:option> --%>
<%-- 				<form:option value="2">ATM櫃員機</form:option> --%>
<%-- 				<form:option value="3">超商條碼</form:option>			 --%>
<%-- 				<form:option value="4">超商代碼</form:option>			 --%>
<%-- 			</form:select> --%>
<!--         </div> -->
<!--         /.form group -->
        <div class="form-group">
          <form:label path="actOrdRemarks">備註:</form:label>
          <form:textarea path="actOrdRemarks" class="form-control" style="height:50px" readonly="true"></form:textarea>
        </div>
        <!-- /.form group -->
        <div class="form-group form-inline">&emsp;&emsp;&emsp;
          <form:button readonly="true" class="btn btn-primary py-2 px-3 col-5" value="submit">修改</form:button>&emsp;&emsp;
          <form:button readonly="true" class="btn btn-primary py-2 px-3 col-5" value="back" onclick="backHome()">回訂單首頁</form:button>
        </div>
        <!-- /.form group -->        
       </div>
      <!-- /.card-body -->
    </div>
    <!-- /.card -->
   </form:form>      
    
  </section>


<!-------------------------/.內容區--------------------------------->


	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
	
	<script>
<!-- -------------------DataTable的javascript---------------------------------------------------------------------- -->
	$(document).ready(function() {
	    $('#actFarmer').DataTable();
	} );

	function backHome(){
		document.actAdmin.action="actAdminSign.do";
	    document.actAdmin.submit();
	}

	function readAct(){
		document.actAdmin.action="getActByIdForAdmin.do?actId=${aoBean.actFarmer.actId}";
	    document.actAdmin.submit();
	
	}
	</script>

</body>
</html>