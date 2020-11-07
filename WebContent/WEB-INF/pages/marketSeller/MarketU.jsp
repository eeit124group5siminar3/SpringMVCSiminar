<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		<form action="<c:url value='/MarketProduct.Update'></c:url>" method="post">
			<legend>商品資料</legend>
			
			<div>
				<label for="">編號:${list.productId}</label>
				<input type=hidden name="productId" value="${list.productId}"/>
			</div>
			<div>
				<label for="">商品名稱:</label>
				<input type="text" id="product_name" name="product_name" value="${list.productName}" >
			 <font color='red' size='-1'>
              ${errors.errProduct_name}
           </font>
			</div>
			<div>
				<label for="">商品描述(75字以內):</label> 
				<textarea name="description" id="description" cols="60" rows="4" >${list.marketProductImgBean.description}</textarea>
		      <font color='red' size='-1'>
                ${errors.errDescription}
            </font>
			</div>
			<div>
				<label for="">商品出產地:</label> 
				<input type="text" id="product_area" name="product_area" value="${list.productArea}">
			</div>
			
		    <div>
				<label for="">單位:</label> 
				<input type="text" id="unit" name="unit" value="${list.unit}">
			</div>
           <font color='red' size='-1'>
              ${errors.errUnit}
           </font> 
		
			 <div>
				<label for="">數量:</label> 
				<input type="text" id="quantity" name="quantity" value="${list.quantity}">
           <font color='red' size='-1'>
              ${errors.errQuantity}
           </font>  
				
			</div>
			
			<div>
				<label for="">價格:</label> 
				<input type="text" id="price" name="price" value="${list.price}">
            <font color='red' size='-1'>
              ${errors.errPrice}
           </font> 
			</div>
<!-- 			<div> -->
<!-- 				<label for="">圖片:</label> <br>  -->
<!-- 				<input type="file" id="product" name="product"> -->
<!-- 			</div> -->

			<input  type="submit" value="更新" > 
			</form>
			<form action="<c:url value='/MarketProduct.selectAll'></c:url>" method="get">
			<input  type="submit" value="活動首頁">
			</form>
		</fieldset>
	
</body>
</html>