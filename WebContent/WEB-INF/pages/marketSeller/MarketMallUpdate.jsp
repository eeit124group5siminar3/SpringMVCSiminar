<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新商品</title>

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
</head>
<body>
<h1 align="center">商品管理</h1>
		<fieldset>
		<form:form id="form2" name="form2" method="post"
				action="MarketMallUpdate" enctype="multipart/form-data"
				modelAttribute="">
	
			<div>
				<form:label path="mallName">店家名稱:</form:label>
				<form:input type="text" id="mallName" name="mallName" path="mallName" />
			 <font color='red' size='-1'>
              ${errors.errMallName}
           </font>
			</div>
			<div>
				<form:label path="address">地址</form:label> 
				<form:input type="text" id="address" name="address" path="address" />
		      <font color='red' size='-1'>
                ${errors.errAddress}
            </font>
			</div>
			<div>
				<form:label path="mallDescription">店家描述:</form:label> 
				<form:textarea name="mallDescription" cols="80" rows="4" path="mallDescription"></form:textarea>
			</div>
			
		    <div>
				<form:label path="unit">單位:</form:label> 
				<form:input type="text" id="unit" name="unit" path="unit"/>
			</div>
           <font color='red' size='-1'>
              ${errors.errUnit}
           </font> 
		
			 <div>
				<form:label path="quantity">數量:</form:label> 
				<form:input type="text" id="quantity" name="quantity" path="quantity"/>
           <font color='red' size='-1'>
              ${errors.errQuantity}
           </font>  
				
			</div>
			
			<div>
				<form:label path="price">價格:</form:label> 
				<form:input type="text" id="price" name="price"  path="price"/>
            <font color='red' size='-1'>
              ${errors.errPrice}
           </font> 
	        </div>
	        <div>
	       <form:radiobutton path="marketPutOutBean.putOut" name="marketPutOutBean.putOut" value="1" />上架
           <form:radiobutton path="marketPutOutBean.putOut" name="marketPutOutBean.putOut" value="0" />下架
	        </div>

	      <div>
	            原版圖片 
	      </div>
		<div>
		<img height='120' width='96'
		src=<c:url value='MarketImageServlet?id=${mBean.marketProductImgBean.productId}&type=PRODUCT' /> /> 
		</div>
		<hr>
		<div> 
		<form:label path="marketProductImgBean.multipartFile" >圖片:</form:label> <br> 
		<form:input  style="background: #FFFFFF"
		 class='InputClass' 
		  type="file" id="imgInp" 
		  name="product"
		   path="marketProductImgBean.multipartFile" 
		    accept="image/*" 
		   size="25"/> 
		</div> 
		<div> 
		 <img height='120' width='96' id="blah" src="#" alt="your image" />
		 更新後
		</div>

			<form:button value="Send" >更新</form:button>
			</form:form>
			<form action="<c:url value='/MarketProduct.selectAll'></c:url>" method="get">
			<input  type="submit" value="活動首頁">
			</form>
		</fieldset>
		
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
	
</body>
</html>