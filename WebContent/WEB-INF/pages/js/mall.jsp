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

	function productCategory(categoryId){
		$.ajax({
			url : "MallContent",
			type : "POST",
			data : {"categoryId":categoryId,"pageNo":1},
			datatype : "html",
			success : function(data, status) {
				$("#mainContent").html(data);
			},
			error : function(data, status) {
				$("#mainContent").html(data);
			}
		});
	}

	function searchProduct(){
		var searchString=$(".searchString").val();
		var searchString = document.forms[0].elements[0].value;
		$.ajax({
			url : "MallContent",
			type : "POST",
			data : {"searchString":searchString,"pageNo":1},
			datatype : "html",
			success : function(data, status) {
				$("#mainContent").html(data);
			},
			error : function(data, status) {
				$("#mainContent").html(data);
			}
		});
	}

	function page(pageNo){
		$.ajax({
			url : "MallContent",
			type : "POST",
			data : {"pageNo":pageNo},
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
			data : {"productId":productId},
			datatype : "html",
			success : function(data, status) {
				$("#mainContent").html(data);
			},
			error : function(data, status) {
				$("#mainContent").html(data);
			}
		});
	}

	function addToCart(){
		var qty=$("#quantity").val();
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
	
	function add_To_Cart(productId){
		var qty=$("#quantity").val();
		$.ajax({
			url : "AddToCart",
			type : "POST",
			data : {
				"qty" : 1,
				"productId" : productId
			},
			success : function(data, status) {
				$("#mainContent").html(data);
			},
			error : function(data, status) {
				$("#mainContent").html(data);
			}
		});
	}

	
</script>