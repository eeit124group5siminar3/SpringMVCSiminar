
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1 no-cache不能存快取
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<head>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
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
<title>後臺管理</title>
<style>
#project {
	width: 150px;
	position: absolute;
	font-weight: bold;
	top: 150px;
	left: 15px;
	color: white;
	display: block;
}

.active {
	height: 400px;
	width: 1100px;
}

#carousel {
	height: 400px;
	width: 1300px;
}
</style>
<script>
window.onload=function(){
	var up = document.getElementById("up_data");
	var sel = document.getElementById("sel_evaluation");
	var page = document.getElementById("backstage_page");
	up.onclick = function() {
		// ajax的同步請求
		// 步驟一: 新建XMLHttpRequest物件
		var xhr = new XMLHttpRequest();
		// 步驟二: 經由AJAX提出HTTP請求
		if (xhr != null) {
			xhr.onreadystatechange = function(){
				if (xhr.readyState === 4) {
					// 伺服器回應成功
					if (xhr.status === 200) {
						// 收到伺服器的回應
						page.innerHTML="555555555555555555555555555555555555555";
					}
				}	
			}
			xhr.open('GET', "<c:url value='/memberUpdate.controller' />", true);
			xhr.send();
		} else {
			page.innerHTML = "<h3>您的瀏覽器不支援Ajax</h3>";
		}
	}
}   
</script>
</head>
<body>
	<jsp:include page="/top.jsp" />
	<form>

		<!-- ----------左邊項目---------- -->

		<div id="project">
			<div style="margin-left: 25px">
				<button type="button" class="btn btn-info" data-toggle="collapse"
					data-target="#demo">會員管理</button>
				<div id="demo" class="collapse">
					<li><a id="up_data" href="">資料修改</a></li>
					<li><a id="sel_evaluation" href="">評價查詢</a></li>
				</div>
			</div>
			<br> <br>
			<div style="margin-left: 25px">
				<button type="button" class="btn btn-info" data-toggle="collapse"
					data-target="#demo1">商城管理</button>
				<div id="demo1" class="collapse">
					<li><a href="">????</a></li>
					<li><a href="">????</a></li>
				</div>
			</div>
			<br> <br>
			<div style="margin-left: 25px">
				<button type="button" class="btn btn-info" data-toggle="collapse"
					data-target="#demo2">市場管理</button>
				<div id="demo2" class="collapse">
					<li><a href="">????</a></li>
					<li><a href="">????</a></li>
				</div>
			</div>
			<br> <br>
			<div style="margin-left: 25px">
				<button type="button" class="btn btn-info" data-toggle="collapse"
					data-target="#demo3">食譜管理</button>
				<div id="demo3" class="collapse">
					<li><a href="">????</a></li>
					<li><a href="">????</a></li>
				</div>
			</div>
			<br> <br>
			<div style="margin-left: 25px">
				<button type="button" class="btn btn-info" data-toggle="collapse"
					data-target="#demo4">活動管理</button>
				<div id="demo4" class="collapse">
					<li><a href="" />????</li>
					<li><a href="" />????</li>
				</div>
			</div>
		</div>
		<!-- ----------------------------------------- -->
		<div align="center" id="backstage_page">
			<!-- ----------輪播圖---------- -->
			<div id="carousel" class="container">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img height="400px" src="<c:url value='/images/farm.jpg'  />"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img height="400px"
								src="<c:url value='/images/vegetables.jpg'  />"
								class="d-block w-100" alt="...">

						</div>
						<div class="carousel-item">
							<img height="400px" src="<c:url value='/images/recipe.jpg'  />"
								class="d-block w-100" alt="...">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<br>
			<!-- ----------------------------------------- -->
			<table align="center">
				<tr>
					<td width="600"><font size="6">標題</font></td>
					<td width="250"><font size="6">發布日期</font></td>
				</tr>
				<tr>
					<td><font size="4">測試</font></td>
					<td><font size="4">2020/11/11</font></td>
				</tr>
				<tr>
					<td><font size="4">測試1</font></td>
					<td><font size="4">1911/05/22</font></td>
				</tr>
				<tr>
					<td><font size="4">測試2</font></td>
					<td><font size="4">1950/08/09</font></td>
				</tr>
			</table>
		</div>


	</form>
</body>
</html>