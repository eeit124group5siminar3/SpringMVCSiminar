<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>


<html>
<head>
<title>A</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/admin_chatbox.css">


</head>
<body>

      
      
      
     <div class="container">
	<div class="row">
	 <div id="Smallchat" style="width:1000px;">
    <div class="Layout Layout-open-me Layout-expand Layout-right" style="background-color: #3F51B5;color: rgb(255, 255, 255);opacity: 5;border-radius: 10px;">
      <div class="Messenger_messenger">
        <div class="Messenger_header" style="background-color: rgb(22, 46, 98); color: rgb(255, 255, 255);">
          <h4 class="Messenger_prompt" style="color:white">聯絡客服</h4> <span class="chat_close_icon"><i class="fa fa-window-close" aria-hidden="true"></i></span> </div>
        <div class="Messenger_content">
        
        
              <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
            </div>
            <div class="srch_bar"></div>
          </div>
          <div class="inbox_chat" id="member_content"></div><!-- 左邊列表 -->
        </div>
        <div class="mesgs">
          <div class="msg_history"></div><!-- 對話視窗 -->
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" id="text" class="write_msg" placeholder="請輸入訊息..." />
              <button class="msg_send_btn" id="send_message" type="button" onclick="send()"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
      </div>
        

        </div>
      </div>
    </div>
    <!--===============CHAT ON BUTTON STRART===============-->
    <div class="chat_on"> <span class="chat_on_icon"><i class="fa fa-comments" aria-hidden="true"></i></span> </div>
    <!--===============CHAT ON BUTTON END===============-->
  </div>
	</div>
</div>
      
      			<script src="https://kit.fontawesome.com/4a5fa9ba76.js" crossorigin="anonymous"></script>
      
<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

<script>
var websocket = null;
var member_name = null;  //使用者名稱
var content = null;  //使用者訊息內容
var previous_name = "";  //前次使用者名稱
var click_member_name = null;  //點擊左邊列表的當前使用者名稱
var date = new Date();  //時間
var year = date.getFullYear();  //年
var m = date.getMonth()+1;  //月
var day = date.getDate();  //日
var h = date.getHours();  //時
var minute = date.getMinutes();  //分
if(minute<10){  //分鐘小於10分會顯示個位數，所以＋0
	minute = "0"+minute;
}
	//判斷當前瀏覽器能不能使用WebSocket
	if ('WebSocket' in window) {
		//管理員=自己，A等於房間通道
		var url = "ws://" + window.location.host +"/siminar/webSocketOneToOne/管理員,A"
		websocket = new WebSocket(url);
	} else {
		alert("當前瀏覽器無法使用此功能")
	}
	//連接錯誤方法
	websocket.onerror = function() {
		setMessageInnerHTML("");
	};
	//連接成功方法
	websocket.onopen = function() {
		setMessageInnerHTML("客服系統連線成功！");
	}
	//接收後端傳訊息的方法
	websocket.onmessage = function(event) {
		//取訊息的資料
		var event_data = event.data;
		//切割資料
		let data_split = event.data.split("說：");
		member_name = data_split[0];
		let new_name = $("#"+member_name).val();
		content = data_split[1];

		
		//創建左邊列表
	if(event.data != null && member_name != new_name){
		$("#member_content").append(
		`<div class="chat_list active_chat">
        <div class="chat_people">
          <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
          <div class="chat_ib \${member_name}">
            <h5>\${member_name}</h5>
            <input type="hidden" id="\${member_name}" value="\${member_name}">
            <p>\${content}</p>
          </div>
        </div>
      </div>`)

      //動態新增每個使用者的DIV
      $(".msg_history").append("<div style='display:none;color:black' class='received_msg' id=abc"+member_name+"></div>");
	      
      
	}
	//當前使用者的訊息有在左邊列表就html替換
	if(member_name == new_name){
		$("."+member_name).html(
				`
		            <h5>\${member_name}</h5>
		            <input type="hidden" id="\${member_name}" value="\${member_name}">
		            <p>\${content}</p>
		         `)
	}
		setMessageInnerHTML(event.data);

		//點擊左邊列表
	$("."+member_name).on("click",function(){
		//取列表內隱藏input的值
		click_member_name = $(this).find("input").val();
		//顯示當前點擊的訊息
		$("#abc"+click_member_name).css("display","");

		//第一次點擊左邊列表 創建此次點擊的變數值
		if(previous_name == ""){
			previous_name=click_member_name;
		}
		//點擊後隱藏前一次對話窗的div內容
		if(previous_name != click_member_name){
			$("#abc"+previous_name).css("display","none");
		}
		//更新上一次點擊的變數值為此次點擊的變數值
		previous_name=click_member_name;
		})
	
	}

	//訊息送出新增我方訊息
	$("#send_message").on("click",function(){
		var message_content = $("#text").val();
		$("#abc"+click_member_name).append("<div style='text-align:right;color:black';>"+message_content+"<br>"+"<font style='color:#E0E0E0'>"+year+"年"+m+"月"+day+"日"+h+":"+minute+"</font>"+"</div>"+"<br>");

		$("."+click_member_name).find("p").html(message_content);
		
	});


	
	//關閉WebSocket
	websocket.onclose = function() {
		setMessageInnerHTML("");
	}
	//當使用者關閉網站，主動去關閉WebSocket連線，防止server拋出Error
	window.onbeforeunload = function() {
		closeWebSocket();
	}
	//將訊息放在網頁上
	function setMessageInnerHTML(innerHTML) {
		$("#abc"+member_name).append(innerHTML + '<br/>'+"<font style='color:#E0E0E0'>"+year+"年"+m+"月"+day+"日"+h+":"+minute+"</font>"+ '<br/>');
		if(member_name == click_member_name){
			$("#message1").append(innerHTML + '<br/>'+"<font style='color:#E0E0E0'>"+year+"年"+m+"月"+day+"日"+h+":"+minute+"</font>"+ '<br/>');
		}
	}
	//關閉WebSocket連線
	function closeWebSocket() {
		websocket.close();
	}
	//將訊息送至後端
	function send() {
		var message = document.getElementById('text').value;
		console.log(message);
		console.log(member_name);
		//message作为发送的信息，role作为发送的对象标识，socketId是此次会话的标识
		websocket.send(JSON.stringify({'message':message,'role':click_member_name,'socketId':"A"}));
	}
</script>
<script>
$(document).ready(function(){
    $(".chat_on").click(function(){
        $(".Layout").toggle();
        $(".chat_on").hide(300);
    });
    
       $(".chat_close_icon").click(function(){
        $(".Layout").hide();
           $(".chat_on").show(300);
    });
})
</script>
    
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </body>
    </html>