<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<title>商品維護</title>
</head>
<body>
<!--  
  // 程式功能: 
  //  1. 顯示所有書籍(商品)資訊，書籍資訊以分頁的方式顯示，每頁顯示四筆書籍。
  //     使用者可以按下『第一頁』、『前一頁』、『下一頁』與『最後頁』逐頁地
  //     瀏覽商品。
  //  2. 提供『新增書籍』資料、『修改書籍資料』與『刪除某本書籍』的功能。
  //     
  //  3. 當使用者要新增某本書籍資料時，直接按下右上角『新增書籍』的超連結便可
  //     進入『新增書籍資料』的畫面(由BookInsert.php提供)，輸入新的書籍資料。
  //     當使用者要修改某本書籍資料時，可直接點選該本書籍的『書名』超連結，便
         可進入『更新書籍資料』的畫面(由BookUpdate.php提供)，可對該本書籍進行
         資料修改或刪除紀錄。
-->
<!-- 下列敘述設定變數funcName的值為BMT，top.jsp 會用到此變數 -->
<c:set var="funcName" value="BMT" scope="session" />
<!-- 引入共同的頁首 -->
<jsp:include page="MallTop.jsp" />
<div id='main'>
<center>${ ProductDeleteMsg }<br>
<c:remove var="ProductDeleteMsg" />
<div id="insert" style="width: 1350px;margin-left: 0px"><a href="<c:url value='/ProductPreInsertServlet' />" >新增紀錄</a></div>
<table border='2' width="690">
	<!--   購物車的標題   -->
	<TR>
		<TD colspan='3'>
		<TABLE width="680" BORDER='0' style="background: #ffE4C4">
			<TR height='5'>
				<TD align='center'>&nbsp;</TD>
			</TR>
			<TR height='30'>
				<TD align='center'><FONT color='#8000FA' size='+2'
					style="font-weight: 900;"> 商品資料維護 </FONT></TD>
			</TR>
			<TR height='5'>
				<TD align='center'>&nbsp;</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
	<!-- 
      forEach 顯示購物車的內容
      識別字串products_DPP為_03_listBooks.controller.DisplayPageProducts.java放入
      request物件
   -->
	<c:forEach varStatus="stVar" var="aProductBean" items="${products_DPP}">
		<!-- 用兩種顏色交替使用作為顯示商品資料的背景底色 -->
		<c:set var="rowColor" value="#DEFADE" />
		<c:if test="${ stVar.count % 2 == 0 }">
			<c:set var="rowColor" value="#FFEBFF" />
		</c:if>

		<tr height='18' bgColor="${rowColor}">
			<td width='600' colspan='2' align='left'>
			<table border='1' width='600'>
				<tr>
					<td width='600' align="left">產品名稱：<a
						href="ProductPreUpdateServlet?ProductId=${aProductBean.productId}&MaintainPageNo=${MaintainPageNo}">${aProductBean.product}</a>

					</td>
				</tr>
			</table>
			</td>
			<td rowspan='3' width='80'><!-- 
                 getImage所對應的Servlet會到資料庫讀取圖片並傳送給前端的瀏覽器
              --> <img height='100' width='80'
				src=<c:url value='retrieveImageServlet?id=${aProductBean.productId}&type=PRODUCT' />></td>
		</tr>
		
		<!--   以上為書名資料   -->
		<TR height='18' bgColor="${rowColor}">
			<TD width='600' align='left'>
			<TABLE border='1' width='600'>
				<TR>
					<TD width='400' align="left">上架日期：${aProductBean.addedDate}</TD>
					<TD width='200' align="left">
					保質期：${aProductBean.shelfTime}</TD>
				</TR>
			</TABLE>
			</TD>
		</TR>
		<!--   以上為作者、出版社資料   -->
		<TR bgColor="${rowColor}">
			<TD width='600' align='left'>
			<TABLE border='1' width='600'>
				<TR>
					<TD width='160' align="left">庫存：${aProductBean.stock}</TD>
					<TD width='140' align="left">售價：<fmt:formatNumber
						value="${aProductBean.price}" pattern="####" />元</TD>
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
		</tr>
		<!--   以上為書號、訂價、實售資料   -->
	</c:forEach>
</TABLE>
</CENTER>
</div>
<div id="bpaging" style="width: 1800px"><!-- 以下為控制第一頁、前一頁、下一頁、最末頁 等超連結-->
<table border="1" style="margin-right: 0px;">
	<tr align="center">
		<td width='80' height='20'><c:if test="${MaintainPageNo > 1}">
			<div id="blfirst"><a
				href="<c:url value='DisplayMaintainProduct?MaintainPageNo=1' />"> <img
				border='0' alt='第一頁' height='30' width='30'
				src='./images/first-icon.png' /> </a></div>
		</c:if></td>
		<td width='80'><c:if test="${MaintainPageNo > 1}">
			<div id="blprev"><a
				href="<c:url value='DisplayMaintainProduct?MaintainPageNo=${MaintainPageNo-1}' />">
			<img border='0' alt='前一頁' height='30' width='30'
				src='./images/prev-icon.png' /></a></div>
		</c:if></td>
		<td width='76'>${MaintainPageNo} / ${totalPages}</td>
		<td width='80'><c:if test="${MaintainPageNo != totalPages}">
			<div id="blnext"><a
				href="<c:url value='DisplayMaintainProduct?MaintainPageNo=${MaintainPageNo+1}' />">
			<img border='0' alt='下一頁' height='30' width='30'
				src='./images/next-icon.png' /> </a></div>
		</c:if></td>
		<td width='80'><c:if test="${MaintainPageNo != totalPages}">
			<div id="bllast"><a
				href="<c:url value='DisplayMaintainProduct?MaintainPageNo=${totalPages}' />">
			<img border='0' alt='最末頁' height='30' width='30'
				src='./images/last-icon.png' /> </a></div>
		</c:if></td>
	</tr>
</table>
</div>

</body>
</html>