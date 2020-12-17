<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    

	

			
	<div class="container">
	<div class="row">
	 <div id="Smallchat">
    <div class="Layout Layout-open Layout-expand Layout-right" style="background-color: #3F51B5;color: rgb(255, 255, 255);opacity: 5;border-radius: 10px;">
      <div class="Messenger_messenger">
        <div class="Messenger_header" style="background-color: rgb(22, 46, 98); color: rgb(255, 255, 255);">
          <h4 class="Messenger_prompt" style="color:white">聯絡客服</h4> <span class="chat_close_icon"><i class="fa fa-window-close" aria-hidden="true"></i></span> </div>
        <div class="Messenger_content">
        
        
          <div class="Messages">
            <div class="Messages_list" style="color:black"></div>
            <div id="message1" style="color:black">
            </div>
          </div>
          
          <div class="Input Input-blank">
          <input id="text" type="text" class="Input_field" placeholder="請輸入訊息..." style="height: 20px;" />
          
<!--             <textarea class="Input_field" placeholder="Send a message..." style="height: 20px;"></textarea> -->
           
            <button class="Input_button Input_button-send" id="send_message" onclick="send()">
              <div class="Icon" style="width: 18px; height: 18px;">
                <svg width="57px" height="54px" viewBox="1496 193 57 54" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="width: 18px; height: 18px;">
                  <g id="Group-9-Copy-3" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(1523.000000, 220.000000) rotate(-270.000000) translate(-1523.000000, -220.000000) translate(1499.000000, 193.000000)">
                    <path d="M5.42994667,44.5306122 L16.5955554,44.5306122 L21.049938,20.423658 C21.6518463,17.1661523 26.3121212,17.1441362 26.9447801,20.3958097 L31.6405465,44.5306122 L42.5313185,44.5306122 L23.9806326,7.0871633 L5.42994667,44.5306122 Z M22.0420732,48.0757124 C21.779222,49.4982538 20.5386331,50.5306122 19.0920112,50.5306122 L1.59009899,50.5306122 C-1.20169244,50.5306122 -2.87079654,47.7697069 -1.64625638,45.2980459 L20.8461928,-0.101616237 C22.1967178,-2.8275701 25.7710778,-2.81438868 27.1150723,-0.101616237 L49.6075215,45.2980459 C50.8414042,47.7885641 49.1422456,50.5306122 46.3613062,50.5306122 L29.1679835,50.5306122 C27.7320366,50.5306122 26.4974445,49.5130766 26.2232033,48.1035608 L24.0760553,37.0678766 L22.0420732,48.0757124 Z" id="sendicon" fill="#96AAB4" fill-rule="nonzero"></path>
                  </g>
                </svg>
              </div>
            </button>
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

			<c:if test="${empty login_ok}">
				<input id="member_name" type="hidden" value="訪問者">
			</c:if>
			<c:if test="${!empty login_ok}">
				<input id="member_name" type="hidden" value="${login_ok.member_name}">
			</c:if>
			
			
			
			<script src="https://kit.fontawesome.com/4a5fa9ba76.js" crossorigin="anonymous"></script>


<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
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
	var name = $("#member_name").val();

	var rand="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789";
	var user_rand='';
	for (var i=0;i<5;i++){
		user_rand += rand.charAt(Math.floor(Math.random()*rand.length))
	}

	if(name == "訪問者"){
		name = name+user_rand
	}
	console.log(name);
	
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
			var url = "ws://" + window.location.host +"/siminar/webSocketOneToOne/"+name+",A"
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
			setMessageInnerHTML("與客服連線成功");
		}
		//接收到消息的回调方法
		websocket.onmessage = function(event) {
			setMessageInnerHTML(event.data);
		}
		//连接关闭的回调方法
		websocket.onclose = function() {
			setMessageInnerHTML("客服系統已關閉");
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
			//message作为发送的信息，role作为发送的对象标识，socketId是此次会话的标识
			websocket.send(JSON.stringify({'message':message,'role':'管理員','socketId':"A"}));
		}
	</script>


<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>