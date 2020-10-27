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

<c:set var="funcName" value="CHE" scope="session" />
<jsp:include page="/top.jsp" />
   	 <h1 align="center">商品管理</h1>
     <div align="center">
     <div>圖片尚未能更新</div>
     <form action="<c:url value='MarketHome'></c:url>" method="post">
        <table  style="border:8px #FFD382 groove;"border="1" cellpadding="5">
            <tr>
            <th> <input name="goinsert" type="submit" value="新增商品"></th>
            <th> <input name="selectall" type="submit" value="顯示商品"></th>
            </tr>
        </table>
        </form>
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
                <th>修改 刪除</th>
                
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
				 
				<td>
				<form action="<c:url value='MarketHome'></c:url>" method="post">
				<input type="hidden"  id="productid" name="productid" value="${IBean.productId}">
              
                 <input name="delect" type="submit" value="刪除">
                 	&nbsp;&nbsp;

				 <input name="update" type="submit" value="更新"> 
				  </form>	 
			     </td>
			     
                </tr>
            </c:forEach>
          
        </table>
    </div>   
		
	
	
</body>
</html>