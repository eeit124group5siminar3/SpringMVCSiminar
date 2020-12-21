<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	// 返回頁面
	function goback() {
		var pageNo=1;
		if(${mall_pageNo!=null}){
			pageNo=`${mall_pageNo}`;				
				}
		$.ajax({
			url : "MallContent",
			type : "POST",
			data : {
				"mall_categoryId" : `${mall_categoryId}`,
				"mall_pageNo" : pageNo,
				"mall_searchString" : `${mall_searchString}`
			},
			datatype : "html",
			success : function(data, status) {
				$("#mainContent").html(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
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
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
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
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
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
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
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
			error :function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	// 加入購物車
	function addToCart(stock) {
		var qty = $("#quantity").val();
		if (stock < qty) {
			alert("購買超過庫存量");
		} else {
			$.ajax({
				url : "SingleProduct",
				async : false,
				type : "POST",
				data : {
					"qty" : qty,
					"productId" : `${selectedProduct.productId}`
				},
				success : function(data, status) {
					$("#mainContent").html(data);
				},
				error :function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		}
					var shoppingcartItemNum=$("#shoppingcartItemNum").val();
					console.log(shoppingcartItemNum);	
					$("#shoppingcartItem").html("<span class='icon-shopping_cart'></span>["+shoppingcartItemNum+"]");
	}
	// 在購物車中加1
	function add_To_Cart(productId, stock, qty) {
		if (stock <= qty) {
			alert("購買超過庫存量 : " + stock);
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
	function reduceItem(productId) {
		$.ajax({
			url : "DeleteOrder",
			async : false,
			type : "POST",
			data : {
				"productId" : productId
			},
			datatype : "html",
			success : function(data, status) {
				$("#cartContent").html(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
		var shoppingcartItemNum=$("#shoppingcartItemNum").val();
		console.log(shoppingcartItemNum);	
		$("#shoppingcartItem").html("<span class='icon-shopping_cart'></span>["+shoppingcartItemNum+"]");
	}
	// 庫存不足	
	function notEnough() {
		alert("庫存量不足");
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
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
	}
	//  訂單頁面
	function orderPage(pageNo) {
		$.ajax({
			url : "OrderContent",
			type : "POST",
			data : {
				"order_pageNo" : pageNo
			},
			datatype : "html",
			success : function(data, status) {
				$("#orderContent").html(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	//  訂單詳細資料
	function orderDetail(orderId) {
		$.ajax({
			url : "OrderDetail",
			type : "POST",
			data : {
				"orderId" : orderId
			},
			datatype : "html",
			success : function(data, status) {
				$("#orderContent").html(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	// 商品管理頁面
	function managementPage(pageNo) {
		$.ajax({
			url : "ManagementContent",
			type : "POST",
			data : {
				"management_pageNo" : pageNo
			},
			datatype : "html",
			success : function(data, status) {
				$("#managementContent").html(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	// 訂單管理頁面
	function manageOrderPage(pageNo) {
		$.ajax({
			url : "ManageOrderContent",
			type : "POST",
			data : {
				"manageOrder_pageNo" : pageNo
			},
			datatype : "html",
			success : function(data, status) {
				$("#manageOrderContent").html(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	//管理訂單狀態
	function orderManagement(event, orderStatus) {
		event.stopPropagation();
		var orderDetailId = event.path[1].id;
		if(orderStatus==-1){
		var yes = confirm("一旦拒絕接單，就無法再次接單");		
		if (yes) {
			$.ajax({
				url : "OrderManagement",
				type : "POST",
				data : {
					"orderDetailId" : orderDetailId,
					"status" : orderStatus
				},
				success : function(data, status) {
					event.path[1].innerHTML = data;
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		} else {
			$.ajax({
				url : "OrderManagement",
				type : "POST",
				data : {
					"orderDetailId" : orderDetailId
				},
				success : function(data, status) {
					event.path[1].innerHTML = data;
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		}
		}else{
			$.ajax({
				url : "OrderManagement",
				type : "POST",
				data : {
					"orderDetailId" : orderDetailId,
					"status" : orderStatus
				},
				success : function(data, status) {
					event.path[1].innerHTML = data;
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
			}
	}
	//新增上傳圖片預覽
	function loadImageFile(event) {
		var image = document.getElementById('newImage');
		if (event.target.files && event.target.files[0]) {
			image.src = URL.createObjectURL(event.target.files[0]);
		} else {
			image.src = "<c:url value='retrieveImageServlet?id=&type=PRODUCT' />";
		}
	};
	//修改上傳圖片預覽
	function loadUpdateImageFile(event) {
		var image = document.getElementById('updateImage');
		if (event.target.files && event.target.files[0]) {
			image.src = URL.createObjectURL(event.target.files[0]);
		} else {
			image.src = "<c:url value='retrieveImageServlet?id=${updateBean1.productId}&type=PRODUCT' />";
		}
	};
	//設定願望清單
	function favorite(productId) {
		$
				.ajax({
					url : "SetFavorite",
					type : "GET",
					data : {
						"productId" : productId
					},
					success : function(data, status) {
							console.log(productId);
							console.log(data);
						if (data) {
							$("#favorite" + productId).html("<i class='ion-ios-heart' style='color: red'></i>");
						} else {
							$("#favorite" + productId).html("<i class='ion-ios-heart'></i>");
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.status);
						alert(XMLHttpRequest.readyState);
						alert(textStatus);
					}
				});
	}
	//跳轉指定產品頁面
		function goToProduct(productId){
		window.location.replace("../siminar/mall_shop?flag=true&productId="+productId);
		}
	//取得上一筆商品
	function preProduct(productId){
		$.ajax({
			url : "preProduct",
			type : "POST",
			data : {
				"productId" : productId
			},
			datatype : "html",
			success : function(data, status) {

				if(data==null||data==""){
					alert("已到第一筆商品")
				}else{
				singleProduct(data);
						}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	//取得下一筆商品
	function nextProduct(productId){
		$.ajax({
			url : "nextProduct",
			type : "POST",
			data : {
				"productId" : productId
			},
			datatype : "html",
			success : function(data, status) {
				if(data==null||data==""){
					alert("已到最後一筆商品")
				}else{
				singleProduct(data);
						}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
</script>