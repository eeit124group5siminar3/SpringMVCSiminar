<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>農郁-活動</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">

<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">

<style>
.backstage-footer-ground {
	width: 100%;
	top: 800px;
	position: absolute;
}

#project_backstage {
	width: 150px;
	position: absolute;
	font-weight: bold;
	top: 150px;
	left: 15px;
	color: white;
	display: block;
}

#backstage_page {
	position: absolute;
	top: 150px;
	left: 250px;
	right: 50px;
	text-align: center;
}

</head>
<body class="goto-here">

	
	<jsp:include page="../header.jsp" />
 	
	<!-- END nav -->

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_1.jpg');" id="product_top">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span>
					</p>
					<h1 class="mb-0 bread">Products</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10 mb-5 text-center">
					<ul class="product-category" id="product-category"></ul>
					<form class="product-category" action="javascript:void(0)"
						method="GET">
						<input type="search" name="searchString" id="searchString"
							value=${searchString}>
						<button name="searchButton" style="border-radius: 5px;"
							onclick="searchProduct()">查詢</button>
					</form>
				</div>
			</div>
			<div class="row  ftco-animate" id="mall_products"></div>
		</div>
		<div id="mall_pages"></div>
	</section>

	
	<jsp:include page="../footer.jsp" />

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
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
<script>
	function productList(pageNo) {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/RetrievePageProducts' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var aProductBean = JSON.parse(xhr.responseText);
				var content = "";
				for (var i = 0; i < aProductBean.length; i++) {
					content += "<div class='col-md-6 col-lg-3'>"
							+ "<div class='product'><a href='#mall_products' class='img-prod'><img class='img-fluid' src=<c:url value='retrieveImageServlet?id="
							+ aProductBean[i].productId
							+ "&type=PRODUCT' /> alt='Colorlib Template'>";
					if (aProductBean[i].discount != 1) {
						content += "<span class='status'>"
								+ (1 - aProductBean[i].discount) * 100
								+ "%</span>";
					}
					content += "<div class='overlay'></div> </a><div class='text py-3 pb-4 px-3 text-center'><h3><a href='#'>"
							+ aProductBean[i].product
							+ "</a></h3><div class='d-flex'><div class='pricing'>";
					if (aProductBean[i].discount != 1) {
						content += "<p class='price'><span class='mr-2 price-dc'>"
								+ aProductBean[i].price
								+ "元</span><span class='price-sale'>"
								+ aProductBean[i].price
								* aProductBean[i].discount + "元</span></p>";
					} else {
						content += "<span>" + aProductBean[i].price
								+ "元</span>";
					}
					content += "</div></div><div class='bottom-area d-flex px-3'><div class='m-auto d-flex'>"
							+ "<a href='#mall_products' class='add-to-cart d-flex justify-content-center align-items-center text-center'><span><i class='ion-ios-menu'></i></span></a>"
							+ "<a href='#mall_products' class='buy-now d-flex justify-content-center align-items-center mx-1'><span><i class='ion-ios-cart'></i></span></a>"
							+ "<a href='#mall_products' class='heart d-flex justify-content-center align-items-center '><span><i class='ion-ios-heart'></i></span></a>"
							+ "</div></div></div></div></div>"
				}
				let divs = document.getElementById("mall_products");
				divs.innerHTML = content;
			}
		}
	}

	function page(pageNo) {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/RetrievePage/"+pageNo+"' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var content = "<div class='row mt-5'><div class='col text-center'><div class='block-27'><ul>";
				var totalPages = xhr.responseText;
				if (pageNo == 1) {
					content += "<li><span>&lt;&lt;</span></li><li><span>&lt;</span></li>";
				} else {
					content += "<li><a href='#product_top'onclick='page("
							+ 1
							+ ")'>&lt;&lt;</a></li><li><a href='#product_top'onclick='page("
							+ (pageNo - 1) + ")'>&lt;</a></li>";
				}
				if (totalPages <= 5) {
					for (var i = 1; i <= totalPages; i++) {
						if (pageNo == i) {
							content += "<li class='active'><span>" + i
									+ "</span></li>"
						} else {
							content += "<li><a href='#product_top' onclick='page("
									+ i + ")'>" + i + "</a></li>"
						}
					}
				} else if (pageNo > (totalPages - 3)) {
					for (var i = totalPages - 4; i <= totalPages; i++) {
						if (pageNo == i) {
							content += "<li class='active'><span>" + i
									+ "</span></li>"
						} else {
							content += "<li><a href='#product_top' onclick='page("
									+ i + ")'>" + i + "</a></li>"
						}
					}
				} else {
					for (var i = pageNo - 2; i <= pageNo + 2; i++) {
						if (pageNo == i) {
							content += "<li class='active'><span>" + i
									+ "</span></li>"
						} else {
							content += "<li><a href='#product_top' onclick='page("
									+ i + ")'>" + i + "</a></li>"
						}
					}
				}
				if (pageNo == totalPages) {
					content += "<li><span>&gt;</span></li><li><span>&gt;&gt;</span></li>";
				} else {
					content += "<li><a href='#product_top'onclick='page("
							+ (pageNo + 1)
							+ ")'>&gt;</a></li><li><a href='#product_top'onclick='page("
							+ totalPages + ")'>&gt;&gt;</a></li>";
				}
			}
			productList(pageNo);
			content += "</ul></div></div></div>";
			let divs = document.getElementById("mall_pages");
			divs.innerHTML = content;
			console.log(totalPages);
		}
	}

	function searchProduct() {
		var searchString = document.forms[0].elements[0].value;
		console.log(searchString);
		var xhr = new XMLHttpRequest();
		if (searchString == null || searchString == "") {
			var url = "<c:url value='/RetrieveSearch/' />"
			console.log(searchString);
		} else {
			var url = "<c:url value='/RetrieveSearch/" + searchString + "' />"
		}
		xhr.open("GET", url, false);
		xhr.send();
		page(1);
	}

	function productCategory(categoryId) {
		var categoryList = document.getElementById("product-category");
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/RetrieveCategory/"+categoryId+"' />",
				true);
		xhr.send();
		content = ""
		xhr.onreadystatechange = function() {
			page(1);
			if (xhr.readyState == 4 && xhr.status == 200) {
				var categoryBean = JSON.parse(xhr.responseText);
				categoryBean.unshift({
					id : 0,
					name : "全部"
				});
				for (var i = 0; i < categoryBean.length; i++) {
					if (i == categoryId) {
						content += "<li class='active'><span>" 
								+ categoryBean[i].name + "</span></li>";
					} else {
						content += "<li><a href='#product_top' onclick='productCategory("
								+ i
								+ ")'>"
								+ categoryBean[i].name
								+ "</a></li>";
					}
				}
			}
			categoryList.innerHTML = content;
		}
		
	}

	window.onload =function() {
		productCategory(0);
		page(1);
	}

</script>
</body>
</html>