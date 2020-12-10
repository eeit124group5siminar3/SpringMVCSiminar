<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>農郁-活動訂單列表</title>

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
    
 
    
</head>
<body class="goto-here">

	<jsp:include page="../header.jsp" />
	
<!-- ------------------------內容區 --- ----------------------------------------------------------------->

    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="<c:url value='/actFarmerHome'/>">Home</a></span> <span>Active</span></p>
            <h1 class="mb-0 bread">活動報名列表</h1>
          </div>
        </div>
      </div>
    </div>
    
    <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>&nbsp;</th>
						        <th>活動名稱</th>
						        <th>活動開始時間</th>
						        <th>活動結束時間</th>						        
						        <th>連絡電話</th>
						        <th>報名人數</th>
						        <th>總金額</th>
						      </tr>
						    </thead>
						    
						    <tbody>
						   	<c:forEach var="collActOrds" items="${collActOrds}">
						    
						      <tr class="text-center">						        
						        <td class="image-prod">
						        <img class="img" src="<c:url value='ActImageController?id=${collActOrds.actFarmer.actId}&type=ACTFARMER'/>"/>
						        </td>
						        
						        <td class="product-name">
						        <h3>
						        <a href="<c:url value='getSingleAct.do?id=${collActOrds.actFarmer.actId}'/>">${collActOrds.actFarmer.actName}</a>
						        </h3>
						        	<p>${collActOrds.actFarmer.actAddr}</p>
						        </td>
						        <td class="product-name">
						        	<h3>${collActOrds.actFarmer.actDateSta}</h3>
						        	<p>${collActOrds.actFarmer.actTimeSta}</p>
						        </td>
						        <td class="product-name">
						        	<h3>${collActOrds.actFarmer.actDateEnd}</h3>
						        	<p>${collActOrds.actFarmer.actTimeEnd}</p>
						        </td>
						        <td class="product-name">
						        	<h3>${collActOrds.actFarmer.tel}</h3>
						        </td>
						        <td class="quantity">${collActOrds.ordActNum}</td>
						    			        
						        <td class="total">$${collActOrds.totalPrice}</td>
						      </tr><!-- END TR-->
						     </c:forEach>
								<!-- 以下為控制第一頁、前一頁、下一頁、最末頁 等超連結-->
								<form>
								<div id="bpaging">
								<table border="1" style="margin-right: 0px;">
								<tr align="center">
									<td width='80' height='20'><c:if test="${pageNo > 1}">
										<div id="blfirst"><a
											href="<c:url value='maintainActFarmer.do?pageNo=1' />">maintainActFarmer.do?pageNo=1 
											<img border='0' alt='第一頁' height='30' width='30'
											src='./images/first-icon.png' /> </a></div>
									</c:if></td>
									<td width='80'><c:if test="${pageNo > 1}">
										<div id="blprev"><a
											href="<c:url value='maintainActFarmer.do?pageNo=${pageNo-1}' />">
										<img border='0' alt='前一頁' height='30' width='30'
											src='./images/prev-icon.png' /></a></div>
									</c:if></td>
									<td width='76'>${pageNo} / ${totalPages}</td>
									<td width='80'><c:if test="${pageNo != totalPages}">
										<div id="blnext"><a
											href="<c:url value='maintainActFarmer.do?pageNo=${pageNo+1}' />">
										<img border='0' alt='最末頁' height='30' width='30'
											src='./images/next-icon.png'/> </a></div>
									</c:if></td>
									<td width='80'><c:if test="${pageNo != totalPages}">
										<div id="bllast"><a
											href="<c:url value='maintainActFarmer.do?pageNo=${totalPages}' />">
										<img border='0' alt='最末頁' height='30' width='30'
											src='./images/last-icon.png' /> </a></div>
									</c:if></td>
								</tr>
							</table>
							</div>
							</form>						     
						     
						     
						    </tbody>
						  </table>
					  </div>
    			</div>
    		</div>
    		</div>
		</section>


<!-- ------------------------內容區 --- ----------------------------------------------------------------->

	<jsp:include page="../footer.jsp" />
	
<!-- loader -->
  <div id="ftco-loader" class="show fullscreen">
	  <svg class="circular" width="48px" height="48px">
	  <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
	  <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/>
	  </svg>
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script>
  function getNum(){
		 var totalprice = ($("select[name='ordActNum']").val())*`${actFarmer.price}`;  
		 $("#result123").val(totalprice) ;	  	  
	  }
  
window.onload = getNum();
	  
</script>	
	
</body>
</html>