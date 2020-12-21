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

<!-- -------------------websocket引入的CDN---------------------------------------------------------------------- -->

 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
 <link rel="stylesheet" href="css/style.css">
 <link rel="stylesheet" href="css/admin_chatbox.css">

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
	hover :#ccc6ad;
	font-weight:bold
}
.btn:hover{
	background-color:#79a6ad;
	border-color:#79a6ad;
	
}
</style>


<title>農郁-活動後臺管理</title>
</head>
<body class="goto-here">

	<jsp:include page="/WEB-INF/pages/testAdminH.jsp" />

	<jsp:include page="/WEB-INF/pages/Admin_message.jsp" />
	
<!-------------------------內容區--------------------------------->
<section class="content-wrapper d-flex justify-content-center">
  <form:form action="actAdminPreUpdate.do" modelAttribute="afBean" method="POST" enctype="multipart/form-data" name="actAdmin">
    <div class="card card-info" style="width: 50rem; ">
      <div class="card-header" style="background-color:#b8cdd4;">
        <span class="card-title" style="font-size: 40px; color:#003440">活動檢視    </span><span style="font-size: 20px;color:#a63a00 ;font-weight:bold">${afBean.actStatusWord }</span>
      </div>
      <div class="card-body">
      <div class="form-group">
            <form:label path="actId">活動編號:</form:label>
          	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
          	<form:label path="sellerId">會員編號:</form:label>
          <div class="form-inline">
          	<form:input path="actId" type="text" class="form-control col" readonly="true"/>&emsp;&emsp;
            <form:input path="sellerId" type="text" class="form-control col" readonly="true"/>
          </div>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="actName">活動名稱:</form:label>
          <form:input path="actName" type="text" class="form-control" readonly="true"/>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="actType">活動類型:</form:label>
          <form:select path="actType" type="text" class="form-control" disabled="true">		
				<form:option value="體驗類"  >體驗類</form:option>
				<form:option value="採收類">採收類</form:option>
				<form:option value="文藝類">文藝類</form:option>
				<form:option value="綜合類">綜合類</form:option>			
			</form:select>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="actAddr">活動地址:</form:label>
          <form:input path="actAddr" type="text" class="form-control" readonly="true"/>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="tel">連絡電話:</form:label>
          <form:input path="tel" type="text" class="form-control" readonly="true"/>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="actDateSta">活動開始日期:</form:label>
          &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;          
          <form:label path="actTimeSta">活動開始時間:</form:label>
          <div class="form-inline">
          	<form:input path="actDateSta" type="date" class="form-control col" readonly="true"/>&emsp;&emsp;
          	<form:input path="actTimeSta"  type="time" class="form-control col" readonly="true"/>
          </div>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="actDateEnd">活動截止日期:</form:label>
          &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;          
          <form:label path="actTimeEnd">活動截止時間:</form:label>
          <div class="form-inline">
          	<form:input path="actDateEnd" type="date" class="form-control col" readonly="true"/>&emsp;&emsp;
          	<form:input path="actTimeEnd"  type="time" class="form-control col" readonly="true"/>
          </div>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="numLim">活動人數上限:</form:label>
          <form:input path="numLim" type="text" class="form-control" readonly="true"/>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="price">活動費用:</form:label>
          <form:input path="price" type="text" class="form-control" readonly="true"/>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="actImg">活動海報:</form:label>
          <div class="form-inline">
           <img height='230' width='230' src="<c:url value='ActImageController?id=${afBean.actId}&type=ACTFARMER'/>"/>
           <form:label path="imgName" class="align-self-end">${afBean.imgName}</form:label>	           
          </div>	
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="actDescri">活動描述:</form:label>
          <form:textarea path="actDescri" class="form-control" style="height:200px" readonly="true"></form:textarea>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="signDateSta">報名開始日期:</form:label>
          &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;          
          <form:label path="signTimeSta">報名開始時間:</form:label>
          <div class="form-inline">
          	<form:input path="signDateSta" type="date" class="form-control col" readonly="true"/>&emsp;&emsp;
          	<form:input path="signTimeSta"  type="time" class="form-control col" readonly="true"/>
          </div>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="signDateEnd">報名截止日期:</form:label>
          &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;          
          <form:label path="signTimeEnd">報名截止時間:</form:label>
          <div class="form-inline">
          	<form:input path="signDateEnd" type="date" class="form-control col" readonly="true"/>&emsp;&emsp;
          	<form:input path="signTimeEnd"  type="time" class="form-control col" readonly="true"/>
          </div>
        </div>
        <!-- /.form group -->
        <div class="form-group">
          <form:label path="sigStat" readonly="true">報名狀態:</form:label>
          <div class="form-inline" >
            <form:radiobutton path="sigStat" value="0" id="sigStat" disabled="true"/>報名未開放&emsp;&emsp;
			<form:radiobutton path="sigStat" value="1" id="sigStat" disabled="true"/>活動報名中&emsp;&emsp;
			<form:radiobutton path="sigStat" value="2" id="sigStat" disabled="true"/>報名已截止
          </div>
        </div>
        <!-- /.form group -->
<!--         <div class="form-group"> -->
<%--           <form:label path="actLock">活動狀態:</form:label> --%>
<!--           <div class="form-inline" > -->
<%--             <form:radiobutton path="actLock" value="0" id="actLock" disabled="true"/>待審核&emsp;&emsp;&emsp;&emsp; --%>
<%-- 			<form:radiobutton path="actLock" value="1" id="actLock" disabled="true"/>申請通過&emsp;&emsp;&emsp;&ensp; --%>
<%-- 			<form:radiobutton path="actLock" value="2" id="actLock" disabled="true"/>申請未通過&emsp;&emsp;&emsp; --%>
<%-- 			<form:radiobutton path="actLock" value="3" id="actLock" disabled="true"/>活動封鎖 --%>
<!--           </div> -->
<!--         </div> -->
<!--         /.form group -->
        <div class="form-group">
          <form:label path="actRemarks">備註:</form:label>
          <form:textarea path="actRemarks" class="form-control" style="height:50px" readonly="true"></form:textarea>
        </div>
        <!-- /.form group -->
        <div class="form-group form-inline">&emsp;&emsp;&emsp;
          <form:button readonly="true" class="btn btn-primary py-2 px-3 col-5" value="submit">修改</form:button>&emsp;&emsp;
          <form:button readonly="true" class="btn btn-primary py-2 px-3 col-5" value="back" onclick="backHome()">回活動管理首頁</form:button>
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
		document.actAdmin.action="getAllActFarmer.do";
	    document.actAdmin.submit();
	}
	</script>

</body>
</html>