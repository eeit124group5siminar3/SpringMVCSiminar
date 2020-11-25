<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後臺管理</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
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
</style>
  </head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="#">農郁</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> 列表
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="<c:url value='adminBackstage.controller' />" class="nav-link">回首頁</a></li>
	          <li class="nav-item dropdown">
              <a class="nav-link dropdown-tgogle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">平台管理</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="<c:url value='goManageMembers.controller'/>">會員管理</a>
              	<a class="dropdown-item" href="#">商城管理</a>
                <a class="dropdown-item" href="#">活動管理</a>
                <a class="dropdown-item" href="#">食譜管理</a>
                <a class="dropdown-item" href="#">市集管理</a>
              </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-tgogle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">電子簽核</a>
        <div class="dropdown-menu" aria-labelledby="dropdown04">
          <a class="dropdown-item" href="#">簽核管理</a>
        </div>
</li>
<li class="nav-item dropdown">
  <a class="nav-link dropdown-tgogle" href="123.html" id="dropdown04" aria-haspopup="true" aria-expanded="false">出勤管理</a>
  <div class="dropdown-menu" aria-labelledby="dropdown04">
    <a class="dropdown-item" href="#">打卡作業</a>
    <a class="dropdown-item" href="#">補卡作業</a>
    <a class="dropdown-item" href="#">請假登錄</a>
    <a class="dropdown-item" href="#">加班登錄</a>
  </div>
</li>
<li class="nav-item dropdown">
  <a class="nav-link dropdown-tgogle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">部門管理</a>
  <div class="dropdown-menu" aria-labelledby="dropdown04">
    <a class="dropdown-item" href="#">公佈欄</a>
  </div>
</li>
<li class="nav-item dropdown">
  <a class="nav-link dropdown-tgogle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">人事管理</a>
  <div class="dropdown-menu" aria-labelledby="dropdown04">
    <a class="dropdown-item" href="#">員工基本資料</a>
    <a class="dropdown-item" href="#">考勤紀錄</a>
  </div>
</li>
			<!-- <li class="nav-item"><a href="product-single.html" class="nav-link">商城</a></li> -->

			  <li class="nav-item"><a href="<c:url value='adminRemoveSession.controller' />" class="nav-link">登出</a></li>
	        </ul>
	      </div>
	    </div>
    </nav>
    <hr>

    <div class="billboard">
    <table>
      <th id="billboard_head" colspan="6"  style="font-size: 50px">        公佈欄</th>
      <tr>
				<td width="1000"><font size="6">標題</font></td>
        <td width="250"><font size="6">發布日期</font></td>
        <td width="250"><font size="6">部門</font></td>

			</tr>
			<tr>
				<td><font size="4">測試</font></td>
        <td><font size="4">2020/11/11</font></td>
        <td><font size="4">白癡部</font></td>

			</tr>
			<tr>
				<td><font size="4">測試1</font></td>
        <td><font size="4">1911/05/22</font></td>
        <td><font size="4">智障部</font></td>
			</tr>
			<tr>
				<td><font size="4">測試2</font></td>
        <td><font size="4">1950/08/09</font></td>
        <td><font size="4">不不部</font></td>
			</tr>
    </table>
    </div>
 











<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>
</body>
</html>