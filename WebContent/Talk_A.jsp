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
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
            </div>
            <div class="srch_bar"></div>
          </div>
          <div class="inbox_chat" id="member_content">
            
          </div>
        </div>
        <div class="mesgs">
          <div class="msg_history">
              <div class="received_msg" id="message1">
              </div>

            
            
            
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" id="text" class="write_msg" placeholder="請輸入訊息..." />
              <button class="msg_send_btn" id="send_message" type="button" onclick="send()"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
      </div>
      
      
<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
<script>
$(function(){
	$("#send_message").on("click",function(){
		var message = $("#text").val();
		var date = new Date();
		var h = date.getHours();  //時
		var minute = date.getMinutes()  //分
		if(minute<10){
			minute = "0"+minute;
		}
		$("#message1").append("<div style='text-align:right';>"+message+"<br>"+"<font style='color:#E0E0E0'>"+h+":"+minute+"</font>"+"</div>");
	});
})
</script>
<script>
var member_name = null;
var content = null;
var websocket = null;

var date = new Date();
var h = date.getHours();  //時
var minute = date.getMinutes()  //分
if(minute<10){
	minute = "0"+minute;
}
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		//耶耶=自己，A等於房間通道
		var url = "ws://" + window.location.host +"/siminar/webSocketOneToOne/管理員,A"
		websocket = new WebSocket(url);
	} else {
		alert('当前浏览器 Not support websocket')
	}
	//连接发生错误的回调方法
	websocket.onerror = function() {
		setMessageInnerHTML("WebSocket连接发生错误");
	};
	//连接成功建立的回调方法
	websocket.onopen = function() {
		setMessageInnerHTML("WebSocket连接成功");
	}
	//接收到消息的回调方法
	websocket.onmessage = function(event) {
		let data_split = event.data.split("說：");
		member_name = data_split[0];
		let new_name = $("#"+member_name).val();
		content = data_split[1];
		console.log("新的名稱"+new_name)
		console.log(member_name)
		console.log("回调信息",event.data)
		
	if(event.data != null && member_name != new_name){
		$("#member_content").append(
		`<div class="chat_list active_chat">
        <div class="chat_people">
          <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
          <div class="chat_ib" id="tttt">
            <h5>\${member_name}</h5>
            <input type="text" id="\${member_name}" value="\${member_name}">
            <p>\${content}</p>
          </div>
        </div>
      </div>`)
	}
	if(member_name == new_name){
		$("#tttt").html(
				`
		            <h5>\${member_name}</h5>
		            <input type="text" id="\${member_name}" value="\${member_name}">
		            <p>\${content}</p>
		         `)
	}

		
		setMessageInnerHTML(event.data);
	}
	//连接关闭的回调方法
	websocket.onclose = function() {
		setMessageInnerHTML("WebSocket连接关闭");
	}
	//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	window.onbeforeunload = function() {
		closeWebSocket();
	}
	//将消息显示在网页上
	function setMessageInnerHTML(innerHTML) {
		document.getElementById('message1').innerHTML += innerHTML + '<br/>'+"<font style='color:#E0E0E0'>"+h+":"+minute+"</font>"+ '<br/>';
	}
	//关闭WebSocket连接
	function closeWebSocket() {
		websocket.close();
	}
	//发送消息
	function send() {
		var message = document.getElementById('text').value;
		console.log(message);
		console.log(member_name);
		//message作为发送的信息，role作为发送的对象标识，socketId是此次会话的标识
		websocket.send(JSON.stringify({'message':message,'role':member_name,'socketId':"A"}));
	}
</script>
    
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </body>
    </html>