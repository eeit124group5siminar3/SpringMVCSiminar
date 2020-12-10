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
//來去逛逛
  function goShopping(memberNo) {
   $.ajax({
	url : "ProductContent",
	type : "POST",
	data : {
		"memberNo" : memberNo
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
 //返回
	function goback() {
		$.ajax({
			url : "SellerContent",
			type : "POST",
			data : {

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
    //查詢單筆商品
	function goProduct(productId) {
		
		$.ajax({
			url : "ProductNews",
			type : "POST",
			data : {
				"productId" :productId
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
	// 庫存不足	
	function notEnough() {
		alert("庫存量不足");
	}
	
	//加入購物車
	function addToCart(quantity) {
		var qty = $("#quantity").val();
		if (quantity<qty) {
			alert("購買超過庫存量");
		} else {
		$.ajax({
			url : "ProductNews",
			type : "POST",
			data : {
				"qty" : qty,
				"productId" : `${oneProduct.productId}`
			},
			success : function(data, status) {
				$("#mainContent").html(data);
			},
			error : function(data, status) {
				$("#mainContent").html(data);
			}
		});
		}
	}

	// 取消商品訂購
	function removeItem(productId) {
		$.ajax({
			url : "DeleteOrder",
			type : "POST",
			data : {
				"productId" : productId
			},
			datatype : "html",
			success : function(data, status) {
				$("#cartContent").html(data);
			},
			error : function(data, status) {
				$("#cartContent").html(data);
			}
		});
	}

	// 改變購買數量
	function changeQty(event, productId, stock, bQty) {
		var qty = event.path[0].value;
		if (qty > stock) {
			event.path[0].value = bQty
			alert("購買超過庫存量 : " + stock);
		} else
			$.ajax({
				url : "ChangeQty",
				type : "POST",
				data : {
					"productId" : productId,
					"qty" : qty
				},
				datatype : "html",
				success : function(data, status) {
					$("#cartContent").html(data);
				},
				error : function(data, status) {
					$("#cartContent").html(data);
				}
			});
	}
</script>