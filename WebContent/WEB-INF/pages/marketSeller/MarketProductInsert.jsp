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
<title>新增商品</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
 <section class="ftco-section ftco-degree-bg">
<div>
    <c:if test="${!empty login_ok}">
	<jsp:include page="/WEB-INF/pages/Message.jsp" />
	</c:if>
<h2 align="center">
新增商品 <button class="btn btn-primary " value="fastinsert1" onclick="fastinsert1()">魠魚片</button>
 <button class="btn btn-primary " value="fastinsert2" onclick="fastinsert2()">澎湖野生大明蝦8尾入</button>
 <button class="btn btn-primary " value="fastinsert3" onclick="fastinsert3()">干貝</button>
</h2>
<!-- 上傳檔案時<form>標籤的 enctype屬性必須是 "multipart/form-data" -->
<!-- 而且method屬性必須是 "post" -->
<form:form action="MarketProduct.insert"  method="post" modelAttribute="Insert1" enctype="multipart/form-data">
<table  align="center">

<!--     <tr> -->
<%--     <td><form:label path="marketMallBean.memberNo">測試:</form:label></td> --%>
<%--     <td><form:label path="marketMallBean.memberNo" value=""></form:label></td> --%>
<!--     </tr> -->

    <tr>
    <td>商品名稱:</td>
    <td><form:input type="text" name="product_name" id="product_name" class='InputClass'
     size="20" maxlength="10" path="productName"/>
           <font color='red' size='-1'>
              ${errors.errProduct_name}
           </font>
    </td>
</tr>
<!--  <tr> -->
<!--     <td>單位:</td> -->
<%--         <td><form:input type="text" name="unit" id="unit" maxlength="10" --%>
<%--        path="unit" size="5" /> --%>
<!--            <font color='red' size='-1'> -->
<%--               ${errors.errUnit} --%>
<!--            </font>   -->
           
<!--     </td> -->
<!--  </tr> -->
<tr>
    <td>商品出產地:</td>
    <td><form:input type="text" name="product_area" id="product_area" size="20" maxlength="10"
          path="productArea"/>
           <font color='red' size='-1'>
              ${errors.errProduct_area}
           </font>
    </td>
</tr>
<tr>
    <td>價錢:</td>
    <td><form:input type="text" name="price" id="price" maxlength="10"
       path="price" size="5" />
           <font color='red' size='-1'>
              ${errors.errPrice}
           </font>           
           
    </td>
</tr>
<tr>
    <td>數量:</td>
    <td><form:input type="text" name="quantity" id="quantity" maxlength="10"
       path="quantity"  size="5" />
           <font color='red' size='-1'>
              ${errors.errQuantity}
           </font>           
           
    </td>
   </tr>
  <tr>
  <td>開放預購日期:</td>
  <td><form:input path="openDay" name="openDay"  type="date" id="openDay" required="required" /></td>
  <td>開放預購時間:</td>
  <td><form:input path="openDayTime" type="time" id="openDayTime"/></td>
  </tr>
  <tr>
  <td>結束預購日期:</td>
  <td><form:input path="closeDay" type="date" id="closeDay" required="required"/></td>
  <td>結束預購時間:</td>
  <td><form:input path="closeDayTime" type="time" id="closeDayTime"/></td>
  </tr>
    <tr height="36" >
    <td >產品描述(75字以內)</td>
      <td>         
         <form:textarea name="description" id="description" cols="80" rows="4" path="marketProductImgBean.description"></form:textarea>
         <font color='red' size='-1'>
                ${errors.errDescription}
            </font>
      </td>
    </tr>
    <tr height='36'>
        <td >圖片</td>
        <td >
            <form:input style="background:#FFFFFF" class='InputClass'  type="file" path="marketProductImgBean.multipartFile" accept="image/*" name="product_img" id="imgInp" size="25" /><br>
            <font color='red' size='-1'>${errors.errPicture}</font></td>
    </tr>
    <tr>
    <td></td>
    <td><img height='230' width='230'  id="blah" src="#" alt="your image" />
    </td>
    </tr>
    <tr>
   
    <td>  商品狀態 </td>
    
       <td >
           <form:radiobutton path="marketPutOutBean.putOut" checked="true" value="1"/>上架
           <form:radiobutton path="marketPutOutBean.putOut"  value="0"/>下架
       </td>
    </tr>  
        <tr height="36" >
      <td height="61" colspan="6" align="center">
         <form:button class="btn btn-primary py-3 px-4" value="Send">新增</form:button>
         <a class="btn btn-primary py-3 px-4" href="<c:url value='/MarketProduct.selectAll'/>" >返回</a>
      </td>
    </tr>
   
</table>
</form:form>

</div> 
</section>
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

function fastinsert1(){
	var product_name="澎湖每週限量薄鹽土魠魚片400g";
	var product_area="澎湖";
	var price="460";
	var description="【商品規格】名稱：澎湖每週限量薄鹽土魠魚片規格：400g/片產地：台灣澎湖包裝方式：1片/包，真空包裝保存方式：-18°C以下冷凍保存保存期限：1年加工地：高雄市梓官區漁會食品業者登錄字號：E-188505504-00001-8產品責任險：新光保險產品責任險2000萬"
	var quantity="2";
	var openDay="2020-12-25";
	var openDayTime="09:00"
	var closeDay="2021-03-30";
	var closeDayTime="17:00";
	
		$("#product_name").val(product_name);
		$("#product_area").val(product_area);
		$("#price").val(price);
		$("#description").val(description);
		$("#quantity").val(quantity);
		$("#openDay").val(openDay);
		$("#openDayTime").val(openDayTime);
		$("#closeDay").val(closeDay);
		$("#closeDayTime").val(closeDayTime);
		
}
function fastinsert2(){
	var product_name="澎湖野生大明蝦8尾入";
	var product_area="澎湖";
	var price="780";
	var description="規格說明‧商品組合/內容：澎湖野生大明蝦‧商品重(容)量：450g‧內容物名稱(成分)：明蝦,原產地(國)：台灣(澎湖) ,製造廠商或進口廠商資訊,名稱：高雄市梓官區漁會"
	var quantity="30";
	var openDay="2020-12-25";
	var openDayTime="09:00"
	var closeDay="2021-03-30";
	var closeDayTime="17:00";
	
		$("#product_name").val(product_name);
		$("#product_area").val(product_area);
		$("#price").val(price);
		$("#description").val(description);
		$("#quantity").val(quantity);
		$("#openDay").val(openDay);
		$("#openDayTime").val(openDayTime);
		$("#closeDay").val(closeDay);
		$("#closeDayTime").val(closeDayTime);
		
}
function fastinsert3(){
	var product_name="干貝";
	var product_area="澎湖";
	var price="460";
	var description="【商品規格】名稱：澎湖每週限量干貝規格：400g/片產地：台灣澎湖包裝方式：1片/包，真空包裝保存方式：-18°C以下冷凍保存保存期限：1年加工地：高雄市梓官區漁會食品業者登錄字號：E-188505504-00001-8產品責任險：新光保險產品責任險2000萬"
	var quantity="30";
	var openDay="2020-12-25";
	var openDayTime="09:00"
	var closeDay="2021-03-30";
	var closeDayTime="17:00";
	
		$("#product_name").val(product_name);
		$("#product_area").val(product_area);
		$("#price").val(price);
		$("#description").val(description);
		$("#quantity").val(quantity);
		$("#openDay").val(openDay);
		$("#openDayTime").val(openDayTime);
		$("#closeDay").val(closeDay);
		$("#closeDayTime").val(closeDayTime);
		
}



</script>
<p>&nbsp;</p>
<c:remove var="ErrMsg" scope='session'/>
<jsp:include page="/WEB-INF/pages/footer.jsp" />
</body>
</html>