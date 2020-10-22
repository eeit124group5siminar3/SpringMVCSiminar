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
	<form action="./MarketUpdate" method="post">
		<fieldset>
			<legend>商品資料</legend>
			<c:forEach var="product" items="${list}">
			<div>
				<label for="">編號:${product.product_id}</label>
				<input type=hidden name="productid" value="${product.product_id}"/>
			</div>
			<div>
				<label for="">商品名稱:</label>
				<input type="text" id="product_Name" name="product_name" value="${product.product_name}" >
			</div>
			<div>
				<label for="">商品描述:</label> 
				<textarea name="description" id="description" cols="60" rows="4" >${product.description}</textarea>
				
			</div>
			<div>
				<label for="">商品出產地:</label> 
				<input type="text" id="product_area" name="product_area" value="${product.product_area}">
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
	</form>
</body>
</html>