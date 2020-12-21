<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
function singleProduct() {
// 	event.stopPropagation();
		var product = $('#productList').val();
		$.ajax({
			url : "SelectProduct",
			type : "POST",
			data : {
				"product" : product
			},
			datatype : "html",
			success : function(data, status) {
				chart.data.datasets[1].label = product + "的營業額";
				chart.data.datasets[1].data = data;
				chart.update();
			},
			error : function(data, status) {
				chart.data.datasets[1].label = product + "的營業額";
				chart.data.datasets[1].data = data;
				chart.update();
			}
		});
	}

function monthlyProduct() {
// 	event.stopPropagation();
	var lastMonthOf = $('#lastMonthOf').val();
	var monthName=$('#lastMonthOf').find(':selected').text();
	$.ajax({
		url : "ProductSales",
		type : "POST",
		data : {
			"lastMonthOf" : lastMonthOf
		},
		datatype : "html",
		success : function(data, status) {
			console.log(data);
			chart.data.labels=data.productList
			chart.data.datasets[0].label = monthName+'各項商品的營業額'
			chart.data.datasets[0].data = data.sales;
			chart.update();
		},
		error : function(data, status) {
			chart.data.labels=data.productList
			chart.data.datasets[0].label = monthName+'各項商品的營業額'
			chart.data.datasets[0].data = data.sales;
			chart.update();
		}
	});
}

</script>