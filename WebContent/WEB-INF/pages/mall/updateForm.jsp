<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form id="form1" name="form1" method="post"
	action="ProductUpdateServlet" enctype="multipart/form-data"
	modelAttribute="updateBean">

	<table class="table_color" width="608" align="center" cellpadding="2"
		cellspacing="2">

		<tr height='40'>
			<td colspan="6" align="center" valign="bottom">
				<TABLE width="680">
					<TR height='5'>
						<TD align='center'>&nbsp;</TD>
					</TR>
					<TR height='20'>
					</TR>
					<TR height='5'>
						<TD align='center'>&nbsp;</TD>
					</TR>
				</TABLE>
			</td>
		</tr>
		<tr height='36'>
			<td width="120" align="center" class="title_font">產品名稱</td>
			<td width="200"><form:input name="product" class='InputClass'
					type="text" id="product" path="product" size="6" /> <font
				color='red' size='-1'> ${ErrMsg.errProduct} </font></td>
			<td width="120" align="center" class="title_font">價格</td>
			<td width="200"><form:input name="price" class='InputClass'
					type="text" id="price" path="price" size="6" /> <font color='red'
				size='-1'> ${ErrMsg.errPrice} </font></td>
		</tr>
		<tr height='36'>
			<td width="120" align="center" class="title_font">保質期</td>
			<td width="200"><form:input name="shelfTime" class='InputClass'
					type="text" id="shelfTime" path="shelfTime" size="6" />天 <font
				color='red' size='-1'> ${ErrMsg.errShelfTime} </font></td>
			<td width="120" align="center" class="title_font">庫存</td>
			<td width="200"><form:input name="stock" class='InputClass'
					type="text" id="stock" path="stock" size="6" /> <font color='red'
				size='-1'> ${ErrMsg.errStock} </font></td>
		</tr>
		<tr height='36'>
			<td width="120" class="title_font"><div align="center">內含數量</div></td>
			<td width="200"><form:input class='InputClass' name="content"
					type="text" id="content" path="content" size="6" /> <Font
				color='red' size='-1'> ${ErrMsg.errContent} </Font></td>
			<td width="120" class="title_font"><div align="center">數量單位</div></td>
			<td width="200"><form:input class='InputClass' name="unit"
					type="text" id="unit" path="unit" size="6" /> <font color='red'
				size='-1'> ${ErrMsg.errUnit} </font></td>
		</tr>
		<tr height='36'>
			<td width="120" class="title_font"><div align="center">折扣</div></td>
			<td width="200"><form:input class='InputClass' name="discount"
					type="text" id="discount" path="discount" size="6" /> <Font
				color='red' size='-1'> ${ErrMsg.errDiscount} </Font></td>
			<td width="120" class="title_font"><div align="center">類型</div></td>
			<td width="200">${SelectCategoryTag}<font color='red' size='-1'>${ErrMsg.errCategory}</font></td>
			</td>
		</tr>
		<tr height='36'>
			<td width="120" align="center" class="title_font">圖片</td>
			<td colspan='5'>
				<table border='0'>
					<tr>
						<td><img height='120' width='96'
							src=<c:url value='retrieveImageServlet?id=${updateBean.productId}&type=PRODUCT' /> />
						</td>
						<td colspan='2'><form:input style="background: #FFFFFF"
								class='InputClass' type="file" name="uploadFile"
								path="multipartFile" size="25" /> <font color='red' size='-1'>
								${ErrMsg.errPicture} </font></td>
					</tr>
				</table>
			</td>


		</tr>

		<tr height="36">
			<td width="120" align="center" class="title_font">描述</td>
			<td height="61" colspan="6" align="center"><form:textarea
					name="description" path="description" cols="80" rows="4"></form:textarea>
				<font color='red' size='-1'> ${ErrMsg.errDescription} </font></td>
		</tr>


		<tr height='35'>
			<td colspan='6' align='center'><form:input name="productId"
					type="hidden" id="productId" path="productId" /></td>
		</tr>
	</table>
	<div id="deleteMsg">
		${ErrMsg.errDBMessage}
		<%-- 				<input type="hidden" name="addedDate" value="${addedDate}" /> --%>
		<input type="hidden" name="pageNo" value="${param.pageNo}" />
	</div>
</form:form>