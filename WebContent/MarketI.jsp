<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品管理</title>
</head>
<body>
<h2>
商品管理
</h2>
<!-- 上傳檔案時<form>標籤的 enctype屬性必須是 "multipart/form-data" -->
<!-- 而且method屬性必須是 "post" -->
<form action=".\MarketSellerServlet" method="post" enctype="multipart/form-data">
<jsp:include page="/top.jsp" />
<table  cellspacing="2" cellpadding="1" border="1" width="100%">
<tr>
    <td>商品名稱:</td>
    <td><input type="text" name="product_name" id="product_name" class='InputClass' size="20" maxlength="10"
     value="${requestScope.product_name}" size="20" />
           <font color='red' size='-1'>
              ${ErrMsg.errProduct_name}
           </font>
    </td>
</tr>
    <tr height="36" >
    <td >產品描述(75字以內)</td>
      <td>         
         <textarea name="description" cols="80" rows="4" value="${requestScope.description}" ></textarea>
         <font color='red' size='-1'>
                ${ErrMsg.errDescription}
            </font>
      </td>
    </tr>
<tr>
    <td>商品出產地:</td>
    <td><input type="text" name="product_area" id="product_area" size="20" maxlength="10"
       value="${requestScope.product_area}" size="20" />
           <font color='red' size='-1'>
              ${ErrMsg.errProduct_area}
           </font>
    </td>
</tr>
<tr>
    <td>價錢:</td>
    <td><input type="text" name="price" id="price" size="10" maxlength="10"
       value="${requestScope.price}" size="5" />
           <font color='red' size='-1'>
              ${ErrMsg.errPrice}
           </font>           
           
    </td>
</tr>
    <tr height='36'>
        <td >圖片</td>
        <td >
            <input style="background:#FFFFFF" class='InputClass'  type="file" 
            name="product_img" id="imgInp" size="25" /><br>
            <font color='red' size='-1'>${ErrMsg.errPicture}</font></td>
    </tr>
        <tr height="36" >
      <td height="61" colspan="6" align="center">
          
         <input type="submit" name="Submit" value="新增" />
      </td>
    </tr>
</table>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<form>
 <img id="blah" src="#" alt="your image" />
</form>
<script>
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    
    reader.onload = function(e) {
      $('#blah').attr('src', e.target.result);
    }
    
    reader.readAsDataURL(input.files[0]); // convert to base64 string
  }
}

$("#imgInp").change(function() {
  readURL(this);
});
</script>
<p>&nbsp;</p>
<c:remove var="ErrMsg" scope='session'/>
</body>
</html>