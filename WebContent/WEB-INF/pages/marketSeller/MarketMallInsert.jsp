<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>店家資訊管理</title>

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
 <jsp:include page="/WEB-INF/pages/header.jsp" />
<h2>
店家資訊管理
</h2>
<!-- 上傳檔案時<form>標籤的 enctype屬性必須是 "multipart/form-data" -->
<!-- 而且method屬性必須是 "post" -->

<form:form action="MarketMall.Insert"  method="post" modelAttribute="Insert" enctype="multipart/form-data">
<table  cellspacing="2" cellpadding="1" border="1" width="100%">

    <tr>
    <td>店家名稱:</td>
    <td><form:input   type="text" name="mallName" id="mallName" class='InputClass'
     size="35" maxlength="10" value="" path="mallName"/>
           <font color='red' size='-1'>
              ${errors.errMallName}
           </font>
    </td>
</tr>
    <tr height="36" >
    <td >地址</td>
      <td>         
         <form:input size="35" name="address"  path="address"></form:input> 
         <font color='red' size='-1'>
                ${errors.errDescription}
            </font>
      </td>
    </tr>

    <tr height="36" >
    <td >店家描述</td>
      <td>         
         <form:textarea name="mallDescription" cols="80" rows="4" path="mallDescription"></form:textarea>
         <font color='red' size='-1'>
                ${errors.errDescription}
            </font>
      </td>
    </tr>
    <tr height='36'>
        <td >店面圖片</td>
        <td >
            <form:input style="background:#FFFFFF" class='InputClass'  type="file" path="multipartFile" accept="image/*" name="mallImg" id="imgInp" size="25" /><br>
            <font color='red' size='-1'>${errors.errPicture}</font></td>
    </tr>
        <tr height="36" >
      <td height="61" colspan="6" align="center">
         <form:button value="Send">註冊</form:button>
      </td>
    </tr>
   
</table>
</form:form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
 <img height='120' width='96'  id="blah" src="#" alt="your image" />
  <jsp:include page="/WEB-INF/pages/footer.jsp" />
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
<p>&nbsp;</p>
<c:remove var="ErrMsg" scope='session'/>
</body>
</html>