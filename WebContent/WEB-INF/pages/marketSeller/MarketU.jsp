<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新商品</title>

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
		<form:form id="form1" name="form1" method="post"
				action="MarketProductUpdate" enctype="multipart/form-data"
				modelAttribute="mBean">
	
			<div>
				<form:label path="productName">商品名稱:</form:label>
				<form:input type="text" id="product_name" name="product_name" path="productName" />
			 <font color='red' size='-1'>
              ${errors.errProduct_name}
           </font>
			</div>
			<div>
				<form:label path="marketProductImgBean.description">商品描述(75字以內):</form:label> 
				<form:textarea name="description" id="description" cols="60" rows="4" path="marketProductImgBean.description"></form:textarea>
		      <font color='red' size='-1'>
                ${errors.errDescription}
            </font>
			</div>
			<div>
				<form:label path="productArea">商品出產地:</form:label> 
				<form:input type="text" id="product_area" name="product_area" path="productArea" />
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