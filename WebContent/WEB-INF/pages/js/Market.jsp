<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
   //-------分頁
	function mPage(marketPageNo) {

		$.ajax({
			url : "SellerContent",
			type : "POST",
			data : {
				"marketPageNo" : marketPageNo
			},
			datatype : "html",
			success : function(data, status) {
				$("#mainContent").html(data);
			},
			error : function(data, status) {
				$("#mainContent").html(data);
			}
		});
	}
// 	//來去逛逛
// 		function goShopping(memberNo) {
// 			console.log("我要進來囉");
// 		$.ajax({
// 			url : "ProductContent",
// 			type : "POST",
// 			data : {
// 				"memberNo" : memberNo
// 			},
// 			datatype : "html",
// 			success : function(data, status) {
// 				$("#mainContent").html(data);
// 			},
// 			error : function(data, status) {
// 				$("#mainContent").html(data);
// 			}
// 		});
// 	}
</script>