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

</head>
<body class="goto-here">
	
	<jsp:include page="../header.jsp" />
 
<!-- ------------------------內容區 --- ----------------------------------------------------------------->
<!-- 	上面圖片 -->
	<div class= "hero- hero-bread" style="background-image: url('images/about.jpg');" id="act_top">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Actives</span>
					</p>
					<h1 class="mb-0 bread">Actives</h1>
				</div>
			</div>
		</div>
	</div>
	
<!-- 	搜尋bar -->
	<section class="ftco-section">
		<div class="container" >
			<div class="row justify-content-center">
				<div class="col-md-10 mb-5 text-center">
					<ul class="act-type" id="product-category"></ul>
					<form class="product-category" action="?????????" method="GET">
						<input type="search" name="searchString" id="searchString"
							value=${searchString}/>
						<button name="searchButton" style="border-radius: 5px;" onclick="????">查詢</button>
					</form>
				</div>
			</div>
			<div class="row  ftco-animate" id="mall_products"></div>
		</div>
<!-- 活動列表 -->
	 <div class="container ftco-animate" id="actfarmerlist">
		 <div class="blog-entry align-self-stretch d-md-flex">
			<a href="blog-single.html" class="block-20" style="background-image: url('images/image_2.jpg');"></a>
				<div class="text d-block pl-md-4">
					<div class="meta mb-3">
		                  <div><a href="#">July 20, 2019</a></div>
		                  <div><a href="#">Admin</a></div>
					</div>
					 <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
		             	<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                <p><a href="blog-single.html" class="btn btn-primary py-2 px-3">Read more</a></p>
		        </div>
		  </div>
	</div>
	</section>		
<!-- ------------------------內容區 --- ----------------------------------------------------------------->
<div ></div>
	
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
	
<!-- ------------------------script的 ----------------------------------------------------------------- -->	
<script type="text/javascript">
window.onload = function(){
$.get({
		url:"${pageContext.request.contextPath}/actFarmerList.do",
		success:function(data){
			console.log(data);
			let content="";
			for(var i = 0; i<data.length; i++){
			content+=
			`<div class="col-md-12 d-flex"><div class="blog-entry align-self-stretch d-md-flex">
				<a href="blog-single.html" class="block-20" style="background-image: url('<c:url value='ActImageController?id=\${data[i].actId}&type=ACTFARMER'/>');"></a>
					<div class="text d-block pl-md-4">
							<div class="meta mb-3">
				                  <div><a href="#">活動日期</a></div>
				                  <div><a href="#">\${data[i].actDateSta}~\${data[i].actDateEnd}</a></div>
							</div>
							 <h3 class="heading"><a href="#">\${data[i].actName}</a></h3>
				             	<p>活動地址:  \${data[i].actAddr}</p>
				             	<p>活動電話:  \${data[i].tel}</p>
				             	<p>活動地址:  \da${data[i].actDateSta}~\${data[i].actDateEnd}</p>
				             	
				                <p><a href="blog-single.html" class="btn btn-primary py-2 px-3">Read more</a></p>
				        </div>
				</div></div>`;
			}
			// 
			$('#actfarmerlist').html(content);
		}
		})
		
}

</script>
</body>
</html>