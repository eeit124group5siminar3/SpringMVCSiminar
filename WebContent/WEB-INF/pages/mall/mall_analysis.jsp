<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<title>濃郁-產品資料分析</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="css/fontawesome-free/all.min.css">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="css/dist/adminlte.min.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">

</head>
<body class="hold-transition sidebar-mini goto-here">
	<jsp:include page="../header.jsp" />
	<div class="wrapper" id="analysisPage">
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<a href="index3.html" class="brand-link"> </a>
			<div class="sidebar">
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="info" align="center">
						<span style="font-size: 20px; color: white; margin-bottom: 0">歡迎使用!&nbsp;&nbsp;${login_ok.member_name}</span>
					</div>
				</div>
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item menu-open"><a href="#"
							class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									產品資料分析 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview" id="chooseAnalysis">
								<li class="nav-item" onclick="productSales()"><a
									class="nav-link" id="productSalesA"> <i
										class="far fa-circle nav-icon"></i>
										<p>產品銷售</p>
								</a></li>
								<li class="nav-item" onclick="monthlySales()"><a
									class="nav-link" id="monthlySalesA"> <i
										class="far fa-circle nav-icon"></i>
										<p>月營業額</p>
								</a></li>
								<li class="nav-item" onclick="monthlyOrder()"><a
									class="nav-link" id="productOrdersA"> <i
										class="far fa-circle nav-icon"></i>
										<p>訂單數量</p>
								</a></li>
							</ul></li>
							<li class="nav-item"><a href="<c:url value='backstage.controller' />"
							class="nav-link">
								<p>返回會員管理</p>
						</a>
						</li>
					</ul>
				</nav>
			</div>
		</aside>
		<div class="content-wrapper" id="analysisContent">
			<!-- 			<div class="content-header"> -->
			<!-- 				<div class="container-fluid"> -->
			<!-- 					<div class="row mb-2"> -->
			<!-- 						<div class="col-sm-6"> -->
			<!-- 							<h1 class="m-0">產品資料分析&nbsp;&nbsp;&nbsp;選擇商品:<span id="productTag"></h1> -->
			<!-- 						</div> -->
			<!-- 						/.col -->
			<!-- 						<div class="col-sm-6 navbar"> -->
			<!-- 							<ul class="navbar-nav ml-auto"> -->
			<!-- 								<li class="nav-item"><a class="nav-link" -->
			<!-- 									data-widget="fullscreen" href="#" role="button"> <i -->
			<!-- 										class="fas fa-expand-arrows-alt"></i> -->
			<!-- 								</a></li> -->
			<!-- 							</ul> -->
			<!-- 						</div> -->
			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<!-- 			<div class="content chart-container" id="analysisContent" style="height:40vh"> -->
			<!-- 			</div> -->
		</div>
	</div>
	<canvas id="sales-chart" height="200"></canvas>
	<canvas id="visitors-chart" height="200"></canvas>
	<jsp:include page="../footer.jsp" />
	<script src="js/jquery.min.js"></script>
	<script src="js/plugins/bootstrap.bundle.min.js"></script>
	<script src="js/dist/adminlte.js"></script>
	<script src="js/charts/Chart.min.js"></script>
	<script src="js/dist/demo.js"></script>
	<jsp:include page="../js/mallAnalysis.jsp" />
	<script>
		$(document).ready(function() {
			// 			$.ajax({
			// 				url : "MonthlySalesContent",
			// 				async : false,
			// 				type : "POST",
			// 				datatype : "html",
			// 				success : function(data, status) {
			// 					$("#analysisContent").html(data);
			// 				},
			// 				error : function(data, status) {
			// 					$("#analysisContent").html(data);
			// 				}
			// 			});
			productSales();
		});

		function productSales() {
			$.ajax({
				url : "ProductSalesContent",
				async : false,
				type : "POST",
				datatype : "html",
				success : function(data, status) {
					$("#chooseAnalysis").find("a").removeClass("active");
					$("#productSalesA").addClass("active")
					$("#analysisContent").html(data);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		}
		function monthlySales() {
			$.ajax({
				url : "MonthlySalesContent",
				async : false,
				type : "POST",
				datatype : "html",
				success : function(data, status) {
					$("#chooseAnalysis").find("a").removeClass("active");
					$("#monthlySalesA").addClass("active")
					$("#analysisContent").html(data);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		}
		function monthlyOrder() {
			$.ajax({
				url : "ProductOrdersContent",
				async : false,
				type : "POST",
				datatype : "html",
				success : function(data, status) {
					$("#chooseAnalysis").find("a").removeClass("active");
					$("#productOrdersA").addClass("active")
					$("#analysisContent").html(data);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		}
	</script>
</body>
</html>
