<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動首頁</title>	
<style>

</style>
</head>
<body>
<form action="./ActiveHome" method="post">
<c:set var="funcName" value="ACT" scope="session" />
<jsp:include page="/top.jsp" />
   	 <h1 align="center">一日農夫</h1>
     <div align="center">
        <table  style="border:8px #FFD382 groove;"border="1" cellpadding="5">
            <caption>           
            	<h2>活動列表</h2>
            </caption>
            <tr>            
            <td style="border:0px" align="right" colspan="9"  >
	            <input name="apply" type="submit" value="申請">
	            <input name="selectall" type="submit" value="查詢全部"> 
            </td>
            </tr>
            <tr >
                <th>活動編號</th>
                <th>活動名稱</th>
                <th>活動地址</th>
                <th>連絡電話</th>
                <th>活動日期</th>
                <th>活動人數</th>
                <th>價格</th>
                <th>活動類型</th>
                <th>報名期間</th>
            </tr>
            <c:forEach var="Active" items="${listactives}">
                <tr>
                    <td><c:out value="${Active.act_id}"/></td>
                    <td><c:out value="${Active.act_name}"/></td>
                    <td><c:out value="${Active.act_addr}"/></td>
                    <td><c:out value="${Active.tel}"/></td>
                    <td><c:out value="${Active.act_date}"/></td>
                    <td><c:out value="${Active.exp_num}"/></td>
                    <td><c:out value="${Active.price}"/></td>
                    <td><c:out value="${Active.act_type}"/></td>                   
                    <td>
                    	<c:out value="${Active.date_sta}"/>
                    	到
                    	<c:out value="${Active.date_end}"/>
                    </td>                    
                </tr>
            </c:forEach>
            <tr>
                <td style="border:0px" colspan="4"></td>
                
	            <td style="border:0px" colspan="5">
		            <label for="">活動名稱:</label> 
					<input type="text" id="selectname" name="selectname">
					&nbsp;&nbsp;&nbsp;
					<input name="selectone" type="submit" value="查詢單筆">
	            </td>
            </tr>
            <tr>
	            <td style="border:0px" colspan="4"></td>
	            
            	<td style="border:0px" colspan="5">
            	<label for="">活動編號:</label> 
				<input type="text" id="selectid" name="selectid">
				&nbsp;&nbsp;&nbsp;
				<input name="delect" type="submit" value="刪除">
				<input name="update" type="submit" value="更新"> 	            	
            	</td>
            </tr>
        </table>
    </div>   
		
	</form>
</body>
</html>