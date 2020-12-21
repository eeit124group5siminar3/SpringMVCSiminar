<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html lang="zh">
<head>
<title>農郁-預購商品管理</title>
<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="css/fontawesome-free/all.min.css">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="css/dist/adminlte.min.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">


<!-- -------------------DataTable引入的CDN---------------------------------------------------------------------- -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"> -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">

<!-- -------------------Sweetalert引入的CDN---------------------------------------------------------- -->
<link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">


<script type="text/javascript">
	function backHome() {
		document.act.action = "maintainActFarmer.do";
		document.act.submit();
		//window.location.herf="${pageContext.request.contextPath}/allActFarmer.do";
	}
</script>
</head>

<body class="goto-here">

<!-- --------Header&sideBar------------------------------------- -->
	<jsp:include page="/WEB-INF/pages/bar.jsp"/>

<!-------------------------內容區--------------------------------->
<section class="content-wrapper justify-content-center" style="background-color: #FFFFFF">
<div class="col-12" style="width:98%; margin:20px" >
	<div class="form-inline row justify-content-center align-items-center">
		<h2 >商品列表</h2>&emsp;&emsp;&emsp;
	    <form action="<c:url value='/MarketProduct.goInsertJsp'></c:url>" method="GET">
			<input name="apply" type="submit" value="新增商品" class="btn btn-primary">
		</form>
	 </div>	
	<table id="actFarmer" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>商品編號</th>
                <th>商品名稱</th>
                <th>商品描述</th>
                <th>商品出產地</th>
                <th>數量</th>
                <th>價格</th>
                <th>預購期間</th>
                <th>商品狀態</th>
               <th>圖片</th> 
				<th></th>
				<th></th>
			</tr>
        </thead>
        <tbody>
        <c:forEach var="IBean" items="${list}">
  <tr>
                    <td>${IBean.productId}</td>
                    <td><c:out value="${IBean.productName}"/></td>
                    <td Width="200"><c:out value="${IBean.marketProductImgBean.description}"/></td>                    
                    <td><c:out value="${IBean.productArea}"/></td>
                    <td><c:out value="${IBean.quantity}"/></td>      
<%--                     <td>1<c:out value="${IBean.unit}"/></td> --%>
                    <td><c:out value="${IBean.price}"/>元</td>
                    <td>開始時間:<c:out value="${IBean.openDay}"/>
                         <c:out value="${IBean.openDayTime}"/>
                         <br>
                                                                        結束時間:<c:out value="${IBean.closeDay}"/>
                        <c:out value="${IBean.closeDayTime}"/>                                                
                    </td>
                    <td><c:out value="${IBean.marketPutOutBean.status}"/></td>
                <td>  
				<img  height='80' width='80'
			        src=<c:url value='MarketImageServlet?id=${IBean.marketProductImgBean.productId}&type=PRODUCT'/>>
			       
			        </td>

                 <td>
                  <form action="<c:url value='/MarketProduct.goUpdateJsp'></c:url>" method="get">
                  <input type="hidden"  id="productid" name="productid" value="${IBean.productId}">
				 <input class="btn btn-primary py-2 px-2 "  type="submit" value="更新"> 
				  	 </form>
			     </td>
			     <td>
				<form action="<c:url value='/MarketProduct.delete'></c:url>" method="post">
				<input type="hidden"  id="productid" name="productid" value="${IBean.productId}">     
                 <input class="btn btn-primary py-2 px-2 " name="delete"  type="submit"  value="刪除">
                 </form>
                 </td>
                </tr>
		</c:forEach>
        </tbody>

    </table>
</div>
</div>
</section>
<!-------------------------/.內容區--------------------------------->

<!-- --------footer------------------------------------- -->
<!-- 	<footer class=" footer"> -->
<%-- 		<jsp:include page="/WEB-INF/pages/footer.jsp" /> --%>
<!-- 	</footer> -->

	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" /> 
 			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
 		</svg>
 	</div>


<!-- -------------------DataTable引入的js---------------------------------------------------------------------- -->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
	<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>

<!-- -------------------SweetAlert引入的js---------------------------------------------------------------------- -->	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>		
	

	
<!-- -------------------DataTable的javascript---------------------------------------------------------------------- -->
	<script>
	$(document).ready(function() {
	    $('#actFarmer').DataTable();
	} );
	</script>
	
<!-- -------------------SweetAlert引入的javascript---------------------------------------------------------------------- -->	
	<script>
	//foreach 寫法 //按鈕形態要改button 不可以是sumbit
		$('input[name=delete]').click(function() {
		Swal.fire({
			  title: '確定要刪除此筆資料嗎?',
			  text: "提醒您，一旦刪除無法復原喔!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '確定刪除!',
			  cancelButtonText: '取消'
			}).then((result) => {
			  if (result.isConfirmed) {
			    $(this).parent().submit();
			  }
			})
	});
	</script>
</body>

</html>