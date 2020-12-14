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

	<!-- 會員新增買賣家選項 -->
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

	<!-- 刪除按鈕回傳會員資料 -->
	<script>
$(function(){
	$("#member_tr").on("click","#delete_button",function(){
	$.ajax({
		url:"viewDeleteManageMembersData.controller",
		data:{
			member_no:$(this).prev().val()
		 	},
		type:"POST", 
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
	success:function(data){
		let deletedata = data.deletedata
		
		if(deletedata){
			$("#delete_content").html(
					`
				<form id="delete_form" method="post">	
					<input type="hidden" id="hidden_delete_member_no" value="\${deletedata.member_no}">	
					<p style="float:left">會員編號:<font style="color:red">\${deletedata.member_no}</font></p><br><br>
					<p style="float:left">會員姓名:<font style="color:red">\${deletedata.member_name}</font></p><br><br>
					<a>是否確定刪除整筆資料</a><br><br>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
						    <button type="button" id="delete_button_sure" class="btn btn-primary">確定</button>
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

	<!-- 確定刪除會員資料 -->
	<script>
$(function(){
	$("#member_tr").on("click","#delete_button_sure",function(){
	$.ajax({
		url:"viewDeleteManageMembersDataSure.controller",
		data:{
			member_no:$("#hidden_delete_member_no").val(),
		 	},
		type:"POST", 
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
	success:function(data){
		if(data){
			window.location.href = "goManageMembers.controller";	
		}
	}
    });  
});
})
</script>

	<!-- 檢視會員詳細資料 -->
	<script>
$(function(){
	$("#member_tr").on("click","#view_content",function(){
		var permissions = "";
		var gui_number = "";
	$.ajax({
		url:"viewSelectManageMembersData.controller",
		data:{
			member_no:$(this).prev().val()
		 	},
		type:"POST", 
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
	success:function(data){
		let viewdata = data.viewdata;
		let code = data.viewdata.member_bank_code;
		let account = data.viewdata.member_bank_account;
		let gui_number = data.viewdata.member_gui_number;
		let lock_acc = data.viewdata.member_lock_acc;
		let epaper = data.viewdata.e_paper;
		console.log("code是"+code);
		
		if(viewdata){
			if(viewdata.member_permissions == 0){
				permissions = "買家";
			}else{
				permissions = "賣家";				
			}
			console.log(viewdata.member_bank_code);
			if(viewdata.member_bank_code == null){
 				code = "";
			}
			if(viewdata.member_bank_account == null){
 				account = "";
			}
			if(viewdata.member_gui_number == null){
 				gui_number = "";
			}
			if(viewdata.member_lock_acc == 0){
				lock_acc = "未停權";
			}else{
				lock_acc = "停權";				
			}
			if(viewdata.e_paper == 0){
				epaper = "未訂閱";
			}else{
				epaper = "已訂閱";				
			}
			$("#select_content").html(
					`
					<form id="view_form" method="post">
					<div class="signup-form container">
							<div class="form-row">
							<div class="form-group col-md-6">
							<label for="inputEmail4" style="float:left">會員編號</label> <input type="text"
								class="form-control" id="update_member_no"
								value="\${viewdata.member_no}" disabled>
								</div>
								<div class="form-group col-md-6">
								<label for="inputEmail4" style="float:left">註冊日期</label> <input type="text"
									class="form-control"
									placeholder="\${viewdata.member_signup_date}" disabled>
									</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4" style="float:left">買賣家</label> <span style="color: red"><small><small
									id="update_span_premissions"></small></small></span>
									<input type="text"
										class="form-control" id="update_member_permissions1"
										value="\${permissions}" disabled>
										<select class="form-control" style="float:left" id="update_member_permissions2">
										<option value="\${viewdata.member_permissions}" hidden></option>
										<option value="0">買家</option>
										<option value="1">賣家</option>
										</select>

								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4" style="float:left">身份證字號</label> <span style="color: red"><small><small
									id="update_span_id"></small></small></span>
									<input type="text"
										class="form-control" id="update_member_id1"
										value="\${viewdata.member_id}" disabled>
										<input type="text"
											class="form-control"
											id="update_member_id2">
								</div>
								<div class="form-group col-md-6">
								<label for="inputEmail4" style="float:left">帳號</label> <span style="color: red"><small><small 
								id="update_span_email"></small></small></span>
								<input type="text"
									class="form-control" id="update_member_email1"
									value="\${viewdata.member_email}" disabled>
									<input type="email"
										class="form-control"
										id="update_member_email2">
							</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" style="float:left">密碼</label> <span style="color: red"><small><small 
									id="update_span_password"></small></small></span>
									<input type="text"
										class="form-control" id="update_member_password1"
										value="\${viewdata.member_password}" disabled>
										<input type="text"
											class="form-control"
											id="update_member_password2">
								</div>
									<div class="form-group col-md-6">
										<label for="inputPassword4" style="float:left">銀行代號</label> <input type="text"
											class="form-control" id="update_member_bank_code1"
											value="\${code}" disabled>
											<input type="text"
												class="form-control"
												id="update_member_bank_code2">
									</div>
									<div class="form-group col-md-6">
										<label for="inputPassword4" style="float:left">銀行帳號</label> <input type="text"
											class="form-control" id="update_member_bank_account1"
											value="\${account}" disabled>
											<input type="text"
												class="form-control"
												id="update_member_bank_account2">
									</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" style="float:left">名稱</label> <span style="color: red"><small><small
									id="update_span_name"></small></small></span>
									<input type="text"
										class="form-control" id="update_member_name1"
										value="\${viewdata.member_name}" disabled>
										<input type="text"
											class="form-control"
											id="update_member_name2">
									<p></p>
									<label for="inputPassword4" style="float:left">生日</label> <span style="color: red"><small><small
									id="update_span_birthday"></small></small></span>
									<input type="text"
										class="form-control" id="update_member_birthday1"
										value="\${viewdata.member_birthday}" disabled>
									<input type="date"
										class="form-control"
										id="update_member_birthday2">
									<p></p>
									<label for="inputPassword4" style="float:left">連絡電話</label> <span style="color: red"><small><small
									id="update_span_cellphone"></small></small></span>
									<input type="text"
										class="form-control" id="update_member_cellphone1"
										value="\${viewdata.member_cellphone}" disabled>
										<input type="text"
											class="form-control"
											id="update_member_cellphone2">
								</div>
							</div>
							<div class="form-group">
								<label for="inputAddress" style="float:left">地址</label> <input type="text"
									class="form-control" id="update_member_address1"
									value="\${viewdata.member_address}" disabled>
									<input type="text"
										class="form-control"
										id="update_member_address2">
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4" style="float:left">統一編號</label> <input type="text"
										class="form-control" id="update_member_gui_number1"
										value="\${gui_number}" disabled>
										<input type="text"
											class="form-control"
											id="update_member_gui_number2">
										
								</div>
								<div class="form-group col-md-6">
								
								</div>
								<div class="form-group col-md-6">
								<label for="inputEmail4" style="float:left">檢舉次數</label> <span style="color: red"><small><small
								id="update_span_gg"></small></small></span>
								<input type="text"
									class="form-control" id="update_member_gg1"
									value="\${viewdata.member_gg}" disabled>
									<select class="form-control" style="float:left" id="update_member_gg2">
									<option value="\${viewdata.member_gg}" hidden></option>
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									</select>

									<p></p>
									<label for="inputEmail4" style="float:left">電子報</label> <span style="color: red"><small><small
									id="update_span_e_paper"></small></small></span>
									<input type="text"
										class="form-control" id="update_e_paper1"
										value="\${epaper}">
										<select class="form-control" style="float:left" id="update_e_paper2">
										<option value="\${viewdata.e_paper}" hidden></option>
										<option value="1">已訂閱</option>
										<option value="0">未訂閱</option>
										</select>
									</div>
									<div class="form-group col-md-6">
									
									<label for="inputEmail4" style="float:left">停權狀態</label> <span style="color: red"><small><small
									id="update_span_lock_acc"></small></small></span>
									<input type="text"
										class="form-control" id="update_member_lock_acc1"
										value="\${lock_acc}" disabled>
										<select class="form-control" style="float:left" id="update_member_lock_acc2">
										<option value="\${viewdata.member_lock_acc}" hidden></option>
										<option value="0">未停權</option>
										<option value="1">停權</option>
										</select>
								</div>
							</div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
						        <button type="submit" id="update_button" class="btn btn-primary">修改</button>
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

	<!-- 檢視內修改 -->
	<script>
$(function(){
	$("#member_tr").on("submit",function(ev){
		$("#update_span_email").html("");
		$("#update_span_id").html("");
		$("#update_span_password").html("");
		$("#update_span_birthday").html("");
		$("#update_span_premissions").html("");
		$("#update_span_gg").html("");
		$("#update_span_lock_acc").html("");
		$("#update_span_e_paper").html("");
		$.ajax({
			url:"adminMemberUpdate.controller",
			data:{
				member_no:$("#update_member_no").val(),
				member_permissions1:$("#update_member_permissions1").val(),
				member_email1:$("#update_member_email1").val(),
				member_password1:$("#update_member_password1").val(),
				member_name1:$("#update_member_name1").val(),
				member_birthday1:$("#update_member_birthday1").val(),
				member_cellphone1:$("#update_member_cellphone1").val(),
				member_id1:$("#update_member_id1").val(),
				member_address1:$("#update_member_address1").val(),
				member_gui_number1:$("#update_member_gui_number1").val(),
				e_paper1:$("#update_e_paper1").val(),
				member_bank_code1:$("#update_member_bank_code1").val(),
				member_bank_account1:$("#update_member_bank_account1").val(),
				member_gg1:$("#update_member_gg1").val(),
				member_lock_acc1:$("#update_member_lock_acc1").val(),
				member_permissions2:$("#update_member_permissions2").val(),
				member_email2:$("#update_member_email2").val(),
				member_password2:$("#update_member_password2").val(),
				member_name2:$("#update_member_name2").val(),
				member_birthday2:$("#update_member_birthday2").val(),
				member_cellphone2:$("#update_member_cellphone2").val(),
				member_id2:$("#update_member_id2").val(),
				member_address2:$("#update_member_address2").val(),
				member_gui_number2:$("#update_member_gui_number2").val(),
				e_paper2:$("#update_e_paper2").val(),
				member_bank_code2:$("#update_member_bank_code2").val(),
				member_bank_account2:$("#update_member_bank_account2").val(),
				member_gg2:$("#update_member_gg2").val(),
				member_lock_acc2:$("#update_member_lock_acc2").val()
			 	},
			type:"POST", 
			contentType:'application/x-www-form-urlencoded;charset=UTF-8',
			 
		success:function(data){
			console.log(data[1]);
			if(data[0] == "0"){
				window.location.href = "goManageMembers.controller";
			}if(data[1] == "1"){
				$("#update_span_email").html("Email已被註冊");
			}if(data[2] == "2"){
				$("#update_span_id").html("身份證字號已被註冊");
			}if(data[3] == "3"){
				$("#update_span_id").html("格式錯誤");
			}if(data[4] == "4"){
				$("#update_span_password").html("格式錯誤");
			}if(data[5] == "5"){
				$("#update_span_birthday").html("格式錯誤");
			}if(data[6] == "6"){
				$("#update_span_premissions").html("格式錯誤，0為買家  1為賣家");
			}if(data[7] == "7"){
				$("#update_span_gg").html("4次以上請更改停權狀態");
			}if(data[8] == "8"){
				$("#update_span_lock_acc").html("格式錯誤，0為正常  1為停權");
			}if(data[9] == "9"){
				$("#update_span_e_paper").html("格式錯誤，0為不訂閱  1為訂閱");
			}
		}
	    })
	    ev.preventDefault(); 
	})
	})

</script>

	<!-- 畫面顯示所有會員資料 -->
	<script>
$(document).ready(function(){
var permissions = "";
var lock_acc = "";
var currentPage = 1;
	$.get({
		url:"${pageContext.request.contextPath}/manageMembersData.controller/"+currentPage,
		success:function(data){
		console.log(data);
		let data1 = data.data;
		let pageNo = data.pageNO;
		let totalPages = data.totalPageNo;
		
		content="";
		for(var i=0 ; i<data1.length ; i++){
			if(data1[i].member_permissions == 0){
				permissions = "買家";
			}else{
				permissions = "賣家";				
			}
			if(data1[i].member_lock_acc == 0){
				lock_acc = "未停權";
			}else{
				lock_acc = "停權";				
			}
			content+=
				`
				<tr>
				<td>\${permissions}</td>
				<td>\${data1[i].member_no}</td>
				<td>\${data1[i].member_name}</td>
				<td>\${data1[i].member_cellphone}</td>
				<td>\${data1[i].member_address}</td>
				<td>\${data1[i].member_signup_date}</td>
				<td>\${data1[i].member_gg}</td>
				<td>\${lock_acc}</td>
				<td>
					<form method="POST">
						<input type="hidden" id="view_member_no"+[i] name="actId"
						value="\${data1[i].member_no}"> 
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
				<form method="POST">
				<input type="hidden" id="delete_member_no" name="actId"
				value="\${data1[i].member_no}"> 

			<!-- Button trigger modal -->
			<button type="button" id="delete_button" data-toggle="modal" data-target="#exampleModal_delete">
			  刪除
			</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal_delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">刪除資料</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div id="delete_content" class="modal-body"></div>
			    </div>
			  </div>
			</div>
</form>
				</td>
				</tr>`;
		}
		pages="";
		if(totalPages <=1){
			pages+=
				`
				<tr>
					<td style="border: 0px; text-align: center;" colspan="10">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
							<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
								<li class="page-item"><button type="button" class="page-link" value="1"style="color:black" disabled="disabled">1</button></li>
								<li class="page-item"><button type="button" class="page-link" disabled="disabled">&raquo;</button></li>
							</ul>
						</nav>
					</td>
				</tr>
				`;
		}if(totalPages ==2){
			pages+=
				`
				<tr>
					<td style="border: 0px; text-align: center;" colspan="10">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
							<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
								<li class="page-item"><button type="button" class="page-link" value="1" style="color:black" disabled="disabled">1</button></li>
								<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
								<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
							</ul>
						</nav>
					</td>
				</tr>
				`;
		}if(totalPages ==3){
			pages+=
				`
				<tr>
					<td style="border: 0px; text-align: center;" colspan="10">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
							<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
								<li class="page-item"><button type="button" class="page-link" value="1" style="color:black" disabled="disabled">1</button></li>
								<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
								<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
								<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
							</ul>
						</nav>
					</td>
				</tr>
				`;
		}if(totalPages ==4){
			pages+=
				`
				<tr>
					<td style="border: 0px; text-align: center;" colspan="10">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
							<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
								<li class="page-item"><button type="button" class="page-link" value="1" style="color:black" disabled="disabled">1</button></li>
								<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
								<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
								<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
								<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
							</ul>
						</nav>
					</td>
				</tr>
				`;
		}if(totalPages >=5){
			pages+=
				`
				<tr>
					<td style="border: 0px; text-align: center;" colspan="10">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
							<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
								<li class="page-item"><button type="button" class="page-link" value="1" style="color:black" disabled="disabled">1</button></li>
								<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
								<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
								<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
								<li class="page-item"><button type="button" class="page-link" value="5" >5</button></li>
								<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
							</ul>
						</nav>
					</td>
				</tr>
				`;
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
				<th colspan="2"></th>
				</tr>`+content+pages);
		
	}
    });  
})
</script>

	<!-- 分頁 -->
	<script>
$(function(){
	$("#member_tr").on("click","button",function(){
		var PageNo =$(this).val();
		var permissions = "";
		var lock_acc = "";
		$.get({
			url:"${pageContext.request.contextPath}/manageMembersData.controller/"+PageNo,
			success:function(data){
			console.log(data);
			let data1 = data.data;
			let pageNo = data.pageNO;
			let totalPages = data.totalPageNo;
			
			content="";
			for(var i=0 ; i<data1.length ; i++){
				if(data1[i].member_permissions == 0){
					permissions = "買家";
				}else{
					permissions = "賣家";				
				}
				if(data1[i].member_lock_acc == 0){
					lock_acc = "未停權";
				}else{
					lock_acc = "停權";				
				}
				content+=
					`
					<tr>
					<td>\${permissions}</td>
					<td>\${data1[i].member_no}</td>
					<td>\${data1[i].member_name}</td>
					<td>\${data1[i].member_cellphone}</td>
					<td>\${data1[i].member_address}</td>
					<td>\${data1[i].member_signup_date}</td>
					<td>\${data1[i].member_gg}</td>
					<td>\${lock_acc}</td>
					<td>
						<form method="POST">
							<input type="hidden" id="view_member_no"+[i] name="actId"
							value="\${data1[i].member_no}"> 
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
					<form method="POST">
					<input type="hidden" id="delete_member_no" name="actId"
					value="\${data1[i].member_no}"> 

				<!-- Button trigger modal -->
				<button type="button" id="delete_button" data-toggle="modal" data-target="#exampleModal_delete">
				  刪除
				</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal_delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">刪除資料</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div id="delete_content" class="modal-body"></div>
				    </div>
				  </div>
				</div>
	</form>
					</td>
					</tr>`;
			}
			pages="";
			if(totalPages <=2){
				if((totalPages-pageNo) == 1){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="1" style="color:black" disabled="disabled">1</button></li>
										<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
				}if((totalPages-pageNo) == 0){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="1">1</button></li>
										<li class="page-item"><button type="button" class="page-link" value="2" style="color:black" disabled="disabled">2</button></li>
										<li class="page-item"><button type="button" class="page-link" disabled="disabled">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
				}
			}
			if(totalPages ==3){
				if((totalPages-pageNo) == 2){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="1" style="color:black" disabled="disabled">1</button></li>
										<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
										<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
				}if((totalPages-pageNo) == 1){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="1">1</button></li>
										<li class="page-item"><button type="button" class="page-link" value="2" style="color:black" disabled="disabled">2</button></li>
										<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
				}if((totalPages-pageNo) == 0){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="1">1</button></li>
										<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
										<li class="page-item"><button type="button" class="page-link" value="3" style="color:black" disabled="disabled">3</button></li>
										<li class="page-item"><button type="button" class="page-link" disabled="disabled">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
				}
			}
				if(totalPages ==4){
					if((totalPages-pageNo) == 3){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="1" style="color:black" disabled="disabled">1</button></li>
										<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
										<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
										<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
			}if((totalPages-pageNo) == 2){
				pages+=
					`
					<tr>
						<td style="border: 0px; text-align: center;" colspan="10">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
								<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
									<li class="page-item"><button type="button" class="page-link" value="1">1</button></li>
									<li class="page-item"><button type="button" class="page-link" value="2" style="color:black" disabled="disabled">2</button></li>
									<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
									<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
								</ul>
							</nav>
						</td>
					</tr>
					`;
			}if((totalPages-pageNo) == 1){
				pages+=
					`
					<tr>
						<td style="border: 0px; text-align: center;" colspan="10">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
								<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
									<li class="page-item"><button type="button" class="page-link" value="1">1</button></li>
									<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
									<li class="page-item"><button type="button" class="page-link" value="3" style="color:black" disabled="disabled">3</button></li>
									<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
								</ul>
							</nav>
						</td>
					</tr>
					`;
			}if((totalPages-pageNo) == 0){
				pages+=
					`
					<tr>
						<td style="border: 0px; text-align: center;" colspan="10">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
								<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
									<li class="page-item"><button type="button" class="page-link" value="1">1</button></li>
									<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
									<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
									<li class="page-item"><button type="button" class="page-link" value="4"  style="color:black" disabled="disabled">4</button></li>
									<li class="page-item"><button type="button" class="page-link" disabled="disabled">&raquo;</button></li>
								</ul>
							</nav>
						</td>
					</tr>
					`;
				}
			}
			if(totalPages ==5){
				if((totalPages-pageNo) == 4){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="1" style="color:black" disabled="disabled">1</button></li>
										<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
										<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
										<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
										<li class="page-item"><button type="button" class="page-link" value="5">5</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
			}if((totalPages-pageNo) == 3){
				pages+=
					`
					<tr>
						<td style="border: 0px; text-align: center;" colspan="10">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
								<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
									<li class="page-item"><button type="button" class="page-link" value="1">1</button></li>
									<li class="page-item"><button type="button" class="page-link" value="2" style="color:black" disabled="disabled">2</button></li>
									<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
									<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
									<li class="page-item"><button type="button" class="page-link" value="5">5</button></li>
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
								</ul>
							</nav>
						</td>
					</tr>
					`;
				}if((totalPages-pageNo) == 2){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="1">1</button></li>
										<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
										<li class="page-item"><button type="button" class="page-link" value="3" style="color:black" disabled="disabled">3</button></li>
										<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
										<li class="page-item"><button type="button" class="page-link" value="5">5</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
				}if((totalPages-pageNo) == 1){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="1">1</button></li>
										<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
										<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
										<li class="page-item"><button type="button" class="page-link" value="4" style="color:black" disabled="disabled">4</button></li>
										<li class="page-item"><button type="button" class="page-link" value="5">5</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
				}if((totalPages-pageNo) == 0){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="1">1</button></li>
										<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
										<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
										<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
										<li class="page-item"><button type="button" class="page-link" value="5" style="color:black" disabled="disabled">5</button></li>
										<li class="page-item"><button type="button" class="page-link" disabled="disabled">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
				}
			}
			if(totalPages >=6){
				if(pageNo ==1){
				pages+=
					`
					<tr>
						<td style="border: 0px; text-align: center;" colspan="10">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
								<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
									<li class="page-item"><button type="button" class="page-link" value="1" style="color:black" disabled="disabled">1</button></li>
									<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
									<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
									<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
									<li class="page-item"><button type="button" class="page-link" value="5">5</button></li>
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
								</ul>
							</nav>
						</td>
					</tr>
					`;
				}if(pageNo ==2){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="1">1</button></li>
										<li class="page-item"><button type="button" class="page-link" value="2" style="color:black" disabled="disabled">2</button></li>
										<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
										<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
										<li class="page-item"><button type="button" class="page-link" value="5">5</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
					}if(pageNo ==3){
						pages+=
							`
							<tr>
								<td style="border: 0px; text-align: center;" colspan="10">
									<nav aria-label="Page navigation example">
										<ul class="pagination">
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
											<li class="page-item"><button type="button" class="page-link" value="1">1</button></li>
											<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
											<li class="page-item"><button type="button" class="page-link" value="3" style="color:black" disabled="disabled">3</button></li>
											<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
											<li class="page-item"><button type="button" class="page-link" value="5">5</button></li>
											<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
										</ul>
									</nav>
								</td>
							</tr>
							`;
						}
				
				if(pageNo >=4 && (totalPages-pageNo)>=2){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-2}">\${pageNo*1-2}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">\${pageNo*1-1}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo}" style="color:black" disabled="disabled">\${pageNo}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">\${pageNo*1+1}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+2}">\${pageNo*1+2}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
				}
				if(pageNo >=4 && (totalPages-pageNo)==1){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-3}">\${pageNo*1-3}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-2}">\${pageNo*1-2}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">\${pageNo*1-1}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo}" style="color:black" disabled="disabled">\${pageNo}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">\${pageNo*1+1}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
				}
				if(pageNo >=4 && (totalPages-pageNo)==0){
					pages+=
						`
						<tr>
							<td style="border: 0px; text-align: center;" colspan="10">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">&laquo;</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-4}">\${pageNo*1-4}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-3}">\${pageNo*1-3}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-2}">\${pageNo*1-2}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1-1}">\${pageNo*1-1}</button></li>
										<li class="page-item"><button type="button" class="page-link" value="\${pageNo}" style="color:black" disabled="disabled">\${pageNo}</button></li>
										<li class="page-item"><button type="button" class="page-link" disabled="disabled">&raquo;</button></li>
									</ul>
								</nav>
							</td>
						</tr>
						`;
				}
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
					<th colspan="2"></th>
					</tr>`+content+pages);
			
		}
	    });    
	})
})
</script>

	<!-- 查詢會員資料 -->
	<script>
$(function(){
$("#select_member_no").on("submit",function(ev){
	var permissions = "";
	var lock_acc = "";
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
			let pageNo = data.pageNO;
			let totalPages = data.totalPageNo;
		if(data1){
			if(data1.member_permissions == 0){
				permissions = "買家";
			}else{
				permissions = "賣家";				
			}
			if(data1.member_lock_acc == 0){
				lock_acc = "未停權";
			}else{
				lock_acc = "停權";				
			}
			content="";
				content+=
					`
					<tr>
					<td>\${permissions}</td>
					<td>\${data1.member_no}</td>
					<td>\${data1.member_name}</td>
					<td>\${data1.member_cellphone}</td>
					<td>\${data1.member_address}</td>
					<td>\${data1.member_signup_date}</td>
					<td>\${data1.member_gg}</td>
					<td>\${lock_acc}</td>
					<td>
					<form method="POST">
					<input type="hidden" id="view_member_no"+[i] name="actId"
					value="\${data1.member_no}"> 

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
					<form method="POST">
					<input type="hidden" id="delete_member_no" name="actId"
					value="\${data1.member_no}"> 

				<!-- Button trigger modal -->
				<button type="button" id="delete_button" data-toggle="modal" data-target="#exampleModal_delete">
				  刪除
				</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal_delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">刪除資料</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div id="delete_content" class="modal-body"></div>
				    </div>
				  </div>
				</div>
	</form>
					</td>
					</tr>`;
					pages="";
						pages+=
							`
							<tr>
								<td style="border: 0px; text-align: center;" colspan="10">
									<nav aria-label="Page navigation example">
										<ul class="pagination">
										<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
											<li class="page-item"><button type="button" class="page-link" value="1"style="color:black" disabled="disabled">1</button></li>
											<li class="page-item"><button type="button" class="page-link" disabled="disabled">&raquo;</button></li>
										</ul>
									</nav>
								</td>
							</tr>
							`;
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
					<th colspan="2"></th>
					</tr>`+content+pages);
		}else if(data2){
			content="";
			for(var i=0 ; i<data2.length ; i++){
				if(data2[i].member_permissions == 0){
					permissions = "買家";
				}else{
					permissions = "賣家";				
				}
				if(data2[i].member_lock_acc == 0){
					lock_acc = "未停權";
				}else{
					lock_acc = "停權";				
				}
				content+=
					`
					<tr>
					<td>\${permissions}</td>
					<td>\${data2[i].member_no}</td>
					<td>\${data2[i].member_name}</td>
					<td>\${data2[i].member_cellphone}</td>
					<td>\${data2[i].member_address}</td>
					<td>\${data2[i].member_signup_date}</td>
					<td>\${data2[i].member_gg}</td>
					<td>\${lock_acc}</td>
					<td>
					<form method="POST">
					<input type="hidden" id="view_member_no" name="actId"
					value="\${data2[i].member_no}"> 

				<!-- Button trigger modal -->
				<button type="button" id="view_content" data-toggle="modal" data-target="#exampleModal2">
				  檢視
				</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
					<form method="POST">
					<input type="hidden" id="delete_member_no" name="actId"
					value="\${data2[i].member_no}"> 

				<!-- Button trigger modal -->
				<button type="button" id="delete_button" data-toggle="modal" data-target="#exampleModal_delete">
				  刪除
				</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal_delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">刪除資料</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div id="delete_content" class="modal-body"></div>
				    </div>
				  </div>
				</div>
	</form>
					</td>
					</tr>`;
			}
			pages="";
			if(totalPages <=1){
				pages+=
					`
					<tr>
						<td style="border: 0px; text-align: center;" colspan="10">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
								<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
									<li class="page-item"><button type="button" class="page-link" value="1"style="color:black" disabled="disabled">1</button></li>
									<li class="page-item"><button type="button" class="page-link" disabled="disabled">&raquo;</button></li>
								</ul>
							</nav>
						</td>
					</tr>
					`;
			}if(totalPages ==2){
				pages+=
					`
					<tr>
						<td style="border: 0px; text-align: center;" colspan="10">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
								<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
									<li class="page-item"><button type="button" class="page-link" value="1" style="color:black" disabled="disabled">1</button></li>
									<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
								</ul>
							</nav>
						</td>
					</tr>
					`;
			}if(totalPages ==3){
				pages+=
					`
					<tr>
						<td style="border: 0px; text-align: center;" colspan="10">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
								<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
									<li class="page-item"><button type="button" class="page-link" value="1" style="color:black" disabled="disabled">1</button></li>
									<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
									<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
								</ul>
							</nav>
						</td>
					</tr>
					`;
			}if(totalPages ==4){
				pages+=
					`
					<tr>
						<td style="border: 0px; text-align: center;" colspan="10">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
								<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
									<li class="page-item"><button type="button" class="page-link" value="1" style="color:black" disabled="disabled">1</button></li>
									<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
									<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
									<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
								</ul>
							</nav>
						</td>
					</tr>
					`;
			}if(totalPages >=5){
				pages+=
					`
					<tr>
						<td style="border: 0px; text-align: center;" colspan="10">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
								<li class="page-item"><button type="button" class="page-link" disabled="disabled">&laquo;</button></li>
									<li class="page-item"><button type="button" class="page-link" value="1" style="color:black" disabled="disabled">1</button></li>
									<li class="page-item"><button type="button" class="page-link" value="2">2</button></li>
									<li class="page-item"><button type="button" class="page-link" value="3">3</button></li>
									<li class="page-item"><button type="button" class="page-link" value="4">4</button></li>
									<li class="page-item"><button type="button" class="page-link" value="5" >5</button></li>
									<li class="page-item"><button type="button" class="page-link" value="\${pageNo*1+1}">&raquo;</button></li>
								</ul>
							</nav>
						</td>
					</tr>
					`;
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
					<th colspan="2"></th>
					</tr>`+content+pages);
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

<!-- 會員新增一鍵 -->
	<script>
$(function(){
	var member_email="待輸入";
	var member_id="待輸入";
	var member_password="待輸入";
	var member_password1="待輸入";
	var member_bank_code="待輸入";
	var member_bank_account="待輸入";
	var member_name="待輸入";
	var member_cellphone="待輸入";
	var member_address="待輸入";

	$("#signup_form").on("click","#buyersignup_button",function(){
		console.log("111111");
		$("#member_email").val(member_email);
		$("#member_id").val(member_id);
		$("#member_password").val(member_password);
		$("#member_password1").val(member_password1);
		$("#member_name").val(member_name);
		$("#member_cellphone").val(member_cellphone);
		$("#member_address").val(member_address);
});
	$("#signup_form").on("click","#sellersignup_button",function(){
		$("#member_email").val(member_email);
		$("#member_id").val(member_id);
		$("#member_password").val(member_password);
		$("#member_password1").val(member_password1);
		$("#member_bank_code").val(member_bank_code);
		$("#member_bank_account").val(member_bank_account);
		$("#member_name").val(member_name);
		$("#member_cellphone").val(member_cellphone);
		$("#member_address").val(member_address);});
})
</script>

	<jsp:include page="/WEB-INF/pages/testAdminH.jsp" />



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
										<button type="button" id="buyersignup_button">買家</button>
										<button type="button" id="sellersignup_button">買家</button>
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
													for="customRadioInline2">賣家</label>
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
			<!-- 			<tr> -->
			<!-- 				<td style="border: 0px; text-align: center;" colspan="12"> -->
			<!-- 					<nav aria-label="Page navigation example"> -->
			<!-- 						<ul class="pagination"> -->
			<!-- 							<li class="page-item"><a class="page-link" href="#" -->
			<!-- 								aria-label="Previous"> <span aria-hidden="true">&laquo;</span> -->
			<!-- 							</a></li> -->
			<!-- 							<li class="page-item"><a class="page-link" href="#">1</a></li> -->
			<!-- 							<li class="page-item"><a class="page-link" href="#">2</a></li> -->
			<!-- 							<li class="page-item"><a class="page-link" href="#">3</a></li> -->
			<!-- 							<li class="page-item"><a class="page-link" href="#" -->
			<!-- 								aria-label="Next"> <span aria-hidden="true">&raquo;</span> -->
			<!-- 							</a></li> -->
			<!-- 						</ul> -->
			<!-- 					</nav> -->
			<!-- 				</td> -->
			<!-- 			</tr> -->
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