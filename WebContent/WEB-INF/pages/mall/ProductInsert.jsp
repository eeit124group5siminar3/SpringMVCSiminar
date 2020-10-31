<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${AppName}</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />

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
     <font color='red' size='-1'>${successMsg.success}${ErrMsg.Exception}</font><br/>
  </div>
  <div id="backToProductMaintainList">
      <a href=<c:url value="/DisplayMaintainProduct"/>>回維護首頁</a>   
  </div>
<!-- 上傳檔案時<form>標籤的 enctype屬性必須是 "multipart/form-data" -->
<!-- 而且method屬性必須是 "post" -->
<form  id="form1" name="form1" method="post" 
       action=<c:url value="/ProductInsertServlet" /> enctype="multipart/form-data" >
  
<table  class="table_color" width="940" border="2" align="center" cellpadding="2" cellspacing="2" bordercolorlight="#FFFFFF" bordercolordark="#330033">
   <tr height='40'>
       <td colspan="4" align="center" valign="bottom"> 
           <TABLE width="680" BORDER='0' style="background:#ffE4C4">
            <TR height='5' >
                <TD align='center' >&nbsp;</TD>
            </TR>
            <TR height='20' >
                <TD  align='center' >
                   <FONT color='#8000FA' size='+2' style="font-weight:900;" >
                      新增商品資料
                   </FONT>
                </TD>
            </TR>
            <TR height='5' >
                <TD align='center' >&nbsp;</TD>
            </TR>
         </TABLE>
           
       </td>
    </tr>
    <tr height='36'>
       <td width="120" align="center" class="title_font">產品名稱</td>
       <td width="350"> 
           <input name="product" class='InputClass' type="text" id="product" 
              value="${requestScope.product}" size="6" />
           <font color='red' size='-1'>
              ${ErrMsg.errProduct}
           </font>
       </td>
        <td width="120" align="center" class="title_font">價格</td>
       <td width="350">
           <input name="price"  class='InputClass' type="text" id="price" 
              value="${requestScope.price}" size="6" />
           <font color='red' size='-1'>
              ${ErrMsg.errPrice}
           </font>
       </td>
    </tr>
    <tr height='36'>
       <td width="120" align="center" class="title_font">保質期</td>
       <td width="350" >
           <input name="shelfTime"  class='InputClass'  type="text" id="shelfTime" 
              value="${requestScope.shelfTime}" size="6" />天
           <font color='red' size='-1'>
              ${ErrMsg.errShelfTime}
           </font>
       </td>
       <td width="120" align="center" class="title_font">庫存</td>
       <td width="350">
           <input name="stock"  class='InputClass' type="text" id="stock" 
              value="${requestScope.stock}" size="6" />
           <font color='red' size='-1'>
              ${ErrMsg.errStock}
           </font>
       </td>
    </tr>
    <tr height='36'>
        <td width="120" class="title_font" ><div align="center">內含數量</div></td>
        <td width="350">
            <input class='InputClass' name="content" type="text" id="content" 
               value="${requestScope.content}" size="6" />
            <Font color='red' size='-1'>
               ${ErrMsg.errContent}
            </Font>
        </td>
        <td width="120" class="title_font" ><div align="center">數量單位</div></td>
        <td width="350">
        <input class='InputClass' name="unit" type="text" id="unit" 
            value="${requestScope.unit}" size="6" />
            <font color='red' size='-1'>
                ${ErrMsg.errUnit}
            </font>
        </td> 
    </tr>
    <tr height='36'>
        <td width="120" align="center" class="title_font">圖片</td>
        <td colspan="1">
            <input style="background:#FFFFFF" class='InputClass'  type="file" 
            name="uploadFile" size="25" /><br>
            <font color='red' size='-1'>${ErrMsg.errPicture}</font></td>
        <td width="120" align="center" class="title_font">類型</td>
        <td colspan="1">
            ${sessionScope.SelectCategoryTag}
            <font color='red' size='-1'>${ErrMsg.errCategory}</font></td>
    </tr>
    
    <tr height="36" >
    <td width="120"align="center" class="title_font">描述</td>
      <td height="61" colspan="6" align="center">         
         <textarea name="description" cols="80" rows="4" value="${requestScope.description}" ></textarea>
         <font color='red' size='-1'>
                ${ErrMsg.errDescription}
            </font>
      </td>
    </tr>
    
    <tr height="36" >
      <td height="61" colspan="6" align="center">
          
         <input type="submit" name="Submit" value="新增" />
      </td>
    </tr>
  </table>
</form>
</center>
</div>
<p>&nbsp;</p>
<c:remove var="ErrMsg" scope='session'/>
</body>
</html>