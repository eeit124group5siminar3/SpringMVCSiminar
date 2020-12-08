<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form id="updaeteForm" name="updaeteForm" method="post"
	action="UpdateProduct" enctype="multipart/form-data"
	modelAttribute="updateBean">

	<table style="width: 640px">
		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">產品名稱</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="product" type="text" id="product" path="product" size='4' />
				<font color='red' size='-1'> ${ErrMsg.errProduct} </font></td>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">價格</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="price" type="text" id="price" path="price" size='4' /> <font
				color='red' size='-1'> ${ErrMsg.errPrice} </font></td>
		</tr>
		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">保質期</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="shelfTime" type="text" id="shelfTime" path="shelfTime"
					size='4' />天 <font color='red' size='-1'>
					${ErrMsg.errShelfTime} </font></td>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">庫存</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="stock" type="text" id="stock" path="stock" size='4' /> <font
				color='red' size='-1'> ${ErrMsg.errStock} </font></td>
		</tr>
		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">內含數量</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="content" type="text" id="content" path="content" size='4' />
				<Font color='red' size='-1'> ${ErrMsg.errContent} </Font></td>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">數量單位</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="unit" type="text" id="unit" path="unit" size='4' /> <font
				color='red' size='-1'> ${ErrMsg.errUnit} </font></td>
		</tr>
		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">折扣</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"><form:input
					name="discount" type="text" id="discount" path="discount" size='4' />
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
							height='120' width='120'
							src=<c:url value='retrieveImageServlet?id=${updateBean.productId}&type=PRODUCT' /> id="updateImage"/>
						</td>
						<td style="padding-top: 0; padding-bottom: 5px" colspan='2'><form:input
								type="file" name="uploadFile" path="multipartFile" size='6' onchange="loadUpdateImageFile(event)"/>
							<font color='red' size='-1'> ${ErrMsg.errPicture} </font></td>
<!-- 					</tr> -->
<!-- 				</table> -->
<!-- 			</td> -->
		</tr>

		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5; width: 120px">描述</td>
			<td height="61" colspan="3" 
				style="padding-top: 0; padding-bottom: 5"><form:textarea
					name="description" path="description" cols="50" rows="4"></form:textarea>
				<font color='red' size='-1'> ${ErrMsg.errDescription} </font></td>
		</tr>
		<!-- 	<div id="deleteMsg"> -->
		<%-- 		${ErrMsg.errDBMessage} --%>
		<%-- 		<form:input name="productId" --%>
		<%-- 					type="hidden" id="productId" path="productId" /> --%>
		<%-- 		<input type="hidden" name="pageNo" value="${param.pageNo}" /> --%>
		<!-- 	</div> -->

	</table>
</form:form>
