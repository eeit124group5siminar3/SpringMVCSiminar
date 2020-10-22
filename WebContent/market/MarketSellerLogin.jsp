<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登入的表單</title> 
</head> 
<body> 
<font color="red">${message }</font>
<form action=".\MarketSellerServlet" method="post">
帳號:<input type="text" name="userId"><br/>
密碼:<input type="password" name="pswd"><br/>
<input type="submit" name="login" value="登入">
</form> 
</body> 
</html> 