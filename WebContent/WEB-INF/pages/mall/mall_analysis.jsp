<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<title>濃郁-產品資料分析</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="css/fontawesome-free/all.min.css">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="css/dist/adminlte.min.css">
<link rel="stylesheet" href="css/style.css">
<srcipt
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></srcipt>
<srcipt
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.min.js"></srcipt>
<srcipt
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.css"></srcipt>
</head>
<body class="hold-transition sidebar-mini goto-here">
	<jsp:include page="../header.jsp" />
	<div class="wrapper" id="analysisPage">
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<a href="index3.html" class="brand-link"> </a>
			<div class="sidebar">
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="info" align="center"><span style="font-size:20px;color:white;margin-bottom:0">歡迎使用!&nbsp;&nbsp;${login_ok.member_name}</span></div>
				</div>
<!-- 				<div class="form-inline"> -->
<!-- 					<div class="input-group" data-widget="sidebar-search"> -->
<!-- 						<input class="form-control form-control-sidebar" type="search" -->
<!-- 							placeholder="Search" aria-label="Search"> -->
<!-- 						<div class="input-group-append"> -->
<!-- 							<button class="btn btn-sidebar"> -->
<!-- 								<i class="fas fa-search fa-fw"></i> -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
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
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>產品銷售</p>
								</a></li>
								<li class="nav-item"><a href="" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>月銷售額</p>
								</a></li>
								<li class="nav-item"><a href="" class="nav-link active">
										<i class="far fa-circle nav-icon"></i>
										<p>訂單數量</p>
								</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</aside>
		<div class="content-wrapper">
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">產品資料分析</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6 navbar">
							<ul class="navbar-nav ml-auto">
								<li class="nav-item"><a class="nav-link"
									data-widget="fullscreen" href="#" role="button"> <i
										class="fas fa-expand-arrows-alt"></i>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="content">
				<canvas id="123" width="200" height="100"></canvas>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
	<script src="js/jquery.min.js"></script>
	<script src="js/plugins/bootstrap.bundle.min.js"></script>
	<script src="js/dist/adminlte.js"></script>
	<script src="js/charts/Chart.min.js"></script>
	<script src="js/dist/demo.js"></script>
	<script src="js/dist/pages/dashboard3.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							var ctx = document.getElementById("123"), example = new Chart(
									ctx,
									{

										type : "bar",
										data : {
											labels : [ "Red", "Green", "Blue" ],
											datasets : [ {
												label : "# of Votes",
												data : [ 12, 19, 3 ],
												backgroundColor : [ "#FF0000",
														"#00FF00", "#0000FF", ],
												borderWidth : 1
											} ]
										}
									});
						});
	</script>
</body>
</html>
