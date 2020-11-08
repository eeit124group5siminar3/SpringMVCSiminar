<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>金玉堂網路購物商城</title>
</head>
<body style="background:#EBFFEB;">
<c:remove var="ShoppingCart" scope="session"/>
<c:set var="funcName" value="END" scope="session"/>
<jsp:include page="MallTop.jsp" />
 <CENTER> 
 <h1>
 <c:choose>
 <c:when test="${empty login_ok}">
親愛的遊客你好:<hr>請記下下列序號以供訂單查詢<br>${login_guest.member_no}</c:when>
<c:otherwise>親愛的會員 ${login_ok.member_name} 您好：</c:otherwise>
</c:choose>
<BR><FONT COLOR='RED'>農遇</FONT><BR>
 感謝您的訂購<BR>
 期待您再度光臨 
  </h1> 
 <BR>
 
 </CENTER>
</body>
</html>