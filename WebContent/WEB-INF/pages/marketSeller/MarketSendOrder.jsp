<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<html>
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

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span>
					</p>
					<h1 class="mb-0 bread">結帳</h1>
				</div>
			</div>
		</div>
	</div>
 <section class="ftco-section ftco-degree-bg">
<div>
<h2 align="center">
結帳資訊  <button class="btn btn-primary " value="fastinsert" onclick="fastinsert()">收件人</button>
</h2>

<form:form action="MarketSendOrder"  method="post" modelAttribute="order" >
<table  align="center">


    <tr>
    <td>收件人:</td>
    <td><form:input type="text" name="buyer" id="buyer" class='InputClass'
     size="20" maxlength="10" path="buyer"/>
    </td>
</tr>

<tr>
    <td>收件地址:</td>
    <td><form:input type="text" name="address" id="address" size="30" 
          path="address"/>

    </td>
</tr>
<tr>
    <td>聯絡電話:</td>
    <td><form:input type="text" name="cellphone" id="cellphone" maxlength="15"
       path="cellphone" size="20" />
      
    </td>
</tr> 

        <tr height="36" >
      <td height="61" colspan="6" align="center">
         <form:button value="Send" class="btn btn-primary py-3 px-4">結帳</form:button>
      </td>
    </tr>
   
</table>
</form:form>

</div> 
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>



<p>&nbsp;</p>
<c:remove var="ErrMsg" scope='session'/>
<jsp:include page="/WEB-INF/pages/footer.jsp" />
<script>
function fastinsert(){
	var buyer="路人炳";
	var address="320桃園市中壢區中大路300號國立中央大學 ";
	var cellphone="0983006738";

	
		$("#buyer").val(buyer);
		$("#address").val(address);
		$("#cellphone").val(cellphone);

}

</script>
</body>
</html>