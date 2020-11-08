<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty login_ok&& empty login_guest}">
	<c:redirect url="/Member_SignUp/Member_Login.jsp" />
</c:if>
<title>個人訂單明細</title>
<style type="text/css">
#main {
	position: absolute;
	top: 110px;
	left: 210px;
}

#borderA {
	border: 1px solid black;
}
</style>
</head>
<body style="background: #EBFFEB;">
	<jsp:include page="MallTop.jsp" />
	<p />
	<TABLE style="margin-left: auto; margin-right: auto; background: #F0E4F4; border: 1px blue solid;">
		<tr id='borderA' height='50'>
			<th id='borderA' align="center" colspan="9"><h3>${login_ok.member_name}的訂單明細</h3></th>
		</tr>
		<tr id='borderA' height='36'>
			<td colspan="7">
				<table>
					<tr id='borderA'>
						<td align="Left" width="350px">
							<b>出貨地址：</b>${OrderBean.address}
						</td>
						<td align="center" width="300px">
							<b>訂購日期：</b>${OrderBean.orderDate}
						</td>
						<td align="center" width="280px">
							<b>訂單編號：</b>${OrderBean.orderId}
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr id='borderA' height='36'>
			<th id='borderA' width="100px" align="center">商品編號</th>
			<th id='borderA' width="50px" align="center">狀態</th>
			<th id='borderA' width="200px" align="center">商品資訊</th>
			<th id='borderA' width="100px" align="center">生產者</th>
			<th id='borderA' width="70px" align="center">單價</th>
			<th id='borderA' width="50px" align="center">數量</th>
			<th id='borderA' width="100px" align="center">總價</th>
			<th id='borderA' width="80px" align="center">折扣</th>
			<th id='borderA' width="100px" align="center">售價</th>
		</tr>
		<c:set var="subtotal" value="0" />
		<c:forEach var="aBean" varStatus="stat" items="${OrderBean.items}">
			<c:choose>
				<c:when test="${ stat.count % 2 == 0 }">
					<c:set var="aColor" value="#E6FFA0" />
				</c:when>
				<c:otherwise>
					<c:set var="aColor" value="#EBFFEB" />
				</c:otherwise>
			</c:choose>
			<tr id='borderA' bgColor="${aColor}" height='30'>
				<td id='borderA' align="center">${aBean.productId}</td>
				<td id='borderA' align="left">${aBean.status}</td>
				<td id='borderA' align="left">${aBean.description}</td>
				<td id='borderA' align="left">${aBean.producterName}</td>
				<td id='borderA' align="right">${aBean.unitPrice}&nbsp;</td>
				<td id='borderA' align="right">${aBean.amount}&nbsp;</td>
				<td id='borderA' align="right">${aBean.unitPrice*aBean.amount}&nbsp;</td>
				<td id='borderA' align="center">${aBean.discount}&nbsp;</td>
				<td id='borderA' align="right"><fmt:formatNumber
						value="${aBean.unitPrice*aBean.discount*aBean.amount}"
						pattern="#,###,###" />元</td>
				<c:set var="subtotal"
					value="${ subtotal + aBean.unitPrice * aBean.discount * aBean.amount }" />
			</tr>
		</c:forEach>
		<tr height='30'>
			<TD id='borderA' align="center" rowspan="3" colspan="7">&nbsp;</TD>
			<TD id='borderA' width="60px" align="center"><b>合 計</b></TD>
			<TD id='borderA' width="100px" align="right">
			   <fmt:formatNumber value="${subtotal}" pattern="#,###,###" />元</TD>
		</tr>
		<tr height='30'>
			<TD id='borderA' width="60px" align="center"><b>營業稅</b></TD>
			<c:set var="VAT" value="${subtotal*0.05 + 0.0001}" />
			<TD id='borderA' width="100px" align="right">
			   <fmt:formatNumber value="${VAT}" pattern="#,###,###" />元</TD>
		</tr>
		<tr height='30'>
			<TD id='borderA' width="60px" align="center"><b>總金額</b></TD>
			<TD id='borderA' width="100px" align="right">
			    <fmt:formatNumber value="${OrderBean.total}" pattern="#,###,###" />元</TD>
		</tr>
	</TABLE>
	<p />

	<div style="text-align: center">
		<a href="<c:url value='OrderListServlet' />">回上一頁</a>&nbsp;&nbsp;
		<a href="<c:url value='./index.jsp' />">回首頁</a>
	</div>
</body>
</html>
