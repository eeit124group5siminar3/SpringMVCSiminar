<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<<script type="text/javascript">
function singleProduct() {
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
</script>