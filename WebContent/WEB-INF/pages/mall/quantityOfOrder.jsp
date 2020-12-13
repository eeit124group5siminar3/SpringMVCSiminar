<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<canvas id="quantityOfOrder" width="200" height="100"></canvas>
<script>
	$(document).ready(function() {
		var ctx = document.getElementById("quantityOfOrder");
		 example = new Chart(ctx, {
			type : "bar",
			data : {
				labels : [ "Red", "Green", "Blue" ],
				datasets : [ {
					label : "# of Votes",
					data : [ 12, 19, 3 ],
					backgroundColor : [ "#FF0000", "#00FF00", "#0000FF", ],
					borderWidth : 1
				} ]
			}
		});
	});
</script>