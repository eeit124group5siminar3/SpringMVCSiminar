<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動首頁</title>	
<style>

</style>
</head>
<body>
<form action="<c:url value='MarketHome'></c:url>" method="post">
<c:set var="funcName" value="CHE" scope="session" />
<jsp:include page="/top.jsp" />
   	 <h1 align="center">商品管理</h1>
     <div align="center">
        <table  style="border:8px #FFD382 groove;"border="1" cellpadding="5">
            <tr>
                <th> <input name="goinsert" type="submit" value="新增商品"></th>
            <th> <input name="selectall" type="submit" value="顯示商品"></th>
            </tr>
                        <tr>
	            <td style="border:0px" colspan="4"></td>
            	<td style="border:0px" colspan="5">
            	<label for="">商品編號:</label> 
				<input type="text" id="productid" name="productid">
				&nbsp;&nbsp;&nbsp;
				<input name="delect" type="submit" value="刪除">
				<input name="update" type="submit" value="更新"> 	            	
            	</td>
            </tr>

        </table>
    </div> 
    <div align="center">
        <table  style="border:8px #FFD382 groove;"border="1" cellpadding="5">
            <tr >
                <th>商品編號</th>
                <th>商品名稱</th>
                <th>商品描述</th>
                <th>商品出產地</th>
                <th>價格</th>
                <th>單位</th>
                
                <th>數量</th>
                <th>圖片</th>
            </tr>
            <c:forEach var="IBean" items="${listinsert}">
                <tr>
                    <td>${IBean.productId}</td>
                    <td><c:out value="${IBean.productName}"/></td>
                    <td><c:out value="${IBean.marketProductImgBean.description}"/></td>                    
                    <td><c:out value="${IBean.productArea}"/></td>
                    <td><c:out value="${IBean.price}"/></td>
                    <td><c:out value="${IBean.unit}"/></td>
                    <td><c:out value="${IBean.quantity}"/></td>
                
                   
                   <td>  
              <img height='80' width='80'
				src='${pageContext.servletContext.contextPath}/marketSeller/RetrieveMarketImage?id=${IBean.marketProductImgBean.productId}&type=PRODUCT'>
				</td>
                 
                </tr>
            </c:forEach>
          
        </table>
    </div>   
		
	</form>
	
</body>
</html>