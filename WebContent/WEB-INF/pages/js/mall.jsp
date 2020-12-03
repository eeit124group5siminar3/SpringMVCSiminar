<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
// 返回頁面
	function goback() {
		$.ajax({
			url : "MallContent",
			type : "POST",
			data : {
				"mall_categoryId" : `${mall_categoryId}`,
				"mall_pageNo" : `${mall_pageNo}`,
				"mall_searchString" : `${mall_searchString}`
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
// 設定種類
	function productCategory(categoryId) {
		$.ajax({
			url : "MallContent",
			type : "POST",
			data : {
				"mall_categoryId" : categoryId,
				"mall_pageNo" : 1
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
// 模糊查詢
	function searchProduct() {	
		var searchString = document.forms[0].elements[0].value;
		$.ajax({
			url : "MallContent",
			type : "POST",
			data : {
				"mall_searchString" : searchString,
				"mall_pageNo" : 1
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
// 商城頁面
	function page(pageNo) {
		$.ajax({
			url : "MallContent",
			type : "POST",
			data : {
				"mall_pageNo" : pageNo
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
// 單一商品頁面
	function singleProduct(productId) {
		$.ajax({
			url : "SingleProduct",
			type : "POST",
			data : {
				"productId" : productId
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
// 加入購物車
	function addToCart(stock) {
		var qty = $("#quantity").val();
		if (stock<qty) {
			alert("購買超過庫存量");
		} else {
		$.ajax({
			url : "SingleProduct",
			type : "POST",
			data : {
				"qty" : qty,
				"productId" : `${selectedProduct.productId}`
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
// 在購物車中加1
	function add_To_Cart(productId,stock,qty) {
		if (stock<=qty) {
			alert("購買超過庫存量 : "+stock);
		} else {
			var form = $('<form></form>');
			var action = '<c:url value="/AddToCart" />';
			form.attr('action', action);
			form.attr('method', 'post');
			form.attr('target', '_self');
			var my_input1 = $('<input type="hidden" name="qty" />');
			my_input1.attr('value', 1);
			var my_input2 = $('<input type="hidden" name="productId" />');
			my_input2.attr('value', productId);
			form.append(my_input1);
			form.append(my_input2);
			$(document.body).append(form);
			console.log(form.attr("action"));
			form.submit();
		}
	}
// 取消商品訂購
	function reduceItem(productId){
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
// 庫存不足	
	function notEnough() {
		alert("庫存量不足");
	}
// 改變購買數量
	function changeQty(event,productId,stock,bQty){
		var qty = event.path[0].value;
		if(qty>stock){
			event.path[0].value=bQty
			alert("購買超過庫存量 : "+stock);
			}else
		$.ajax({
			url : "ChangeQty",
			type : "POST",
			data : {
				"productId" : productId,
				"qty":qty
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
//  訂單頁面
function orderPage(pageNo) {
	$.ajax({
		url : "OrderContent",
		type : "POST",
		data : {"order_pageNo":pageNo},
		datatype : "html",
		success : function(data, status) {
			$("#orderContent").html(data);
		},
		error : function(data, status) {
			$("#orderContent").html(data);
		}
	});
}
//  訂單詳細資料
function orderDetail(orderId) {
	$.ajax({
		url : "OrderDetail",
		type : "POST",
		data : {"orderId":orderId},
		datatype : "html",
		success : function(data, status) {
			$("#orderContent").html(data);
		},
		error : function(data, status) {
			$("#orderContent").html(data);
		}
	});
}
// 商品管理頁面
function managementPage(pageNo) {
	$.ajax({
		url : "ManagementContent",
		type : "POST",
		data : {"management_pageNo":pageNo},
		datatype : "html",
		success : function(data, status) {
			$("#managementContent").html(data);
		},
		error : function(data, status) {
			$("#managementContent").html(data);
		}
	});
}
// 訂單管理頁面
function manageOrderPage(pageNo) {
	$.ajax({
		url : "ManageOrderContent",
		type : "POST",
		data : {"manageOrder_pageNo":pageNo},
		datatype : "html",
		success : function(data, status) {
			$("#manageOrderContent").html(data);
		},
		error : function(data, status) {
			$("#manageOrderContent").html(data);
		}
	});
}
//管理訂單狀態
function orderManagement(event,orderStatus){
	event.stopPropagation(); 
	var yes=confirm("狀態改變為不可逆");
	var orderDetailId=event.path[1].id;
	if(yes){
	$.ajax({
		url : "OrderManagement",
		type : "POST",
		data : {
			"orderDetailId" : orderDetailId,
			"status" : orderStatus
		},
		success : function(data, status) {
			event.path[1].innerHTML=data;
		},
		error : function(data, status) {
			event.path[1].innerHTML=data;
		}	
		});	

	}else{
		$.ajax({
			url : "OrderManagement",
			type : "POST",
			data : {
				"orderDetailId" : orderDetailId
			},
			success : function(data, status) {
				event.path[1].innerHTML=data;
			},
			error : function(data, status) {
				event.path[1].innerHTML=data;
			}	
			});	
		}
	}
</script>