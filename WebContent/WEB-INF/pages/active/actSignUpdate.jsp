<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>農郁活動報名頁面</title>

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

<script>
function backHome(){
	document.act.action="maintainActFarmer.do";
    document.act.submit();
}
</script>    
 
    
</head>
<body class="goto-here">

	<jsp:include page="../header.jsp" />
	
<!-- ------------------------內容區 --- ----------------------------------------------------------------->

    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="<c:url value='/actFarmerHome'/>">Home</a></span> <span>Active</span></p>
            <h1 class="mb-0 bread">活動報名</h1>
          </div>
        </div>
      </div>
    </div>

     <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-7 ftco-animate">
			<h3 class="mb-4 billing-heading">活動報名</h3>
			<form:form action="actOrdUpdate.do" modelAttribute="aoBean" class="billing-form" method="POST" name="act">
	          <div class="row align-items-end">
	          <div class="col-md-12">
		            <div class="form-group">
<!-- 	                	<label for="memNo">會員編號</label> -->
						<form:input type="hidden" class="form-control" path="memNo" value="${mbBean.member_no}"/>
	                </div>
		         </div>
               	 <div class="w-100"></div>
	          	<div class="col-md-6">
	                <div class="form-group">
	                	<form:label path="memName">會員姓名</form:label>
	                  	<form:input type="text" class="form-control" value="${mbBean.member_name}" path="memName"/>
	                </div>
	              </div>
	             <div class="col-md-6">
	                <div class="form-group">
	                	<form:label path="memTel">會員電話</form:label>
	                  	<form:input type="text" class="form-control" value="${mbBean.member_address}" path="memTel"/>
	                </div>
                </div>
		         <div class="w-100"></div>
		         <div class="col-md-12">
		            <div class="form-group">
	                	<form:label path="memEmail">會員信箱</form:label>
	                  	<form:input type="text" class="form-control" value="${mbBean.member_email}" path="memEmail"/>
	                </div>
		         </div>
               	 <div class="w-100"></div>
               	 
               	 <div class="col-md-12">
	                <div class="form-group">
	                	<form:label path="actId">活動編號</form:label>
	                  	<form:input type="" class="form-control" value="${actFarmer.actId}" path="actId"/>
	                </div>
	              </div>
	            <div class="w-100"></div>
               	 <div class="col-md-12">
	                <div class="form-group">
	                	<form:label path="actName">活動名稱</form:label>
	                  	<form:input type="text" class="form-control" placeholder="${actFarmer.actName}" path="actName" readOnly="true"/>
	                </div>
	              </div>
	            <div class="w-100"></div>
	          	<div class="col-md-6">
	                <div class="form-group">
	                	<form:label path="memTel">活動時間</form:label>
	                  	<form:input type="date" class="form-control" value="${actFarmer.actDateSta}" path="actDateSta" readOnly="true"/>
<!-- 	                  	<input type="time" class="form-control" placeholder="活動時間" name="acttimeSta" readOnly="true"/> -->
	                  	<form:input type="date" class="form-control" value="${actFarmer.actDateEnd}" path="actDateEnd" readOnly="true"/>
<!-- 	                  	<input type="time" class="form-control" placeholder="活動時間" name="actTimeEnd" readOnly="true"/>	                  	 -->
	                </div>
	              </div>
	             <div class="col-md-6">
	                <div class="form-group">
<!-- 	                  	<input type="date" class="form-control" placeholder="活動時間" name="actDateSta" readOnly="true"/> -->
	                  	<form:input type="time" class="form-control" value="${actFarmer.actTimeSta}" path="actTimeSta" readOnly="true"/>
<!-- 	                  	<input type="date" class="form-control" placeholder="活動時間" name="actDateEnd" readOnly="true"/> -->
	                  	<form:input type="time" class="form-control" value="${actFarmer.actTimeEnd}" path="actTimeEnd" readOnly="true"/>	                  	
	                </div>
                </div>
		         <div class="w-100"></div>	                          
		            <div class="col-md-12">
		            	<div class="form-group">
	                	<form:label path="actAddr">活動地址</form:label>
	                 	 <form:input type="text" class="form-control" placeholder="${actFarmer.actAddr}" path="actAddr"/>
	                	</div>
		            </div>
                <div class="w-100"></div>
                
            
		            <div class="col-md-6">
		            	<div class="form-group">
		            		<label path="ordActNum">報名人數</label>
		            		<div class="select-wrap">
		                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
		                  <form:select class="form-control" path="ordActNum" id="ordActNum" onChange="getNum()">
		                  	<form:option name="operation" value="1">1</form:option>
		                    <form:option name="operation" value="2">2</form:option>
		                    <form:option name="operation" value="3">3</form:option>
		                    <form:option name="operation" value="4">4</form:option>
		                    <form:option name="operation" value="5">5</form:option>
		                    <form:option name="operation" value="6">6</form:option>
		                  </form:select>
		                </div>
		            	</div>
		            </div>
		            <div class="col-md-6">
		            	<div class="form-group">
		            	<form:label path="totalPrice">總金額</form:label>
	                  	<form:input type="text" class="form-control" path="totalPrice" id="result123"  readOnly/>
	                </div>
		            </div>
		            <div class="w-100"></div>
		            
	          	<div class="col-md-6">
	                <div class="form-group">
 	                <form:button class="btn btn-primary py-3 px-4 w-100" value="下單" >報名活動</form:button>	                
	                </div>
	              </div>
	             <div class="col-md-6">
	                <div class="form-group">
					<form:button class="btn btn-primary py-3 px-4 w-100" value="取消訂單" >取消訂單"</form:button>               
	                </div>
                </div>
		         <div class="w-100"></div>	                
		         </div>
	          </form:form><!-- END -->
		         </div>
	          </div>
		</div>
          		 
	          	<div class="col-md-12">
	          		<div class="cart-detail p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">Payment Method</h3>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
											   <label><input type="radio" name="optradio" class="mr-2"> Direct Bank Tranfer</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
											   <label><input type="radio" name="optradio" class="mr-2"> Check Payment</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
											   <label><input type="radio" name="optradio" class="mr-2"> Paypal</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="checkbox">
											   <label><input type="checkbox" value="" class="mr-2"> I have read and accept the terms and conditions</label>
											</div>
										</div>
									</div>
									<p><a href="#"class="btn btn-primary py-3 px-4">Place an order</a></p>
								</div>
	          	</div>
	          </div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->



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