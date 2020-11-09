
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
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

#backstage_page{
    position: absolute;
    top: 200px;
    left: 350px;
    right:50px;
    text-align: center;
}

.hyperlink{
 color: #2828FF;
}

.hyperlink:hover{
 color: #004B97;
 text-decoration:underline;
 cursor: pointer;
}
</style>
<script>
	window.onload = function() {
		var up = document.getElementById("up_data");
		var sel = document.getElementById("sel_evaluation");
		var recipe = document.getElementById("recipe_backstage");
		// 		var sel = document.getElementById("sel_evaluation");
		up.onclick = function() {
			var xmlhttp;
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					document.getElementById("backstage_page").innerHTML = xmlhttp.responseText;
				}
			}
			xmlhttp.open("POST", "<c:url value='/memberUpdate.controller' />",true);
			xmlhttp.send();
		}
		sel.onclick = function() {
			var xmlhttp;
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					document.getElementById("backstage_page").innerHTML = xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET", "<c:url value='/memberEvaluation.controller' />",true);
			xmlhttp.send();
		}
		recipe.onclick = function() {
			var xmlhttp;
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					document.getElementById("backstage_page").innerHTML = xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET", "<c:url value='/frontPage.controller' />",true);
			xmlhttp.send();
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
					data-target="#demo" >會員管理</button>
				<div id="demo" class="collapse">
				<br>
					<li align="left"><a id="up_data" class="hyperlink">資料修改</a></li>
					<li align="left"><a id="sel_evaluation" class="hyperlink">評價查詢</a></li>
				</div>
			</div>
			<br> <br>
			<div style="margin-left: 25px">
				<button type="button" class="btn btn-info" data-toggle="collapse"
					data-target="#demo1">商城管理</button>
				<div id="demo1" class="collapse">
					<li align="left"><a class="hyperlink">????</a></li>
					<li align="left"><a class="hyperlink">????</a></li>
				</div>
			</div>
			<br> <br>
			<div style="margin-left: 25px">
				<button type="button" class="btn btn-info" data-toggle="collapse"
					data-target="#demo2">市場管理</button>
				<div id="demo2" class="collapse">
					<li align="left"><a class="hyperlink">????</a></li>
					<li align="left"><a class="hyperlink">????</a></li>
				</div>
			</div>
			<br> <br>
			<div style="margin-left: 25px">
				<button type="button" class="btn btn-info" data-toggle="collapse"
					data-target="#demo3">食譜管理</button>
				<div id="demo3" class="collapse">
					<li align="left"><a id="recipe_backstage" class="hyperlink">食譜新增</a></li>
					<li align="left"><a class="hyperlink">食譜修改</a></li>
				</div>
			</div>
			<br> <br>
			<div style="margin-left: 25px">
				<button type="button" class="btn btn-info" data-toggle="collapse"
					data-target="#demo4">活動管理</button>
				<div id="demo4" class="collapse">
					<li align="left"><a class="hyperlink">????</a></li>
					<li align="left"><a class="hyperlink">????</a></li>
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