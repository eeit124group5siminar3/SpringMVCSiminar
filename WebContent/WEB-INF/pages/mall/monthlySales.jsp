<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1 class="m-0">
					產品資料分析&nbsp;&nbsp;&nbsp;選擇商品:<span id="productTag"></span>
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
	<canvas id="monthlySales" width="400" height="200"></canvas>
</div>


<script src="js/jquery.min.js"></script>
<script src="js/plugins/bootstrap.bundle.min.js"></script>
<script src="js/dist/adminlte.js"></script>
<script src="js/dist/demo.js"></script>
<jsp:include page="../js/mallAnalysis.jsp" />
<script>
	var chart;
	$(document).ready(function() {
		$.ajax({
			url : "MonthlySales",
			type : "POST",
			datatype : "html",
			success : function(data, status) {
				var month = data.month;
				var sales = data.sales;
				var salesForAll = data.salesForAll;
				var productTag = data.productTag;
				var ctx = document.getElementById('monthlySales').getContext(
						'2d');
				$("#productTag").html(productTag);
				chart = new Chart(ctx, {
					type : 'bar',
					data : {
						// 要呈現的資料
						labels : month, // 水平軸
						datasets : [ {
							label : '我的營業額', // 資料的標題標籤
							data : sales,
							backgroundColor : 'red',
							borderColor : 'black',
							borderWidth : 1
						}, {
							label : '全站平均營業額',
							data : salesForAll,
							backgroundColor : 'blue',
							borderColor : 'black',
							borderWidth : 1
						} ]
					},
					options : {
						title : {
							display : true,
							text : '前半年月營業額',
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
				var month = data.month;
				var sales = data.sales;
				var salesForAll = data.salesForAll;
				var productTag = data.productTag;
				var ctx = document.getElementById('monthlySales').getContext(
						'2d');
				$("#productTag").html(productTag);
				chart = new Chart(ctx, {
					type : 'bar',
					data : {
						// 要呈現的資料
						labels : month, // 水平軸
						datasets : [ {
							label : '我的營業額', // 資料的標題標籤
							data : sales,
							backgroundColor : 'red',
							borderColor : 'black',
							borderWidth : 1
						}, {
							label : '全站平均營業額',
							data : salesForAll,
							backgroundColor : 'blue',
							borderColor : 'black',
							borderWidth : 1
						} ]
					},
					options : {
						title : {
							display : true,
							text : '前半年月營業額',
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

// 	function singleProduct() {
// 		var product = $('#productList').val();
// 		$.ajax({
// 			url : "SelectProduct",
// 			type : "POST",
// 			data : {
// 				"product" : product
// 			},
// 			datatype : "html",
// 			success : function(data, status) {
// 				chart.data.datasets[1].label = product + "的營業額";
// 				chart.data.datasets[1].data = data;
// 				chart.update();
// 			},
// 			error : function(data, status) {
// 				chart.data.datasets[1].label = product + "的營業額";
// 				chart.data.datasets[1].data = data;
// 				chart.update();
// 			}
// 		});
// 	}
</script>