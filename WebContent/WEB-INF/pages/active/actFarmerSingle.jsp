<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>農郁-活動詳情</title>
<!-- ------LINK-------------------------------------------------------- -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

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
    <link rel="stylesheet" href="css/actives.css">
    
<!-- -------------------Sweetalert引入的CDN---------------------------------------------------------------------- -->
<link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">

<style type="text/css">

.post-title {
	width:50px; 
	overflow: hidden; 
	white-space: nowrap; 
	text-overflow: ellipsis;
}

.swal-wide{
    width:800px !important;
}
</style>
</head>

<body class="goto-here">
<!-- ------Header--------------------------------------------------------------- -->
<jsp:include page="/WEB-INF/pages/header.jsp" />

	<c:if test="${!empty login_ok}">
		<jsp:include page="/WEB-INF/pages/Message.jsp" />
	</c:if>

<!-- ------上面的圖片--------------------------------------------------------------- -->
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Acitve</span></p>
            <h1 class="mb-0 bread">活動詳情</h1>
          </div>
        </div>
      </div>
    </div>
    
<!-- ------內容--------------------------------------------------------------- -->    
	<section class="ftco-section ftco-degree-bg ">
      <div class="container">
      <form:form action="getSingleAct.do" modelAttribute="collFarmer" method="GET" enctype="multipart/form-data" name="act">     
        <div class="row">
          <div class="icon col-lg-8 ftco-animate ">
			<h2 class="mb-3"><span class="icon ion-ios-search"></span><form:label path="actId">${collFarmer.actName}</form:label></h2>
			<p>${collFarmer.actType }</p>
           	活動日期 ${collFarmer.actDateSta} ${collFarmer.actTimeSta}~${collFarmer.actDateEnd} ${collFarmer.actTimeEnd}<br>
        	活動地點 ${collFarmer.actAddr}<br>
           	連絡電話  ${collFarmer.tel}<br>
           	費用  ${collFarmer.price}<br>
           	活動名額 ${collFarmer.numLim}
			<hr>
<!--             <p> -->
<%--               <a href="<c:url value='ActImageController?id=${collFarmer.actId}&type=ACTFARMER'/>" class="image-popup"><img src="<c:url value='ActImageController?id=${collFarmer.actId}&type=ACTFARMER'/>" alt="" class="img-fluid"></a> --%>
<!--             </p> -->
            <p>
              <img src="<c:url value='ActImageController?id=${collFarmer.actId}&type=ACTFARMER'/>" alt="" class="img-fluid" id="imgs"></a>
            </p>
            <h6>活動簡介 </h6>
            <p>${collFarmer.actDescri}</p>
          </div>
          <div class="col-lg-4 sidebar ftco-animate ">
<!--             <div class="sidebar-box"> -->
<%--               <form action="#" class="search-form"> --%>
<!--                 <div class="form-group"> -->
<!--                   <span class="icon ion-ios-search"></span> -->
<!--                   <input type="text" class="form-control" placeholder="Search..."> -->
<!--                 </div> -->
<%--               </form> --%>
<!--             </div> -->
            <div class="col-md-12 sidebar-box ftco-animate">
            	<h3 class="heading" style="color: #82ae46">報名資訊</h3>
              <ul class="categories">
                <li><a href="#">報名開始時間 <span>${collFarmer.signDateSta} ${collFarmer.signTimeSta}</span></a></li>
                <li><a href="#">報名截止時間 <span>${collFarmer.signDateEnd} ${collFarmer.signTimeEnd}</span></a></li>
                <li><a href="#">已報名人數 <span>${collFarmer.actNumTol}</span></a></li>
                <li><a href="<c:url value='actSignPreInsert.do?id=${collFarmer.actId}'/>" class="btn btn-primary py-2 px-3">我要報名</a></li>
              </ul>
            </div>
      </form:form>
         <div class="sidebar-box ftco-animate">
      <form:form action="actShowPopular.do" modelAttribute="popActFarmer" method="GET" enctype="multipart/form-data" name="act">     
              <h3 class="heading">熱門活動</h3>
              <div id="showp"></div>
              <div class="block-21 mb-4 d-flex" >
<!--                 <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a> -->
<!--                 <div class="text"> -->
<!--                   <h3 class="heading-1"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                   <div class="meta"> -->
<!--                     <div><a href="#"><span class="icon-calendar"></span> April 09, 2019</a></div> -->
<!--                     <div><a href="#"><span class="icon-person"></span> Admin</a></div> -->
<!--                     <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
<!--                   </div> -->
<!--                 </div> -->
              </div>
            
<!--             <div class="col-lg-12 sidebar-box ftco-animate"> -->
<!--               <h3 class="heading" style="color: #82ae46">熱門活動</h3> -->
<!--               <div class="row"> -->
<!--               	<h6 class="col-lg-8">活動名稱</h6> <h6 class="col-lg-4">已報名人數</h6> -->
<!--               </div> -->
             
<!--               <div id="showp"></div>   -->
              
          </div>
		</form:form>		
    </section> <!-- .section -->
    
<!-- ------Header--------------------------------------------------------------- -->
<jsp:include page="/WEB-INF/pages/footer.jsp" />
   
    <!-- loader -->
  <div id="ftco-loader" class="show fullscreen">
  	<svg class="circular" width="48px" height="48px">
  		<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
  		<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/>
  	</svg>
  </div>

<!-- -----------script------------------------------------------------------------------------------ -->
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
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!--   <script src="js/google-map.js"></script> -->
  <script src="js/main.js"></script>
  
 <!-- -------------------SweetAlert引入的js---------------------------------------------------------------------- -->	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>	
		
<script type="text/javascript">
$(document).ready(function(){
	$.get({
		url:"${pageContext.request.contextPath}/actShowPopular.do",
		contentType:"application/json",
		success:function(response,status){
		let data = response.data;
		let content = "";
		console.log(data)
			for(var i = 0;i<data.length; i++){
				content+=
			 	` <div class="block-21 mb-4 d-flex" >
			 	<a class="blog-img mr-4" style="background-image: url('<c:url value='ActImageController?id=\${data[i].ACTID}&type=ACTFARMER'/>');"></a>
	               <div class="text">
	               <h3 class="heading-1"><a href="<c:url value='getSingleAct.do?id=\${data[i].ACTID}'/>">\${data[i].ACTNAME}</a></h3>
		               <div class="meta">
		                 <div><a href="<c:url value='getSingleAct.do?id=\${data[i].ACTID}'/>"><span class="icon-person"></span>\${data[i].ORDACTSUM}</span></a></div>
		               </div>
	               </div>
	               </div>`;
			}
		$('#showp').html(content);
		}
	})		
})
	
</script>
	<!-- -------------------SweetAlert引入的javascript---------------------------------------------------------------------- -->	
<script>
$('#imgs').click(function() {
	Swal.fire({
		  imageUrl: 'ActImageController?id=${collFarmer.actId}&type=ACTFARMER',
		  imageHeight: 600,
		  customClass: 'swal-wide',
		  confirmButtonColor: "#82ae46",
		  imageAlt: 'active img'
		})
});
</script>
</body>
</html>