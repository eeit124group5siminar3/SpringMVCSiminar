<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${AppName}</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript">
	function setFocus(fld) {
		document.getElementById(fld).focus();
	}
</script>

</head>
<body onload="setFocus('title')" background="../images/bookMaintain.jpg">
	<!-- 引入共同的頁首 -->
	<jsp:include page="MallTop.jsp" />
	<div id='main'>
		<center>
			<div id="afterProductInsert">
				<font color='red' size='-1'>${successMsg.success}${ErrMsg.Exception}</font><br />
			</div>
			<div id="backToProductMaintainList">
				<a href=<c:url value="/DisplayMaintainProduct"/>>回維護首頁</a>
			</div>
			<!-- 上傳檔案時<form>標籤的 enctype屬性必須是 "multipart/form-data" -->
			<!-- 而且method屬性必須是 "post" -->
			<form:form id="form1" method="post" action="ProductInsertServlet" 
				enctype="multipart/form-data" modelAttribute="Insert">

				<table class="table_color" width="940" border="2" align="center"
					cellpadding="2" cellspacing="2" bordercolorlight="#FFFFFF"
					bordercolordark="#330033">
					<tr height='40'>
						<td colspan="4" align="center" valign="bottom">
							<TABLE width="680" BORDER='0' style="background: #ffE4C4">
								<TR height='5'>
									<TD align='center'>&nbsp;</TD>
								</TR>
								<TR height='20'>
									<TD align='center'><FONT color='#8000FA' size='+2'
										style="font-weight: 900;"> 新增商品資料 </FONT></TD>
								</TR>
								<TR height='5'>
									<TD align='center'>&nbsp;</TD>
								</TR>
							</TABLE>

						</td>
					</tr>
					<tr height='36'>
						<td width="120" align="center" class="title_font">產品名稱</td>
						<td width="350"><form:input name="product" 
								type="text" path="product" 
								size="6" /> <font color='red' size='-1'>
								${ErrMsg.errProduct} </font></td>
						<td width="120" align="center" class="title_font">價格</td>
						<td width="350"><form:input name="price" 
								type="text" path="price"  size="6" />
							<font color='red' size='-1'> ${ErrMsg.errPrice} </font></td>
					</tr>
					<tr height='36'>
						<td width="120" align="center" class="title_font">保質期</td>
						<td width="350"><form:input name="shelfTime"
								 type="text" 
								path="shelfTime" size="6" />天 <font
							color='red' size='-1'> ${ErrMsg.errShelfTime} </font></td>
						<td width="120" align="center" class="title_font">庫存</td>
						<td width="350"><form:input name="stock" 
								type="text"  path="stock" size="6" />
							<font color='red' size='-1'> ${ErrMsg.errStock} </font></td>
					</tr>
					<tr height='36'>
						<td width="120" class="title_font"><div align="center">內含數量</div></td>
						<td width="350"><form:input  name="content"
								type="text" path="content"
								size="6" /> <Font color='red' size='-1'>
								${ErrMsg.errContent} </Font></td>
						<td width="120" class="title_font"><div align="center">數量單位</div></td>
						<td width="350"><form:input name="unit"
								type="text" path="unit" size="6" />
							<font color='red' size='-1'> ${ErrMsg.errUnit} </font></td>
					</tr>
					<tr height='36'>
						<td width="120" align="center" class="title_font">圖片</td>
						<td colspan="1"><form:input style="background:#FFFFFF"
								 type="file" name="uploadFile" path="multipartFile" size="25" /><br>
							<font color='red' size='-1'>${ErrMsg.errPicture}</font></td>
						<td width="120" align="center" class="title_font">類型</td>
						<td colspan="1">${sessionScope.SelectCategoryTag} <font
							color='red' size='-1'>${ErrMsg.errCategory}</font></td>
					</tr>
					
					<tr height="36">
						<td width="120" align="center" class="title_font">描述</td>
						<td height="61" colspan="6" align="center"><form:textarea
								name="description" cols="80" rows="4"
								path="description"></form:textarea> <font
							color='red' size='-1'> ${ErrMsg.errDescription} </font></td>
					</tr>

					<tr height="36">
						<td height="61" colspan="6" align="center">
						<input type="submit" value="submit">
<%-- 						<form:button value="Send">Submit</form:button> --%>
						</td>
					</tr>
				</table>
			</form:form>
		</center>
	</div>
	<p>&nbsp;</p>
	<c:remove var="ErrMsg" scope='session' />
</body>
</html>