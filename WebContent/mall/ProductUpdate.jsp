<%@page import="mall.productModel.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
               "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${AppName}</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function setFocus() {
		document.getElementById("product").focus();
	}

	function confirmDelete() {
		if (confirm("確定刪除此項產品資料(產品名稱:${bean.product})?")) {
			document.forms[0].action = "ProductDeleteServlet?pageNo=${param.pageNo}&productId=${bean.productId}&product=${bean.product}";
			document.forms[0].method = "POST";
			document.forms[0].submit();
		} else {
		}
	}

	function updateProduct() {
		document.forms[0].action = "ProductUpdateServlet?pageNo=${param.pageNo}";
		document.forms[0].method = "POST";
		document.forms[0].submit();
	}
</script>

</head>
<body onload="setFocus()" background="../images/bookMaintain.jpg">

	<!-- 引入共同的頁首 -->
	<jsp:include page="MallTop.jsp" />
	<div id='main'>
		<center>
			<c:choose>
				<c:when test="${not empty param.ProductId }">

					<c:set var="product" value='${bean.product}' />
					<c:set var="shelfTime" value='${bean.shelfTime}' />
					<c:set var="price" value='${bean.price}' />
					<c:set var="content" value='${bean.content}' />
					<c:set var="stock" value='${bean.stock}' />
					<c:set var="description" value='${bean.description}' />
					<c:set var="unit" value='${bean.unit}' />
					<c:set var="category" value='${bean.category}' />
					<c:set var="discount" value='${bean.discount}' />
					<c:set var="addedDate" value='${bean.addedDate}' />
				</c:when>
				<c:otherwise>
					<!-- 
     <c:out value="第二次"/>
      -->
					<c:set var="product" value='${bean.product}' />
					<c:set var="shelfTime" value='${bean.shelfTime}' />
					<c:set var="price" value='${bean.price}' />
					<c:set var="content" value='${bean.content}' />
					<c:set var="stock" value='${bean.stock}' />
					<c:set var="description" value='${bean.description}' />
					<c:set var="unit" value='${bean.unit}' />
					<c:set var="category" value='${bean.category}' />
					<c:set var="discount" value='${bean.discount}' />
					<c:set var="addedDate" value='${bean.addedDate}' />
				</c:otherwise>
			</c:choose>
			<div id="afterProductInsert">
				<font color='red' size='-1'>${ErrMsg.Exception}</font><br />
			</div>
			<div id="backToProductMaintainList">
				<a href="DisplayMaintainProduct?pageNo=${param.pageNo}">回維護首頁</a>
			</div>
			<form id="form1" name="form1" method="post"
				action="ProductUpdateServlet" enctype="multipart/form-data">

				<table class="table_color" width="608" border="2" align="center"
					cellpadding="2" cellspacing="2" bordercolorlight="#FFFFFF"
					bordercolordark="#330033">

					<tr height='40'>
						<td colspan="6" align="center" valign="bottom">
							<TABLE width="680" BORDER='0' style="background: #ffE4C4">
								<TR height='5'>
									<TD align='center'>&nbsp;</TD>
								</TR>
								<TR height='20'>
									<TD align='center'><FONT color='#8000FA' size='+2'
										style="font-weight: 900;"> 更新商品資料 </FONT></TD>
								</TR>
								<TR height='5'>
									<TD align='center'>&nbsp;</TD>
								</TR>
							</TABLE>
						</td>
					</tr>
					<tr height='36'>
						<td width="120" align="center" class="title_font">產品名稱</td>
						<td width="350"><input name="product" class='InputClass'
							type="text" id="product" value="${product}" size="6" /> <font
							color='red' size='-1'> ${ErrMsg.errProduct} </font></td>
						<td width="120" align="center" class="title_font">價格</td>
						<td width="350"><input name="price" class='InputClass'
							type="text" id="price" value="${price}" size="6" /> <font
							color='red' size='-1'> ${ErrMsg.errPrice} </font></td>
					</tr>
					<tr height='36'>
						<td width="120" align="center" class="title_font">保質期</td>
						<td width="350"><input name="shelfTime" class='InputClass'
							type="text" id="shelfTime" value="${shelfTime}" size="6" />天 <font
							color='red' size='-1'> ${ErrMsg.errShelfTime} </font></td>
						<td width="120" align="center" class="title_font">庫存</td>
						<td width="350"><input name="stock" class='InputClass'
							type="text" id="stock" value="${stock}" size="6" /> <font
							color='red' size='-1'> ${ErrMsg.errStock} </font></td>
					</tr>
					<tr height='36'>
						<td width="120" class="title_font"><div align="center">內含數量</div></td>
						<td width="350"><input class='InputClass' name="content"
							type="text" id="content" value="${content}" size="6" /> <Font
							color='red' size='-1'> ${ErrMsg.errContent} </Font></td>
						<td width="120" class="title_font"><div align="center">數量單位</div></td>
						<td width="350"><input class='InputClass' name="unit"
							type="text" id="unit" value="${unit}" size="6" /> <font
							color='red' size='-1'> ${ErrMsg.errUnit} </font></td>
					</tr>
					<tr height='36'>
						<td width="120" class="title_font"><div align="center">折扣</div></td>
						<td width="350"><input class='InputClass' name="discount"
							type="text" id="discount" value="${discount}" size="6" /> <Font
							color='red' size='-1'> ${ErrMsg.errDiscount} </Font></td>
						<td width="120" class="title_font"><div align="center">類型</div></td>
						<td width="350">${SelectCategoryTag} <font color='red'
							size='-1'>${ErrMsg.errCategory}</font></td>
						</td>
					</tr>
					<tr height='36'>
						<td width="120" align="center" class="title_font">圖片</td>
						<td colspan='5'>
							<table border='0'>
								<tr>
									<td><img height='120' width='96'
										src='${pageContext.servletContext.contextPath}/RetrieveImageServlet?id=${bean.productId}&type=PRODUCT' />
									</td>
									<td colspan='2'><input style="background: #FFFFFF"
										class='InputClass' type="file" name="uploadFile" size="25"/>
										<font color='red' size='-1'> ${ErrMsg.errPicture} </font></td>
								</tr>
							</table>
						</td>


					</tr>

					<tr height="36">
						<td width="120" align="center" class="title_font">描述</td>
						<td height="61" colspan="6" align="center"><textarea
								name="description" cols="80" rows="4">${description}</textarea>
							<font color='red' size='-1'> ${ErrMsg.errDescription} </font></td>
					</tr>


					<tr height='35'>
						<td colspan='6' align='center'><input name="productId"
							type="hidden" id="productId" value="${param.ProductId }>" /> <input
							type="button" name="update" value="修改" onclick='updateProduct()' />
							&nbsp;&nbsp;&nbsp; <input type="button" name="delete" value="刪除"
							onclick="confirmDelete()" /></td>
					</tr>
				</table>
				<div id="deleteMsg">
					${ErrMsg.errDBMessage} 		
<%-- 				<input type="hidden" name="addedDate" value="${addedDate}" /> --%>
				<input type="hidden" name="pageNo" value="${param.pageNo}" />
				</div>
			</form>
			<p>&nbsp;</p>
		</center>
	</div>
</body>
</html>