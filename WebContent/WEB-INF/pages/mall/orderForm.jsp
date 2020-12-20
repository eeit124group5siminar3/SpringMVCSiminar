<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<table style="width: 640px">
		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">產品</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px">${orderItem.description}</td>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">數量</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px">${orderItem.amount}</td>
		</tr>
		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">單價</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px">${orderItem.unitPrice}</td>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">折扣</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px">${orderItem.discount}</td>
		</tr>
		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">收件人</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px">${orderItem.productOrderBean.buyerName}</td>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">連絡電話</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px">${orderItem.productOrderBean.tel}</td>
<!-- 			<td align="center" -->
<!-- 				style="padding-top: 0; padding-bottom: 5px; width: 120px">收件地址</td> -->
<%-- 			<td style="padding-top: 0; padding-bottom: 5px; width: 120px">${orderItem.productOrderBean.address}</td> --%>
		</tr>
		<tr>
		<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">收件地址</td>
			<td style="padding-top: 0; padding-bottom: 5px;" colspan="3">${orderItem.productOrderBean.address}</td>
<!-- 			<td align="center" -->
<!-- 				style="padding-top: 0; padding-bottom: 5px; width: 120px">連絡電話</td> -->
<%-- 			<td style="padding-top: 0; padding-bottom: 5px; width: 120px">${orderItem.productOrderBean.tel}</td> --%>
<!-- 			<td align="center" -->
<!-- 				style="padding-top: 0; padding-bottom: 5px; width: 120px">統一編號</td> -->
<!-- 			<td style="padding-top: 0; padding-bottom: 5px; width: 120px"> -->
<%-- 			<c:if test="${!empty orderItem.productOrderBean.bNo}">${orderItem.productOrderBean.bNo}</c:if></td> --%>

		</tr>
		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">下訂時間</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px">${orderItem.productOrderBean.orderDate}</td>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">期望送達時間</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px">${orderItem.productOrderBean.shippingTimeWord}</td>

		</tr>

		<tr>
			<td align="center"
				style="padding-top: 0; padding-bottom: 5; width: 120px">總金額</td>
			<td height="61" 
				style="padding-top: 0; padding-bottom: 5">${Math.round(orderItem.amount*orderItem.unitPrice*orderItem.discount)}</td>
				<td align="center"
				style="padding-top: 0; padding-bottom: 5px; width: 120px">統一編號</td>
			<td style="padding-top: 0; padding-bottom: 5px; width: 120px">
			<c:if test="${!empty orderItem.productOrderBean.bNo}">${orderItem.productOrderBean.bNo}</c:if></td>
		</tr>
	</table>
