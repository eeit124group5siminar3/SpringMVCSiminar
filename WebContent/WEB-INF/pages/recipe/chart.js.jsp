<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>農郁</title>
<meta charset="utf-8">
<script type="text/javascript">
$(function(){
	
	var an1 = JSON.parse($("#an1").val());
	var an2 = JSON.parse($("#an2").val());
	var datas1=[];var datas2=[];
	var labels=["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
	
	for(var num=0;num<an1.length;num++){
		datas1.push(an1[num]);
	}
	for(var num=0;num<an2.length;num++){
		datas2.push(an2[num]);
	}
	var ctx =document.getElementById("orderChart").getContext("2d");
		data = {
			datasets: [{
						label:"已服务订单量",
						data: datas1,
						backgroundColor:"#FF6666"
					},
					{
						label:"未服务订单量",
						data: datas2,
						backgroundColor:"#C8C8C8"
					}
					],
			labels: labels
			};
	var options = {
		responsive:true,
		maintainAspectRatio:false
	};
	//var orderChart =new Chart(ctx).Bar(data, options);
	var orderChart = new Chart(ctx,{
		type: 'bar',
		data: data,
		options:options
	});
	//所有订单柱状图
	var anAll = JSON.parse($("#anAll").val());
	var dataAll=[];
	var labels2=["零申报","做账及报税","线下业务","公司账务初始化"];
	for(var num=0;num<anAll.length;num++){
		dataAll.push(anAll[num]);
	}
	var ctx2 =document.getElementById("orderTypeChart").getContext("2d");
		data2 = {
			datasets: [{
						label:"订单发生总量",
						data: dataAll,
						backgroundColor:"#66FFFF"
					}
					],
			labels: labels2
			};
	var options2 = {
		responsive:true,
		maintainAspectRatio:false
	};
	var orderTypeChart = new Chart(ctx2,{
		type: 'bar',
		data: data2,
		options:options2
	});
	
});

</script>
</head>
<body>
<div class="bar-chart" style="width:500px !important;height:400px!important;float:left;posttion:relative">
		<h5 class="bar-title">XXX当前周订单量一览表</h5>
		<canvas id="orderChart" width="400" height="400"></canvas>
	</div>
	<div class="bar-chart" style="width:500px !important;height:400px!important;float:left;posttion:relative">
		<h5 class="bar-title">XXX订单分类总量一览表</h5>
		<canvas id="orderTypeChart" width="400" height="400"></canvas>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
</body>
</html>