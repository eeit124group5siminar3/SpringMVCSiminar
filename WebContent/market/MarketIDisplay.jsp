<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增商品</title>
</head>
<body>
<jsp:useBean id="reg_student" class="marketSeller.MarketSellerBean" scope="session" />
<h2>
新增商品如下請確認
</h2>
<form action=".\MarketServlet" method="post">
<table  cellspacing="2" cellpadding="1" border="1" width="100%">
<tr bgcolor="#FFFFE1">
    <td>商品名稱:</td>
    <td><jsp:getProperty name="reg_student" property="name" /></td>
</tr>
<tr bgcolor="#FFFFE1">
    <td>商品介紹(200字以內):</td>
    <td><jsp:getProperty name="reg_student" property="name" /></td>
</tr>
<tr bgcolor="#FFFFE1">
    <td>商品出產地:</td>
    <td><jsp:getProperty name="reg_student" property="name" /></td>
</tr>
<tr bgcolor="#FFFFE1">
    <td>商價錢:</td>
    <td><jsp:getProperty name="reg_student" property="name" /></td>
</tr>


</table>
<center>
<input type="submit" name="confirm" value="確認" >
</center>
</form>
</body>
</html>