<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- ???-->
<body onload="setFocus('title')" background="../images/bookMaintain.jpg">
<!-- 引入共同的頁首 -->  
<jsp:include page="/top.jsp" />
<div id='main'>
<center>
  <div id="afterActiveInsert">
     <font color='red' size='-1'>${succcessMsg.success}${ErrMsg.Exception}</font><br/>
  </div>
  <div id="backToActiveMaintainList">
      <a href="DisplayMaintainActives">回維護首頁</a>   
  </div>
<!-- 上傳檔案時<form>標籤的 enctype屬性必須是 "multipart/form-data" -->
<!-- 而且method屬性必須是 "post" -->
<form  id="form1" name="form1" method="post" 
       action="NActiveInsertServlet"  enctype="multipart/form-data" >
  
<table  class="table_color" width="680" border="2" align="center" cellpadding="2" cellspacing="2" bordercolorlight="#FFFFFF" bordercolordark="#330033">
   <tr height='40'>
       <td colspan="4" align="center" valign="bottom"> 
           <TABLE width="680" BORDER='0' style="background:#ffE4C4">
            <TR height='5' >
                <TD align='center' >&nbsp;</TD>
            </TR>
            <TR height='20' >
                <TD  align='center' >
                   <FONT color='#8000FA' size='+2' style="font-weight:900;" >
                      新增活動資料
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
       <td width="45" align="right" class="title_font">活動名稱</td>
       <td colspan="3"> 
           <input name="act_name" class='InputClass' type="text" id="title" 
              value="${request.act_name}" size="50" />
           <font color='red' size='-1'>
              ${ErrMsg.errTitle}
           </font>
       </td>
    </tr>
    <tr height='36'>
       <td width="45" align="right" class="title_font">活動地址</td>
       <td colspan="3"> 
           <input name="act_addr" class='InputClass' type="text" id="act_addr" 
              value="${request.act_addr}" size="50" />
           <font color='red' size='-1'>
              ${ErrMsg.errTitle}
           </font>
       </td>
    </tr>
     <tr height='36'>
       <td width="45" align="right" class="title_font">活動日期</td>
       <td colspan="3"> 
           <input name="act_date" class='InputClass' type="text" id="act_date" 
              value="${request.act_date}" size="50" />
           <font color='red' size='-1'>
              ${ErrMsg.errTitle}
           </font>
       </td>
    </tr>
    <tr height='36'>
       <td width="45" align="right" class="title_font">連絡電話</td>
       <td colspan="3"> 
           <input name="tel" class='InputClass' type="text" id="tel" 
              value="${request.tel}" size="50" />
           <font color='red' size='-1'>
              ${ErrMsg.errTitle}
           </font>
       </td>
    </tr>
    <tr height="36" >
      <td height="61" colspan="6" align="center">
     <tr height='36'>
       <td width="45" align="right" class="title_font">參與人數</td>
       <td colspan="3"> 
           <input name="exp_num" class='InputClass' type="text" id="exp_num" 
              value="${request.exp_num}" size="50" />
           <font color='red' size='-1'>
              ${ErrMsg.errTitle}
           </font>
       </td>
    </tr>
    <tr height="36" >
      <td height="61" colspan="6" align="center">
     <tr height='36'>
       <td width="45" align="right" class="title_font">參與人數</td>
       <td colspan="3"> 
           <input name="exp_num" class='InputClass' type="text" id="exp_num" 
              value="${request.exp_num}" size="50" />
           <font color='red' size='-1'>
              ${ErrMsg.errTitle}
           </font>
       </td>
    </tr>
    <tr height="36" >
      <td height="61" colspan="6" align="center">
     <tr height='36'>
       <td width="45" align="right" class="title_font">價格</td>
       <td colspan="3"> 
           <input name="price" class='InputClass' type="text" id="price" 
              value="${request.price}" size="50" />
           <font color='red' size='-1'>
              ${ErrMsg.errTitle}
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