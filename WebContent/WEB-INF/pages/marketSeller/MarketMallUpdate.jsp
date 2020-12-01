<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店家資訊</title>

<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>

<style>
fieldset {
	width: 500px;
	margin: 0px auto;
	border :8px #FFD382 groove;
	border-radius: 15px;
}
body {  
	background:#EBFFEB;
}

</style>
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
<body>
<jsp:include page="../header.jsp"/>
<!-- 蔬菜圖 -->
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span></p>
            <h1 class="mb-0 bread">Checkout</h1>
          </div>
        </div>
      </div>
    </div>
    <!-- 蔬菜圖 -->
		<form:form id="form2" name="form2" method="post"
				action="MarketMall.update" enctype="multipart/form-data"
				align="center"
				modelAttribute="mallBean">
<section class="ftco-section">				
 <div class="container">
    <div class="row justify-content-center">
     <div class="col-xl-7 ftco-animate">
		<h3 class="mb-4 billing-heading">店家資料</h3>
		  <div class="row align-items-end">
		     
	          <div class="col-md-6">
	             <div class="form-group">
	                <form:input type="hidden" id="memberNo" name="memberNo" path="memberNo" />
				    <form:label path="mallName">店家名稱:</form:label>
				    <form:input type="text" id="mallName" name="mallName" path="mallName" />
                     <font color='red' size='-1'>
                          ${errors.errMallName}
                     </font>
	              </div>
	          </div>
	         <div class="w-100"></div>
             <div class="col-md-6">
              <div class="form-group">
				<form:label path="address">地址</form:label> 
				<form:input  type="text" id="address" name="address" path="address" />
		          <font color='red' size='-1'>
                   ${errors.errAddress}
                  </font>
                 
              </div>
             </div>
		  
			<div>
				<form:label path="mallDescription">店家描述:</form:label> 
				<form:textarea wrap="physical" name="mallDescription" cols="80" rows="15" path="mallDescription"></form:textarea>
			</div>
	      <div>
	            原版封面 
	      </div>
		<div>
		<img height='240' width='360'
		src=<c:url value='MarketImageServlet?id=${mallBean.memberNo}&type=MALLIMG' /> /> 
		</div>
		<hr>
		<div> 
		<form:label path="multipartFile">圖片:</form:label> <br> 
		<form:input  style="background: #FFFFFF"
		 class='InputClass' 
		  type="file" id="imgInp" 	  
		   path="multipartFile" 
		    accept="image/*" 
		   size="25"/> 
		</div> 
		<div> 
		 <img height='240' width='360' id="blah" src="#" alt="your image" />
		 更新後
		</div>

			<form:button value="Send" >更新</form:button>
	 </div>		
   </div>	
  </div>	
 </div>	
</section> <!-- .section -->	
			</form:form>
			<form action="<c:url value='/'></c:url>" >
			<input  type="submit" value="回首頁">
			</form>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		 
		<script>
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    
    reader.onload = function(e) {
      $('#blah').attr('src', e.target.result);
    }
    
    reader.readAsDataURL(input.files[0]); // convert to base64 string
  }
}
$("#imgInp").change(function() {
	  readURL(this);
	});
		
</script>
<jsp:include page="/WEB-INF/pages/footer.jsp" />
</body>
</html>