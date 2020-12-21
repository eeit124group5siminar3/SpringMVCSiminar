<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> --%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<title>農郁-商品管理</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- <link rel="stylesheet" -->
<!--  href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"> -->
<link rel="stylesheet" href="css/fontawesome-free/all.min.css">
<!-- <link rel="stylesheet" -->
<!--  href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"> -->



<link rel="stylesheet" href="css/dist/adminlte.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/mall.css">
</head>
<body class="goto-here">

	<div class="modal fade" id="insert" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel1" aria-hidden="true" style="left: 0">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content" style="width: 640px">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel1">
						商品資料新增
						&nbsp;<font style="font-size: 12px">
						<a href="#checkoutContent" onclick="fastInput1()">波菜</a>&nbsp;
						<a href="#checkoutContent" onclick="fastInput2()">地瓜</a>&nbsp;
						<a href="#checkoutContent" onclick="fastInput3()">栗子南瓜</a>&nbsp;
						<a href="#checkoutContent" onclick="fastInput4()">包種茶</a>&nbsp;
						<a href="#checkoutContent" onclick="fastInput5()">西瓜</a>&nbsp;
							</font>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="insertFormContent" style="width: 640px">

				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" form="insertForm">新增</button>
					<button type="reset" class="btn btn-primary" form="insertForm" onclick="loadImageFile(event)">重置</button>					
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">關閉</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="update" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content" style="width: 640px">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel2">商品資料修改</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="updateFormContent" style="width: 640px">

				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" form="updaeteForm">修改</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">關閉</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../header.jsp" />
<!-- 	END nav	END nav -->

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_1.jpg');" id="product_top">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span>
					</p>
					<h1 class="mb-0 bread">商品管理</h1>
				</div>
			</div>
		</div>
	</div>
			<p style="text-align:center;height:90px" ><font color='red' size='3' id="errMsgs"> ${ErrMsg} </font></p>
<jsp:include page="../sidebar.jsp" />
	<section class="ftco-section content-wrapper" id="managementContent" style="padding-top:0;background-color:#FFFFFF"></section>
	<jsp:include page="../footer.jsp" />


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


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
	<!-- 	<script -->
	<!-- 		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
	<!-- 	<script src="js/google-map.js"></script> -->
	<script src="js/main.js"></script>
	<jsp:include page="../js/mall.jsp" />

	<script>
		$(document).ready(function() {
			var pageNo=1;
			if(${management_pageNo!=null}){
				pageNo=`${management_pageNo}`;				
					}
			$.ajax({
				url : "ManagementContent",
				type : "POST",
				data : {"management_pageNo":pageNo},
				datatype : "html",
				success : function(data, status) {
					$("#managementContent").html(data);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		});
		

		$('#update').on('show.bs.modal', function (event) {
			var tr = $(event.relatedTarget);
			var productId = tr.data('whatever');
			$.ajax({
				url : "Preupdate",
				type : "POST",
				data : {
					"productId":productId	
				},
				datatype : "html",
				success : function(data, status) {
					$("#updateFormContent").html(data);
				},
				error :function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});			
			})
			
		$('#insert').on('show.bs.modal', function (event) {
			$.ajax({
				url : "Preinsert",
				type : "POST",
				datatype : "html",
				success : function(data, status) {
					$("#insertFormContent").html(data);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});			
			})
			
		
	</script>
</body>
</html>