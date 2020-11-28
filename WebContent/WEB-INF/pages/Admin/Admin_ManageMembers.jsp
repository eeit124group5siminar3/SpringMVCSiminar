<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>後臺管理</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<!-- 會員新增買賣家 -->
	<script>
	window.onload = function() {
		var customRadioInline1 = document.getElementById("customRadioInline1");
		var customRadioInline2 = document.getElementById("customRadioInline2");
		var ckeckbank = document.getElementById("ckeckbank");
		var ckeckbank1 = document.getElementById("ckeckbank1");

		customRadioInline1.onclick = function() {
			$("#ckeckbank").empty();
			ckeckbank.classList.remove("form-group");
			ckeckbank.classList.remove("col-md-6");
			$("#ckeckbank1").empty();
			ckeckbank1.classList.remove("form-group");
			ckeckbank1.classList.remove("col-md-6");
			
		}

		customRadioInline2.onclick = function() {
			ckeckbank.classList.add("form-group");
			ckeckbank.classList.add("col-md-6");
			ckeckbank.innerHTML = 

			'<label for="inputPassword4" style="float:left">'+'銀行代號'+
			'<a style="color:red">'+'*'+
			'</a>'+
			'</label>'+
			'<span style="color:red">'+
			'<small id="span_bank_code">'+
			'</small>'+
			'</span>'+
			'<input type="text" name="member_bank_code" id="member_bank_code" class="form-control" placeholder="請填入銀行代號" required>';

			ckeckbank1.classList.add("form-group");
			ckeckbank1.classList.add("col-md-6");
			ckeckbank1.innerHTML =

			'<label for="inputPassword4" style="float:left">'+'銀行帳號'+
			'<a style="color:red">'+
			'*'+
			'</a>'+
			'</label>'+
			'<span style="color:red">'+
			'<small id="span_bank_account">'+
			'</small>'+
			'</span>'+
			'<input type="text" name="member_bank_account" id="member_bank_account" class="form-control" placeholder="銀行帳號不含dash (-)" required>';

		}
		
	}
</script>

<!-- 檢視會員詳細資料 -->
<script>
$(function(){
	$("#member_tr").on("click","#view_content",function(){
	$.ajax({
		url:"viewSelectManageMembersData.controller",
		data:{
			member_no:$(this).prev().val()
		 	},
		type:"POST", 
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
	success:function(data){
		let viewdata = data.viewdata
		console.log(viewdata);
		if(viewdata){
			$("#select_content").html(

`
					<form id="view_form" method="post">
					<div class="signup-form container">

					\<c:if test="\${viewdata.member_permissions =='0'}">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline1"
							name="member_permissions" id="member_permissions"
							class="custom-control-input" value="0" checked="true" disabled>
						<label class="custom-control-label" for="customRadioInline1">買家</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline2"
							name="member_permissions" id="member_permissions1"
							class="custom-control-input" value="1" disabled> <label
							class="custom-control-label" for="customRadioInline2">買家與賣家</label>
					</div>
				\</c:if>
				\<c:if test="\${viewdata.member_permissions == '1'}">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline1"
							name="member_permissions" id="member_permissions"
							class="custom-control-input" value="0" disabled> <label
							class="custom-control-label" for="customRadioInline1">買家</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline2"
							name="member_permissions" id="member_permissions1"
							class="custom-control-input" value="1" checked="true" disabled>
						<label class="custom-control-label" for="customRadioInline2">買家與賣家</label>
					</div>
				\</c:if>


					
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4" style="float:left">帳號</label> <input type="text"
										class="form-control"
										placeholder="\${viewdata.member_email}">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4" style="float:left">身份證字號</label> <input type="text"
										class="form-control"
										placeholder="\${viewdata.member_id}">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" style="float:left">密碼</label> <input type="text"
										class="form-control"
										placeholder="\${viewdata.member_password}">
								</div>
								<div class="form-group col-md-6"></div>
									<div class="form-group col-md-6">
										<label for="inputPassword4" style="float:left">銀行代號</label> <input type="text"
											class="form-control"
											placeholder="\${viewdata.member_bank_code}">
									</div>
									<div class="form-group col-md-6">
										<label for="inputPassword4" style="float:left">銀行帳號</label> <input type="text"
											class="form-control"
											placeholder="\${viewdata.member_bank_account}">
									</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" style="float:left">名稱</label> <input type="text"
										class="form-control"
										placeholder="\${viewdata.member_name}">
									<p></p>
									<label for="inputPassword4" style="float:left">生日</label> <input type="text"
										class="form-control"
										placeholder="\${viewdata.member_birthday}">
									<p></p>
									<label for="inputPassword4" style="float:left">連絡電話</label> <input type="text"
										class="form-control"
										placeholder="\${viewdata.member_cellphone}">
								</div>
							</div>
							<div class="form-group">
								<label for="inputAddress" style="float:left">地址</label> <input type="text"
									class="form-control"
									placeholder="\${viewdata.member_address}">
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4" style="float:left">統一編號</label> <input type="text"
										class="form-control"
										placeholder="\${viewdata.member_gui_number}">
								</div>
							</div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
						        <button type="button" class="btn btn-primary">修改</button>
						      </div>
					</div>
				</form>`










					
			);		
		}
	}
    });  
});
})
</script>

	<!-- 畫面顯示所有會員資料 -->
	<script>
$(document).ready(function(){
var currentPage = 1;
	$.get({
		url:"${pageContext.request.contextPath}/manageMembersData.controller/"+currentPage,
		success:function(data){
		console.log(data);
		let data1 = data.data;
		content="";
		for(var i=0 ; i<data1.length ; i++){
			content+=
				`
				<tr>
				<td>\${data1[i].member_permissions}</td>
				<td>\${data1[i].member_no}</td>
				<td>\${data1[i].member_name}</td>
				<td>\${data1[i].member_cellphone}</td>
				<td>\${data1[i].member_address}</td>
				<td>\${data1[i].member_signup_date}</td>
				<td>\${data1[i].member_gg}</td>
				<td>\${data1[i].member_lock_acc}</td>
				<td>
					<form method="POST">
						<input type="hidden" id="view_member_no"+[i] name="actId"
						value="\${data1[i].member_no}"> 
	

<!----------------------------------------------------------------------->

					<!-- Button trigger modal -->
					<button type="button" id="view_content" data-toggle="modal" data-target="#exampleModal1">
					  檢視
					</button>

					<!-- Modal -->
					<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">詳細資料</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div id="select_content" class="modal-body">
					      </div>
					    </div>
					  </div>
					</div>
</form>



<!------------------------------------------------------------>




					
				</td>
				<td>
					<form action="#" method="get">
						<input type="hidden" id="actId" name="actId"
						value="\${data1[i].member_no}"> <input name="update"
						type="submit" value="修改">
					</form>
				</td>
				<td>
					<form action="#" method="post">
						<input type="hidden" id="actId" name="actId"
						value="\${data1[i].member_no}"> <input name="delete"
						type="submit" value="刪除">
				</form>
				</td>
				</tr>`;
		}
		$('#member_tr').html(
				`
				<tr>
				<th>買賣家</th>
				<th style="width: 100px;">會員編號</th>
				<th style="width: 130px;">會員名稱</th>
				<th style="width: 130px;">會員電話</th>
				<th style="width: 350px;">會員地址</th>
				<th style="width: 150px;">註冊時間</th>
				<th>檢舉次數</th>
				<th>停權狀態</th>
				<th colspan="3"></th>
				</tr>`+content);
		
	}
    });  
})
</script>

	<!-- 查詢會員資料 -->
	<script>
$(function(){
$("#select_member_no").on("submit",function(ev){
	$("#select_error").html("");
	$.ajax({
		url:"selectManageMembersData.controller",
		data:{
			select_member_no:$("#selectno").val()
		 	},
		type:"POST", 
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		 
	success:function(data){
			let data1 = data.data;
			let data2 = data.totaldata;			
			let data3 = data.error;
		if(data1){
			content="";
				content+=
					`
					<tr>
					<td>\${data1.member_permissions}</td>
					<td>\${data1.member_no}</td>
					<td>\${data1.member_name}</td>
					<td>\${data1.member_cellphone}</td>
					<td>\${data1.member_address}</td>
					<td>\${data1.member_signup_date}</td>
					<td>\${data1.member_gg}</td>
					<td>\${data1.member_lock_acc}</td>
					<td>
					<form method="POST">
					<input type="hidden" id="view_member_no"+[i] name="actId"
					value="\${data1.member_no}"> 


<!----------------------------------------------------------------------->

				<!-- Button trigger modal -->
				<button type="button" id="view_content" data-toggle="modal" data-target="#exampleModal1">
				  檢視
				</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">詳細資料</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div id="select_content" class="modal-body">
				      </div>
				    </div>
				  </div>
				</div>
</form>
					</td>
					<td>
						<form action="#" method="get">
							<input type="hidden" id="actId" name="actId"
							value="\${data1.member_no}"> <input name="update"
							type="submit" value="修改">
						</form>
					</td>
					<td>
						<form action="#" method="post">
							<input type="hidden" id="actId" name="actId"
							value="\${data1.member_no}"> <input name="delete"
							type="submit" value="刪除">
					</form>
					</td>
					</tr>`;
			$('#member_tr').html(
					`
					<tr>
					<th>買賣家</th>
					<th style="width: 100px;">會員編號</th>
					<th style="width: 130px;">會員名稱</th>
					<th style="width: 130px;">會員電話</th>
					<th style="width: 350px;">會員地址</th>
					<th style="width: 150px;">註冊時間</th>
					<th>檢舉次數</th>
					<th>停權狀態</th>
					<th colspan="3"></th>
					</tr>`+content);
		}else if(data2){
			content="";
			for(var i=0 ; i<data2.length ; i++){
				content+=
					`
					<tr>
					<td>\${data2[i].member_permissions}</td>
					<td>\${data2[i].member_no}</td>
					<td>\${data2[i].member_name}</td>
					<td>\${data2[i].member_cellphone}</td>
					<td>\${data2[i].member_address}</td>
					<td>\${data2[i].member_signup_date}</td>
					<td>\${data2[i].member_gg}</td>
					<td>\${data2[i].member_lock_acc}</td>
					<td>
						<form action="#" method="get">
							<input type="hidden" id="actId" name="actId"
							value="\${data2[i].member_no}"> <input name="look"
							type="submit" value="檢視">
						</form>
					</td>
					<td>
						<form action="#" method="get">
							<input type="hidden" id="actId" name="actId"
							value="\${data2[i].member_no}"> <input name="update"
							type="submit" value="修改">
						</form>
					</td>
					<td>
						<form action="#" method="post">
							<input type="hidden" id="actId" name="actId"
							value="\${data2[i].member_no}"> <input name="delete"
							type="submit" value="刪除">
					</form>
					</td>
					</tr>`;
			}
			$('#member_tr').html(
					`
					<tr>
					<th>買賣家</th>
					<th style="width: 100px;">會員編號</th>
					<th style="width: 130px;">會員名稱</th>
					<th style="width: 130px;">會員電話</th>
					<th style="width: 350px;">會員地址</th>
					<th style="width: 150px;">註冊時間</th>
					<th>檢舉次數</th>
					<th>停權狀態</th>
					<th colspan="3"></th>
					</tr>`+content);
		}else{
			$("#select_error").html("查無資料，請重新輸入");
		}
	}
    }) 
    ev.preventDefault(); 
})
})
</script>
	<!-- 會員新增 -->
	<script>
$(function(){
$("#signup_form").on("submit",function(ev){
	$("#span_email").html("");
	$("#span_id").html("");
	$("#span_password").html("");
	$("#span_birthday").html("");
	$.ajax({
		url:"adminMemberSignUp.controller",
		data:{
			member_permissions:$("#customRadioInline1").prop('checked'),
			member_email:$("#member_email").val(),
			member_password:$("#member_password").val(),
			member_password1:$("#member_password1").val(),
			member_name:$("#member_name").val(),
			member_birthday:$("#member_birthday").val(),
			member_cellphone:$("#member_cellphone").val(),
			member_id:$("#member_id").val(),
			member_address:$("#member_address").val(),
			member_gui_number:$("#member_gui_number").val(),
			e_paper:$("#gridCheck").prop('checked'),
			member_bank_code:$("#member_bank_code").val(),
			member_bank_account:$("#member_bank_account").val()
		 	},
		type:"POST", 
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		 
	success:function(data){
		if(data[5] == "1"){
			window.location.href = "goManageMembers.controller";
		}if(data[0] == "2"){
			$("#span_email").html("Email已被註冊");
		}if(data[1] == "3"){
			$("#span_id").html("身份證字號已被註冊");
		}if(data[2] == "12"){
			$("#span_id").html("格式錯誤");
		}if(data[4] == "4"){
			$("#span_password").html("兩次密碼不符合");
		}if(data[6] == "5"){
			$("#span_password").html("格式錯誤");
		}if(data[3] == "6"){
			$("#span_birthday").html("格式錯誤");
		}
	}
    }) 
    ev.preventDefault(); 
})
})
</script>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="#">農郁</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> 列表
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a
						href="<c:url value='adminBackstage.controller' />"
						class="nav-link">回首頁</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-tgogle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">平台管理</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="#">會員管理</a> <a
								class="dropdown-item" href="#">商城管理</a> <a class="dropdown-item"
								href="#">活動管理</a> <a class="dropdown-item" href="#">食譜管理</a> <a
								class="dropdown-item" href="#">市集管理</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-tgogle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">電子簽核</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="#">簽核管理</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-tgogle" href="123.html" id="dropdown04"
						aria-haspopup="true" aria-expanded="false">出勤管理</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="#">打卡作業</a> <a
								class="dropdown-item" href="#">補卡作業</a> <a class="dropdown-item"
								href="#">請假登錄</a> <a class="dropdown-item" href="#">加班登錄</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-tgogle" href="123.html" id="dropdown04"
						aria-haspopup="true" aria-expanded="false">部門管理</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="#">公佈欄</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-tgogle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">人事管理</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="#">員工基本資料</a> <a
								class="dropdown-item" href="#">考勤紀錄</a>
						</div></li>
					<!-- <li class="nav-item"><a href="product-single.html" class="nav-link">商城</a></li> -->

					<li class="nav-item"><a href="#" class="nav-link">登出</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<hr>


	<h1 align="center">會員資料</h1>
	<br>
	<br>
	<br>
	<div class="member_table">
		<div id="select_error" align="center" style="color: red; height: 20px"></div>
		<br>
		<table align="center" style="border: 1px black; text-align: center;"
			border="1">
			<tr style="border: 0px" colspan="11">
				<td>
					<button class="float-left" id="insert_button" type="button"
						name="apply" data-toggle="modal" data-target="#exampleModal">新增</button>
					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">會員新增</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<form method="post" id="signup_form">
									<div class="modal-body">
										<!-- ------------------------新增------------------------- -->
										<div class="signup-form container">
											<div id="member_permissions0"
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="customRadioInline1"
													name="member_permissions" class="custom-control-input"
													value="0" checked="true"> <label
													class="custom-control-label" for="customRadioInline1">買家</label>
											</div>
											<div id="member_permissions1"
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="customRadioInline2"
													name="member_permissions" class="custom-control-input"
													value="1"> <label class="custom-control-label"
													for="customRadioInline2">買家與賣家</label>
											</div>
											<p></p>
											<div class="form-row">
												<div class="form-group col-md-6" style="text-align: center">
													<label style="float: left" for="inputEmail4">帳號<a
														style="color: red">*</a></label><span style="color: red"><small
														id="span_email"></small></span> <input type="email"
														name="member_email" id="member_email" class="form-control"
														placeholder="請填入Email" required>
												</div>

												<div class="form-group col-md-6" style="text-align: center">
													<label for="inputEmail4" style="float: left">身份證字號<a
														style="color: red">*</a></label> <span style="color: red"><small
														id="span_id"></small></span><input type="text" name="member_id"
														id="member_id" class="form-control" placeholder="請填入身份證字號"
														pattern="^[A-Za-z]\d{9}$" title="身分證格式錯誤" required>
												</div>

												<div class="form-group col-md-6" style="text-align: center">
													<label for="inputPassword4" style="float: left">密碼<a
														style="color: red">*</a></label> <span style="color: red"><small
														id="span_password"></small></span><input type="password"
														name="member_password" id="member_password"
														class="form-control" placeholder="請填入密碼"
														pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
														title="密碼長度至少8碼，須包含大寫、小寫英文及數字" required>
												</div>

												<div class="form-group col-md-6" style="text-align: center">
													<label for="inputPassword4" style="float: left">密碼<a
														style="color: red">*</a></label> <input type="password"
														name="member_password1" id="member_password1"
														class="form-control" placeholder="請再次填入密碼"
														pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
														title="密碼長度至少8碼，須包含大寫、小寫英文及數字" required>
												</div>

												<div id="ckeckbank"></div>
												<div id="ckeckbank1"></div>

												<div class="form-group col-md-6" style="text-align: center">
													<label for="inputPassword4" style="float: left">名稱<a
														style="color: red">*</a></label> <span style="color: red"><small
														id="span_name"></small></span> <input type="text"
														name="member_name" id="member_name" class="form-control"
														placeholder="請填入姓名或商家名稱" pattern="^[\u4e00-\u9fa5]{0,}$"
														title="只接受中文字" required>
													<p></p>

													<label for="inputPassword4" style="float: left">生日<a
														style="color: red">*</a></label> <span style="color: red"><small
														id="span_birthday"></small></span> <input type="date"
														name="member_birthday" id="member_birthday"
														class="form-control" onkeydown="return false"
														pattern="\d{4}\-?\d{2}\-?\d{2}" required>
													<p></p>

													<label for="inputPassword4" style="float: left">連絡電話<a
														style="color: red">*</a></label> <span style="color: red"><small
														id="span_cellphone"></small></span> <input type="text"
														name="member_cellphone" id="member_cellphone"
														class="form-control" required>


												</div>
											</div>
											<div class="form-group" style="text-align: center">
												<label for="inputAddress" style="float: left">地址<a
													style="color: red">*</a></label><input type="text"
													name="member_address" id="member_address"
													class="form-control" placeholder="請填入聯絡地址"
													pattern="^[\u4e00-\u9fa5\d]{0,}$" title="格式錯誤，不能填入英文"
													required>
											</div>

											<div class="form-row">
												<div class="form-group col-md-6" style="text-align: center">
													<label for="inputEmail4" style="float: left">統一編號</label><input
														type="text" name="member_gui_number"
														id="member_gui_number" class="form-control"
														placeholder="選填" pattern="\d{8}" title="需輸入8位數字">
												</div>
											</div>

											<div class="form-group">
												<div class="form-check">
													<input name="e_paper" class="form-check-input"
														type="checkbox" id="gridCheck" value="1" checked="true">
													<label class="form-check-label" for="gridCheck">
														訂閱電子報 </label>
												</div>
											</div>
										</div>
										<!-- ------------------------新增------------------------- -->

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">關閉</button>
										<button type="submit" id="signup" class="btn btn-primary">儲存</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<form id="select_member_no" class="float-right" method="get">
						<label for="">會員編號:</label> <input type="text" id="selectno"
							name="selectno"> &nbsp;
						<button name="selectone" type="submit">查詢</button>
					</form>
				</td>
			</tr>

			<tr id="member_tr"></tr>
			<tr>
				<td style="border: 0px; text-align: center;" colspan="12">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</td>
			</tr>
		</table>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>
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
</body>
</html>