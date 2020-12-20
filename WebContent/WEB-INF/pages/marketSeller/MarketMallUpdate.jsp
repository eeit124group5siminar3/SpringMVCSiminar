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
<div>
<h2 align="center">
店家資訊
</h2>
<!-- 上傳檔案時<form>標籤的 enctype屬性必須是 "multipart/form-data" -->
<!-- 而且method屬性必須是 "post" -->
		<form:form id="form2" name="form2" method="post"
				action="MarketMall.update" enctype="multipart/form-data"
				align="center"
				modelAttribute="mallBean">
<table  align="center">

    <tr>
    <td>店家名稱:</td>
    <td><form:input type="text" name="mallName" id="mallName" class='InputClass'
     size="20" maxlength="10" path="mallName"/>
    </td>
</tr>
<tr>
    <td>地址:</td>
    <td><form:input type="text" name="address" id="address" size="20" 
          path="address"/>
    </td>
</tr>
<tr>
    <td>顧客取貨時間:</td>
    <td><form:input type="text" name="pickupTime" id="pickupTime" 
       path="pickupTime"  size="20" />         
    </td>
</tr>
    <tr height="36" >
    <td >店家描述:</td>
      <td>         
         <form:textarea name="mallDescription" cols="80" rows="4" path="mallDescription"></form:textarea>
      </td>
    </tr>
    <tr height='36'>
        <td >原版封面</td>
        <td >
            <img height='360' width='360'
		src=<c:url value='MarketImageServlet?id=${mallBean.memberNo}&type=MALLIMG' /> /> 
        </td>
    </tr>
    <tr height='36'>
        <td >更新封面</td>
        <td >
            <form:input style="background:#FFFFFF" class='InputClass'  type="file" path="multipartFile" accept="image/*" name="product_img" id="imgInp" size="25" /><br>
        </td>
    </tr>
    <tr>
    <td></td>
    <td><img height='360' width='360'  id="blah" src="#" alt="your image" />
    </td>
    </tr>
 
        <tr height="36" >
      <td height="61" colspan="6" align="center">
         <form:button value="Send" class="btn btn-primary py-3 px-4" >更新</form:button>
      </td>
    </tr>
   
</table>
</form:form>

			<form class="container" action="<c:url value='backstage.controller'></c:url>" >
			<div align="center">
			<input class="btn btn-primary py-3 px-4" type="submit"  value="回管理介面">
			</div>
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