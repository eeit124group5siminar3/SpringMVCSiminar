<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動首頁</title>

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
<jsp:include page="../header.jsp"/>
<c:set var="funcName" value="CHE" scope="session" />
   	 <h1 align="center">商品管理</h1>
     <div align="center">
     <form action="<c:url value='/MarketProduct.goInsertJsp'></c:url>" method=".GET">
        <table  style="border:8px #FFD382 groove;"border="1" cellpadding="5">
            <tr>
            <th> <input  type="submit" value="新增商品"></th>
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
                <th>數量</th>
<!--                 <th>單位</th> -->
                <th>價格</th>
                <th>商品狀態</th>
               <th>圖片</th> 
                <th>修改 </th>
                <th> 刪除</th>
                

         
            </tr>
            <c:forEach var="IBean" items="${list}">
                <tr>
                    <td>${IBean.productId}</td>
                    <td><c:out value="${IBean.productName}"/></td>
                    <td Width="200"><c:out value="${IBean.marketProductImgBean.description}"/></td>                    
                    <td><c:out value="${IBean.productArea}"/></td>
                    <td><c:out value="${IBean.quantity}"/></td>      
<%--                     <td>1<c:out value="${IBean.unit}"/></td> --%>
                    <td><c:out value="${IBean.price}"/>元</td>
                    <td><c:out value="${IBean.marketPutOutBean.status}"/></td>
                <td>  
				<img  height='80' width='80'
			        src=<c:url value='MarketImageServlet?id=${IBean.marketProductImgBean.productId}&type=PRODUCT'/>>
			       
			        </td>

                 <td>
                  <form action="<c:url value='/MarketProduct.goUpdateJsp'></c:url>" method="get">
                  <input type="hidden"  id="productid" name="productid" value="${IBean.productId}">
                  
				 <input type="submit" value="更新"> 
				  	 </form>
			     </td>
			     <td>
				<form action="<c:url value='/MarketProduct.delete'></c:url>" method="post">
				<input type="hidden"  id="productid" name="productid" value="${IBean.productId}">     
                 <input  type="submit" value="刪除">
                 </form>
                 </td>
                </tr>
            </c:forEach>
          
        </table>
    </div>  
<jsp:include page="/WEB-INF/pages/footer.jsp" />
</body>
</html>