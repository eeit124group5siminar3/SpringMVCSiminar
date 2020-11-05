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
			<legend>商品資料</legend>
			<c:forEach var="product" items="${list}">
			<div>
				<label for="">編號:${product.productId}</label>
				<input type=hidden name="productId" value="${product.productId}"/>
			</div>
			<div>
				<label for="">商品名稱:</label>
				<input type="text" id="productName" name="productName" value="${product.productName}" >
			</div>
			<div>
				<label for="">商品描述:</label> 
				<textarea name="description" id="description" cols="60" rows="4" >${product.marketProductImgBean.description}</textarea>
				
			</div>
			<div>
				<label for="">商品出產地:</label> 
				<input type="text" id="productArea" name="productArea" value="${product.productArea}">
			</div>
			
		    <div>
				<label for="">單位:</label> 
				<input type="text" id="unit" name="unit" value="${product.unit}">
			</div>
			 <div>
				<label for="">數量:</label> 
				<input type="text" id="quantity" name="quantity" value="${product.quantity}">
			</div>
			
			<div>
				<label for="">價格:</label> 
				<input type="text" id="price" name="price" value="${product.price}">
			</div>
<!-- 			<div> -->
<!-- 				<label for="">圖片:</label> <br>  -->
<!-- 				<input type="file" id="product" name="product"> -->
<!-- 			</div> -->

		  </c:forEach>
			<input name="update" type="submit" value="更新" > 
			<input name="acthome" type="submit" value="活動首頁">
			
		</fieldset>
	
</body>
</html>