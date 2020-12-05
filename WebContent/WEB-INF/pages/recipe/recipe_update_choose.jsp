<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>修改食譜</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<style>

 .fieldset{ 
 	margin-left:; 
 	margin-right: 20%; 
	
 } 
 .wrap { 
 	width: 800px; 
 	margin: auto; 
 	display: flex; 
 	align-items: center; 
 } 

 .wrap1 { 
 	vertical-align: middle; 
 	width: 30%; 
 	margin-left: 100px; 
	
	
 } 
 .wrap2 { 
 	vertical-align: middle; 
	width: 70%; 
 	margin-left: 150px; 
	
 } 
 .txt { 
 	width: 50%; 
 	vertical-align: middle; 
 	margin-left: 150px; 
 } 
  .deleteRecipe{  
  	width: 50%;  
  	vertical-align: middle;  
  	margin-left: 100px; 
  } 
</style>

</head>
<body class="goto-here">
<div id="deleteSuccess">
	<div class="py-1 bg-primary">
		<div class="container">
			<div
				class="row no-gutters d-flex align-items-start align-items-center px-md-0">
				<div class="col-lg-12 d-block">
					<div class="row d-flex">
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-phone2"></span>
							</div>
							<span class="text">0800-092-000</span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text">service@nonre.com</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="index.html">農郁</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> 列表
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a href="<c:url value='/index' />"
					class="nav-link" >首頁</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-tgogle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">商城</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="<c:url value='/mall_shop' />">商城</a> 
						<a class="dropdown-item" href="<c:url value='/mall_shoppingcart' />">購物車</a> 
						<a class="dropdown-item" href="<c:url value='/mall_order' />">查看訂單</a>
					</div></li>
				<!-- <li class="nav-item"><a href="product-single.html" class="nav-link">商城</a></li> -->
				
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-tgogle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">市場</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item"
								href="<c:url value='GoMarketHome'/>">市場</a>
						</div></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-tgogle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">活動</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="<c:url value='/actFarmerHome'/>">一日農夫</a>
						<a class="dropdown-item" href="<c:url value='/maintainActFarmer.do?MaintainPageNo=1'/>">一日農夫管理頁面</a>
						<a class="dropdown-item" href="<c:url value='        '/>">農農市集</a>
						<a class="dropdown-item" href="<c:url value='        '/>">農農市集管理頁面</a>
					</div>
				</li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-tgogle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">食譜</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item"
							href="<c:url value='frontPage.controller'/>">食譜</a> 
						<a class="dropdown-item"
							href="<c:url value='uploadPage.controller'/>">上傳食譜</a> 
							<a
							class="dropdown-item"
							href="<c:url value='updatePage.controller'/>">修改食譜</a> 
							<a
							class="dropdown-item"
							href="<c:url value='myRecipe'/>">我的食譜</a>
					</div></li>

				<li class="nav-item"><c:if test="${empty login_ok}">
						<a class="nav-link" href="<c:url value='login.controller' />">會員</a>
					</c:if> <c:if test="${!empty login_ok}">
						<a class="nav-link" href="<c:url value='backstage.controller' />">會員</a>
					</c:if></li>
				<li class="nav-item"><c:if test="${empty login_ok}">
						<a class="nav-link" href="<c:url value='login.controller' />">登錄</a>
					</c:if></li>
				<li class="nav-item cta cta-colored"><a href="<c:url value='/mall_shoppingcart' />"
					class="nav-link"><span class="icon-shopping_cart"></span>[${ShoppingCart.itemNumber}]</a></li>
					
				<li class="nav-item cta cta-colored"><a href="<c:url value='' />"
					class="nav-link"><img height='15' width='15'
					 src="images/MarketBasket.jpg">[0]</a></li>
			</ul>
			<c:if test="${!empty login_ok}">
			<ul class="navbar-nav">
				<li class="nav-item cta cta-colored"><a class="nav-link">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspNo.${login_ok.member_no}&nbsp&nbsp${login_ok.member_name}&nbsp您好！ </a></li>
			</ul>
			</c:if>
		</div>
	</div>
</nav>

	<!-------------------------內容區--------------------------------->
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand">Recipe</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<c:url value='blogPage.controller'/>">User Blog<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value='uploadPage.controller'/>">Upload</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value='updatePage.controller'/>">Update</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value='myRecipe'/>">Bookmark</a>
      </li>

<!--       <li class="nav-item dropdown"> -->
<!--         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> -->
<!--           Dropdown -->
<!--         </a> -->
<!--         <div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!--           <a class="dropdown-item" href="#">Action</a> -->
<!--           <a class="dropdown-item" href="#">Another action</a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a class="dropdown-item" href="#">Something else here</a> -->
<!--         </div> -->
<!--       </li> -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> -->
<!--       </li> -->
    </ul>
    
<%--     <form class="form-inline my-2 my-lg-0" action='<c:url value="/searchSubmit.controller"/>' method="post"> --%>
<!--       <input class="form-control mr-sm-2" type="search" placeholder="search delicious" aria-label="Search"> -->
<!--       <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="action">Search</button> -->
<%--     </form> --%>
  </div>
</nav>

<div id="Success"></div>

	<div align="center" >
	<fieldset class="border signup-form-fieldset">
		<legend style="color:black;font-size:23px;">已上傳食譜</legend>		
			
<c:forEach  var='BeanToken' items="${user_recipe}">	
	<form class="formSet" action="javascript:void(0);" method="post"> 	
		<div class="wrap">

				<div class="wrap1">
					<a href="<c:url value='/updateProcess.controller?choose=${BeanToken.rec_id}' />"
					   class="list-group-item list-group-item-action list-group-item-warning" 
					   style="width: 200px;" class="wrapLink">
					   ${BeanToken.name}</a>
				</div>
				
					<div class="txt">上傳日期 : 
						${BeanToken.date}
					</div>
					<div class="deleteRecipe">	
 					<input type="hidden" id="delete_id" name="delete_id" value="${BeanToken.rec_id}" />						
						<input class="btn btn-outline-danger" id="send" type="submit" onclick="fun(${BeanToken.rec_id})" name="delete" value="刪除" />
 					</div> 
 				<br> 
		</div>
		<br>
		
		
	</form>
</c:forEach>
	</fieldset>
	</div>
			<div style="text-align: center;">
				<label>
					<input type="submit" name="action" value="回首頁">
				</label>
			</div>





<br>

	<!------------------------------------------------------------------>
	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row">
				<div class="mouse">
<!-- 					<a href="#" class="mouse-icon"> -->
<!-- 						<div class="mouse-wheel"> -->
<!-- 							<span class="ion-ios-arrow-up"></span> -->
<!-- 						</div> -->
<!-- 					</a> -->
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">農郁</h2>
						<p>最適合您的電商平台</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<!-- <h2 class="ftco-heading-2">Menu</h2> -->
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">商城</a></li>
							<li><a href="#" class="py-2 d-block">關於我</a></li>
							<!-- <li><a href="#" class="py-2 d-block">Journal</a></li> -->
							<li><a href="#" class="py-2 d-block">聯絡我們</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="ftco-footer-widget mb-4">
						<!-- <h2 class="ftco-heading-2">其他問題</h2> -->
						<div class="d-flex">
							<ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
								<li><a href="#" class="py-2 d-block">運送訊息</a></li>
								<li><a href="#" class="py-2 d-block">退換貨</a></li>
								<li><a href="#" class="py-2 d-block">條款及細則</a></li>
								<li><a href="#" class="py-2 d-block">隱私政策</a></li>
							</ul>
							<ul class="list-unstyled">
								<li><a href="#" class="py-2 d-block">常見問題</a></li>
								<!-- <li><a href="#" class="py-2 d-block">Contact</a></li> -->
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<!-- <h2 class="ftco-heading-2">Have a Questions?</h2> -->
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">320 桃園市中壢區中大路300號</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">0800-092-000</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">service@nonre.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
<!-- 						<script> -->
<!--  							document.write(new Date().getFullYear()); -->
<!--  						</script>  -->
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>.
						Downloaded from <a href="https://themeslab.org/" target="_blank">Themeslab</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
</div>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
 	
 	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(function () {

            $("#myDataTalbe").DataTable({
                searching: true,
                columnDefs: [{
                    targets: [3],
                    orderable: false,
                }]
            });
        });
    </script>
 	
 	 	<script type="text/javascript"> 
// 		$(function(){		
// // 			var data=$("#delete_id").serializeArray();
// 			$("#send").click(function(){
// 				var delete_id=$("#delete_id").val();
// 				console.log('delete_id: '+delete_id);
// 				$.ajax({
// 					type:"GET",
// 	 				dataType:"html",
// 					url:"./deleteConfirm",
// 					data:{
// 						"rec_id":delete_id
// 						},
// 					success:function(data){
// 						console.log(data);
// 						alert('刪除成功');
// 						$("#deleteSuccess").html(data);

// 						},
// 					error:function(){
// 						}	
// 					});
// 				});
// 			});

		function fun(rec_id){
			var deleteSuccess=document.getElementById("deleteSuccess");
			var xhr = new XMLHttpRequest();	
			xhr.onreadystatechange = function(){
				if (xhr.readyState === 4) {
					// 伺服器回應成功
					if (xhr.status === 200) {
						// 收到伺服器的回應
						alert('刪除成功');
						deleteSuccess.innerHTML= xhr.responseText;
					}
				}	
			}
			var url = "<c:url value='/deleteConfirm?rec_id=" + rec_id + "' />"
			xhr.open("GET",url,true);
			xhr.send();
			}
 	</script>  
 	
<!-- <script type="text/javascript"> 
$(function(){
	var currentPage=1;
	var totalPages;
	console.log('currentPage'+currentPage);
	function list(){
		$.ajax({
// 			type:"GET",
// 			url:"${pageContext.request.contextPath}/ChoosePage/"+currentPage, 
			$.getJSON("./ChoosePage/"+currentPage, {jsonData: JSON.stringify(getFormData())}, 
					function(data) 
					{
					alert(data[0].name);
					});
// 			success:function(data){
// 				alert('succccccccccccccccces');
// 				console.log(data.length);
// 				var data=response.searchMyRecipe;
// 				console.log('length'+data.length);

// 				var data2=response.pageNo;
// 				console.log('pageNo'+data2);

// 				let content="";
// 				for(var i=0;i<data.length;i++){
// 				var val=data[i];
// 					content+=
// 						`<div class="row">
// 			    			<div class="col-md-6 col-lg-3 ftco-animate">
			    
// 			    				<div>							                                                                           
// 					              <a href="<c:url value='/recipeDetail.controller?rec_id=\${val.rec_id}'/>" class="block-20" 
// 						              style="background-image: url('<c:url value='/getALLImage.controller?rec_id=\${val.rec_id}'/>');">
// 					              </a>
			    						
// 			    					<div class="text py-3 pb-4 px-3 text-center">
// 			    							<a href="<c:url value='/recipeDetail.controller?rec_id=\${val.rec_id}'/>">\${val.name}</a>
// 				    					<div style="float: right;"
// 				    							<a href="<c:url value='/bookmark?rec_id=\${val.rec_id}'/>" class="heart d-flex justify-content-center align-items-center " id="heart" >
// 				    								<span><i class="ion-ios-heart"></i></span>
// 				    							</a>
// 			    						</div>
// 			    					</div>
// 			    				</div>
// 			    			</div>  					    		
// 			    		</div>`;

		           	
 
		           
// 						`<div><p>累積人氣: \${val.name}</p>
// 		                <p>\${val.desc}</p></div>`;
// 				console.log('val.rec_id: '+val.rec_id);
// 					}
// 				$("#Success").html(content);
		


				currentPage=response.pageNo;
				console.log('1: '+currentPage);
				totalPages=response.totalPage;
				console.log('2: '+totalPages);
				
				content=
					`<li>
						<div id="afirst"><a href="#" onclick="pagechange('first')">
								&lt;&lt;</a>
						</div>
					</li>
					<li>
						<div id="apre"><a href="#" onclick="pagechange('pre')">
								&lt;</a>
						</div>
					</li>
					<li>\${currentPage}/ \${totalPages}</li>
					<li>
						<div id="bnext"><a href="#" onclick="pagechange('next')">

								&gt;</a>
						</div>
					</li>
					<li>
						<div id="blast"><a href="#" onclick="pagechange('last')">
								&gt;&gt;</a>
						</div>
					</li>`;
					$("#nowPage").html(content);
									
				
				}
			});
		}
//		<img border='0' alt='下一頁' height='30' width='30' src='./images/next-icon.png'/> </a></div>
});
		
	function pagechange(val){
		console.log(val);
		console.log(currentPage);
		console.log(totalPages);
		if(val=='first'){
			currentPage=1;
			list();
		}else if(val=='pre'){
			if(currentPage>1){
				currentPage--;
				list();
				}else{
					currentPage=1;
					list();
				}	
		}
		else if(val=='next'){
			if(currentPage<totalPages){
				currentPage++;
				list();
				}else{
					currentPage=totalPages;					
					list();
					}
		}else{
			currentPage=totalPages;
			list();
			}
	
	
	}

</script> -->
</body>
</html>