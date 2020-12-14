<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1 class="m-0">
					產品資料分析&nbsp;&nbsp;&nbsp;選擇月份:<span id="monthTag"></span>
				</h1>
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
<div class="content chart-container" style="height: 40vh">
	<canvas id="productOrders" width="400" height="200"></canvas>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/plugins/bootstrap.bundle.min.js"></script>
<script src="js/dist/adminlte.js"></script>
<script src="js/dist/demo.js"></script>
<jsp:include page="../js/mallAnalysis.jsp" />
<script>
	var chart;
	$(document).ready(
			function() {
				$.ajax({
					url : "ProductOrders",
					type : "POST",
					data : {
						"lastMonthOf" : 0
					},
					datatype : "html",
					success : function(data, status) {
						var productList = data.productList;
						var orders = data.orders;
						var monthTag = data.monthTag;
						var ctx = document.getElementById('productOrders')
								.getContext('2d');
						$("#monthTag").html(monthTag);
						chart = new Chart(ctx, {
							type : 'bar',
							data : {
								// 要呈現的資料
								labels : productList, // 水平軸
								datasets : [ {
									label : '本月各項商品的訂單數', // 資料的標題標籤
									data : orders,
									backgroundColor : [ "#FF0000", "#46A3FF",
											"#FF9224", "#B766AD", "#FFFF37",
											"#4DFFFF", "#FF44FF", "#A8FF24",
											"#B87070", "#796400", "#02C874" ],
									borderColor : 'black',
									borderWidth : 1
								} ]
							},
							options : {
								title : {
									display : true,
									text : '單月產品訂單數',
									fontColor : 'blue',
									fontSize : '24',
									position : 'bottom',
								},
								legend : { // 資料標籤的位置
									display : true,
									position : 'bottom'
								},
								animation : {
									duration : 1000,
									easing : 'easeOutQuart'
								}
							}
						});
					},
					error : function(data, status) {
						var productList = data.productList;
						var orders = data.orders;
						var monthTag = data.monthTag;
						var ctx = document.getElementById('productSales')
								.getContext('2d');
						$("#monthTag").html(monthTag);
						chart = new Chart(ctx, {
							type : 'bar',
							data : {
								// 要呈現的資料
								labels : productList, // 水平軸
								datasets : [ {
									label : '本月各項商品的訂單數', // 資料的標題標籤
									data : orders,
									backgroundColor : [ "#FF0000", "#46A3FF",
											"#FF9224", "#B766AD", "#FFFF37",
											"#4DFFFF", "#FF44FF", "#A8FF24",
											"#B87070", "#796400", "#02C874" ],
									borderColor : 'black',
									borderWidth : 1
								} ]
							},
							options : {
								title : {
									display : true,
									text : '單月產品訂單數',
									fontColor : 'blue',
									fontSize : '24',
									position : 'bottom',
								},
								legend : { // 資料標籤的位置
									display : true,
									position : 'bottom'
								},
								animation : {
									duration : 1000,
									easing : 'easeOutQuart'
								}
							}
						});
					}
				})
			})

	function monthlyProduct() {
		var lastMonthOf = $('#lastMonthOf').val();
		var monthName=$('#lastMonthOf').find(':selected').text();
		$.ajax({
			url : "ProductOrders",
			type : "POST",
			data : {
				"lastMonthOf" : lastMonthOf
			},
			datatype : "html",
			success : function(data, status) {
				console.log(data);
				chart.data.labels=data.productList
				chart.data.datasets[0].label = monthName+'各項商品的訂單數'
				chart.data.datasets[0].data = data.orders;
				chart.update();
			},
			error : function(data, status) {
				chart.data.labels=data.productList
				chart.data.datasets[0].label = monthName+'各項商品的訂單數'
				chart.data.datasets[0].data = data.orders;
				chart.update();
			}
		});
	}
</script>