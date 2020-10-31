<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顯示商品資訊</title>
  <style type="text/css">
#paging {
position:relative;
left:120px;
top:10px;
}  
#pfirst {
position:relative;
left:2px;
top:2px;
}
#pprev {
position:relative;
left:2px;
top:2px;
}
#pnext {
position:relative;
left:2px;
top:2px;
}
#plast {
position:relative;
left:2px;
top:2px;
}
#main {
	position:relative;
	top: 5px;
	left:40px;
    width:100%;
}
#content {
  width: 820px ;
  margin-left: auto ;
  margin-right: auto ;
}
</style>
</head>
<body style="background:#EBFFEB;">
<!-- 下列敘述設定變數funcName的值為SHO，top.jsp 會用到此變數 -->
<c:set var="funcName" value="SHO" scope="session"/>
<!-- 引入共同的頁首 -->
<jsp:include page="MallTop.jsp" />
<!-- 判斷購物車內是否有商品 -->
<c:choose>
   <c:when test="${ShoppingCart.itemNumber > 0}">
      <!-- 購物車內有一項以上的商品 -->
      <c:set var="cartContent" value="購物車內有${ShoppingCart.itemNumber}項商品"/>
   </c:when>
   <c:otherwise>
      <!-- 購物車內沒有商品 -->
      <c:set var="cartContent" value="您尚未購買任何商品"/>        
   </c:otherwise>
</c:choose>
<div id='content'>
<TABLE  style="width:820; border:2px solid black; ">
<!--   購物車的標題   -->          
   <TR>
      <TD colspan='4'> 
         <TABLE style="background:#FFE4C4; border:1px solid black; width:820px" >
            <TR height='2'>
               <TH width="270"><form action="<c:url value='RetrievePageProducts' />" method="POST">
                  <input type="text" name="searchString" value= ${searchString}><button type="submit" name="search">查詢</button>
                  </form></TH>
               <TH width="280">&nbsp;</TH>
               <TH width="270">&nbsp;</TH>
            </TR>    
            <TR height='10'>
               <TD width="240">&nbsp;</TD>
               <TD width="320" align='center' >
               
                  <FONT color='#8000FA' size='+2' style="font-weight:900;" >
                  
                  </FONT>
               </TD>
               <TD width="270" align='right'>
                  <FONT  color='red' size='-1'>
                     ${cartContent}
                  </FONT>
               </TD>
            </TR>
            
            <TR height='2'>
                <TD width="270">
	               <A href="<c:url value='/mall/ProductShowCart.jsp?pageNo=${pageNo}' />" >
	                                               購物清單
	               </A>
	            </TD>
                <TD width="280">&nbsp;</TD>
                <TD width="270" align='right'><FONT  color='red' size='-1'>
                                            金額小計:<c:out value="${ShoppingCart.subtotal}" default="0"/> 元</FONT>
               </TD>
            </TR>          
         </TABLE>
      </TD>
   </TR>   

   <c:forEach varStatus="stVar"  var="aProductBean"  items="${products_DPP}" >
      <!-- 用兩種顏色交替使用作為顯示商品資料的背景底色 -->
      <c:set var="rowColor" value="#DEFADE" />
      <c:if test="${ stVar.count % 2 == 0 }">
         <c:set var="rowColor" value="#FFEBFF" />
      </c:if>
      
      <TR bgColor="${rowColor}" height='25'>
         <TD rowspan='3' width='64'> 
             <!-- 
                 getImage所對應的Servlet會到資料庫讀取圖片並傳送給前端的瀏覽器
              -->
        <img height='100' width='80' 
     src='${pageContext.servletContext.contextPath}/RetrieveImageServlet?id=${aProductBean.productId}&type=PRODUCT'>
         </TD>
         <TD height='32' width='560'>
             <TABLE border='1'>
                <TR height='30'>
                    <TD width='200'>品名：${aProductBean.product}</TD>                  
                    <TD width='200'>生產者：${aProductBean.producterName}</TD>
                    <TD width='160'>庫存：${aProductBean.stock}</TD>
                </TR>
             </TABLE>
         </TD>
         <TD rowspan='3' width='180'align='center'>
       <!-- <FORM  action='BuyBook.do' method="POST">  --> 
       <!-- 
          FORM表單的資料會送後端的 _03_listBooks.controller.BuyBookServlet.java
                         來處理 
       -->
       <FORM  action="<c:url value='BuyProductServlet' />" method="POST">
                                購買數量:
               <input type='number' name='qty' style='width:60px' min='1' max='${aProductBean.stock}' required="required">
              <!--  <select name='qty'>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
               </select> -->
               <!-- 這些隱藏欄位都會送到後端 -->
               <Input type='hidden' name='productId' value='${aProductBean.productId}'>
               <Input type='hidden' name='product' value='${aProductBean.product}'>
               <Input type='hidden' name='producterId' value='${aProductBean.producterId}'>
               <Input type='hidden' name='unit' value='${aProductBean.unit}'>
               <Input type='hidden' name='content' value='${aProductBean.content}'>     
               <Input type='hidden' name='price' value='${aProductBean.price}'>
               <Input type='hidden' name='discount' value='${aProductBean.discount}'>
               <Input type='hidden' name='producterName' value='${aProductBean.producterName}'>
               <Input type='hidden' name='pageNo' value='${param.pageNo}'>
               <Input type='submit' value='加入購物車'>
       </FORM>
       </TD>
   </TR>   
   <TR height='32' bgColor="${rowColor}">
       <TD width='560'>
         <TABLE border='1'>
            <TR height='31'>
               <TD width='200'>上架日期：${aProductBean.addedDate}</TD>
               <TD width='200'>保質期：${aProductBean.shelfTime}天</TD>
               <TD width='160'>售價：${aProductBean.price}元</TD>
            </TR>
         </TABLE>
      </TD>
   </TR>
   <TR height='32' bgColor="${rowColor}">
       <TD width='560'>
           <TABLE border='1'> 
              <TR height='31'>
                 <TD width='160'>內含數量：${aProductBean.content}</TD>                 
                 <TD width='140'>數量單位：${aProductBean.unit}</TD>
                 <c:if test="${ aProductBean.discount != 1 }">
						<TD width='260' align="left"><Font color='red'>
						打${aProductBean.discount*10}折,&nbsp; 實售<fmt:formatNumber
							value="${aProductBean.price*aProductBean.discount}" pattern="####" />
						元,&nbsp;省<fmt:formatNumber
							value="${aProductBean.price - aProductBean.price*aProductBean.discount}"
							pattern="####" />元</Font></TD>
					</c:if>
                 <c:if test="${ aProductBean.discount == 1 }">
                     <TD width='260'>&nbsp;</TD>
                 </c:if>
              </TR>
           </TABLE>
       </TD>
   </TR>
</c:forEach> 
</TABLE>
</div>
<div id="paging" style="width: 1800px">
<!-- 以下為控制第一頁、前一頁、下一頁、最末頁 等超連結-->
<table border="1">
	<tr align="center">
		<td width='80' height='20'><c:if test="${pageNo > 1}">
			<div id="blfirst"><a
				href="<c:url value='RetrievePageProducts?pageNo=1' />"> <img
				border='0' alt='第一頁' height='30' width='30'
				src='./images/first-icon.png' /> </a></div>
		</c:if></td>
		<td width='80'><c:if test="${pageNo > 1}">
			<div id="blprev"><a
				href="<c:url value='RetrievePageProducts?pageNo=${pageNo-1}' />">
			<img border='0' alt='前一頁' height='30' width='30'
				src='./images/prev-icon.png' /></a></div>
		</c:if></td>
		<td width='76'>${pageNo} / ${totalPages}</td>
		<td width='80'><c:if test="${pageNo != totalPages}">
			<div id="blnext"><a
				href="<c:url value='RetrievePageProducts?pageNo=${pageNo+1}' />">
			<img border='0' alt='下一頁' height='30' width='30'
				src='./images/next-icon.png' /> </a></div>
		</c:if></td>
		<td width='80'><c:if test="${pageNo != totalPages}">
			<div id="bllast"><a
				href="<c:url value='RetrievePageProducts?pageNo=${totalPages}' />">
			<img border='0' alt='最末頁' height='30' width='30'
				src='./images/last-icon.png' /> </a></div>
		</c:if></td>
	</tr>
</table>
</div>
</body>
</html>
