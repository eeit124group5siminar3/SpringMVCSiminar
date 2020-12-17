<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form id="insertForm" name="insertForm" method="post"
	action="InsertProduct" enctype="multipart/form-data"
	modelAttribute="insertBean">

	<table style="width: 640px">
		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">產品名稱<sup style="color:red">*必填</sup></td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="product" type="text" id="product" path="product" size='4' required="required"/>
				<font color='red' size='-1'> ${ErrMsg.errProduct} </font></td>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">價格<sup style="color:red">*必填</sup></td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="priceS" type="text" id="priceS" path="priceS" size='4' required="required"/> <font
				color='red' size='-1'> ${ErrMsg.errPrice} </font></td>
		</tr>
		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">上架期<sup style="color:red">*必填</sup></td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="shelfTimeS" type="text" id="shelfTimeS" path="shelfTimeS"
					size='3' required="required"/>天 <font color='red' size='-1'>
					${ErrMsg.errShelfTime} </font></td>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">庫存<sup style="color:red">*必填</sup></td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="stockS" type="text" id="stockS" path="stockS" size='4' required="required"/> <font
				color='red' size='-1'> ${ErrMsg.errStock} </font></td>
		</tr>
		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">內含數量<sup style="color:red">*必填</sup></td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="contentS" type="text" id="contentS" path="contentS" size='4' required="required"/>
				<Font color='red' size='-1'> ${ErrMsg.errContent} </Font></td>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">數量單位<sup style="color:red">*必填</sup></td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="unit" type="text" id="unit" path="unit" size='4' required="required"/> <font
				color='red' size='-1'> ${ErrMsg.errUnit} </font></td>
		</tr>
		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">打折<sup style="color:red">*必填</sup></td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="discountS" type="text" id="discountS" path="discountS" size='4' required="required" placeholder="0~1"/>
				<Font color='red' size='-1'> ${ErrMsg.errDiscount} </Font></td>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">類型</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px">${SelectCategoryTag}<font
				color='red' size='-1'>${ErrMsg.errCategory}</font></td>

		</tr>
		<tr height='120'>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">圖片</td>
<!-- 			<td colspan='3'> -->
<!-- 				<table border='0'> -->
<!-- 					<tr> -->
						<td style="padding-top: 0; padding-bottom: 5px"><img
							height='120' width='120' id="newImage"
							src=<c:url value='retrieveImageServlet?id=${insertBean.productId}&type=PRODUCT' /> />
						</td>
						<td style="padding-top: 0; padding-bottom: 5px" colspan='2'><form:input
								type="file" name="uploadFile" path="multipartFile" size='6' id="newFile" onchange="loadImageFile(event)"/>
							<font color='red' size='-1'> ${ErrMsg.errPicture} </font></td>
<!-- 					</tr> -->
<!-- 				</table> -->
<!-- 			</td> -->
		</tr>

		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5; width: 120px">描述<sup style="color:red">*必填</sup></td>
			<td height="61" colspan="3" 
				style="padding-top: 0; padding-bottom: 5"><form:textarea
					name="description" path="description" cols="50" rows="4" required="required"></form:textarea>
				<font color='red' size='-1'> ${ErrMsg.errDescription} </font></td>
		</tr>
		<!-- 	<div id="deleteMsg"> -->
		<%-- 		${ErrMsg.errDBMessage} --%>
		<%-- 		<form:input name="productId" --%>
		<%-- 					type="hidden" id="productId" path="productId" /> --%>
		<%-- 		<input type="hidden" name="pageNo" value="${param.pageNo}" /> --%>
		<!-- 	</div> -->

	</table>
<%-- 	<form:input name="expiryDate" type="hidden" id="expiryDate" path="expiryDate" size='4'/> --%>
</form:form>
