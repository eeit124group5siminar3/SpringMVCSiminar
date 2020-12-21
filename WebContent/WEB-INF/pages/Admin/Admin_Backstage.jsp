<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後臺管理</title>
<!-- 	<link rel="stylesheet" href="css/style.css"> -->
	<link rel="stylesheet" href="css/admin_chatbox.css">
	<link
	href="https://bootstrap.hexschool.com/docs/4.2/dist/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
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
	<jsp:include page="/WEB-INF/pages/testAdminH.jsp" />
	
	<jsp:include page="/WEB-INF/pages/Admin_message.jsp" />


<div align="center">
<img src="images\nungyulogo.png" width="300px" heigh="320px">
<p></p>
<h1 style="font-weight:bold;"><p>歡迎進入農郁後臺管理！</p></h1>

</div>
<!--     <div class="billboard"> -->
<!--     <table> -->
<!--       <th id="billboard_head" colspan="6"  style="font-size: 50px">        公佈欄</th> -->
<!--       <tr> -->
<!-- 				<td width="1000"><font size="6">標題</font></td> -->
<!--         <td width="250"><font size="6">發布日期</font></td> -->
<!--         <td width="250"><font size="6">部門</font></td> -->

<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td><font size="4">測試</font></td> -->
<!--         <td><font size="4">2020/11/11</font></td> -->
<!--         <td><font size="4">白癡部</font></td> -->

<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td><font size="4">測試1</font></td> -->
<!--         <td><font size="4">1911/05/22</font></td> -->
<!--         <td><font size="4">智障部</font></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td><font size="4">測試2</font></td> -->
<!--         <td><font size="4">1950/08/09</font></td> -->
<!--         <td><font size="4">不不部</font></td> -->
<!-- 			</tr> -->
<!--     </table> -->
<!--     </div> -->
 











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