<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function goback() {
		$.ajax({
			url : "MallContent",
			type : "POST",
			data : {
				"categoryId" : `${categoryId}`,
				"pageNo" : `${pageNo}`,
				"searchString" : `${searchString}`
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

	function productCategory(categoryId) {
		$.ajax({
			url : "MallContent",
			type : "POST",
			data : {
				"categoryId" : categoryId,
				"pageNo" : 1
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

	function searchProduct() {
		var searchString = $(".searchString").val();
		var searchString = document.forms[0].elements[0].value;
		$.ajax({
			url : "MallContent",
			type : "POST",
			data : {
				"searchString" : searchString,
				"pageNo" : 1
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

	function page(pageNo) {
		$.ajax({
			url : "MallContent",
			type : "POST",
			data : {
				"pageNo" : pageNo
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

	function add_To_Cart(productId,stock,qty) {
		if (stock<=qty) {
			alert("購買超過庫存量");
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
	
	function notEnough() {
		alert("庫存量不足");
	}
</script>