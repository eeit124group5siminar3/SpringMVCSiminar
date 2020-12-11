<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A</title>
</head>
<body>
	<script>

	var websocket = null;
		//判断当前浏览器是否支持WebSocket
		if ('WebSocket' in window) {
			//耶耶=自己，A等於房間通道
			var url = "ws://" + window.location.host +"/siminar/webSocketOneToOne/耶耶,A"
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
			console.log("回调信息",event.data)
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
			document.getElementById('message').innerHTML += innerHTML + '<br/>';
		}
		//关闭WebSocket连接
		function closeWebSocket() {
			websocket.close();
		}
		//发送消息
		function send() {
			var message = document.getElementById('text').value;
			console.log(message);
			//message作为发送的信息，role作为发送的对象标识，socketId是此次会话的标识
			websocket.send(JSON.stringify({'message':message,'role':'哈哈','socketId':"A"}));
		}
	</script>

<input id="text" type="text" />
	<button onclick="send()">发送消息</button>
	<button onclick="closeWebSocket()">关闭WebSocket连接</button>
	<div id="message"></div>



</body>
</html>