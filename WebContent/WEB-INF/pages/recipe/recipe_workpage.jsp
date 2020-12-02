<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>農郁</title>
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
* {
	box-sizing: border-box;
}

/* .wrap{ */
/* 	width: 600px; */
/* 	margin: auto; */
/* 	display:flex; */
/* 	align-items:center; */
/* 	padding-top: 10px; */
/* } */

/* .wrap img{ */
/* 	width: 250px; */
/* 	height:200px; */
/* 	vertical-align: middle; */
/* 	margin:20px; */

/* } */
/* .wrap h3{ */
/* 	width: 250px; */
/* 	height:200px; */
/* 	vertical-align: middle; */
/* 	margin:20px; */

/* } */

/* .txt{ */
/* 	width: 50%; */
/* 	vertical-align: middle; */
/* 	padding-left: 20px; */
/* } */
.heart:hover {
	color: red;
}
</style>


</head>
<body>
<body class="goto-here">


	<jsp:include page="../header.jsp" />

	<!-------------------------內容區--------------------------------->


	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand">Recipe</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="<c:url value='blogPage.controller'/>">User Blog<span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='uploadPage.controller'/>">Upload</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='updatePage.controller'/>">Update</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='myRecipe'/>">Bookmark</a></li>

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

			<form class="form-inline my-2 my-lg-0" id="search"
				action="javascript:void(0);" method="post">
				<input class="form-control mr-sm-2" type="text" id="searchInput"
					name="searchInput" placeholder="search delicious"
					aria-label="Search" /> <input
					class="btn btn-outline-success my-2 my-sm-0" 　onblur="ch()"
					id="send" type="submit" name="action" value="Search" />
			</form>
		</div>
	</nav>

	<p style="font-size: 60px; text-align: center;">美食推薦</p>


	<!-- --------------------------------------------------------------------- -->


	<section class="ftco-section">
		<div class="container">
			<!--     		<div class="row justify-content-center"> -->
			<!--     			<div class="col-md-10 mb-5 text-center"> -->
			<!--     				<ul class="product-category"> -->
			<!--     					<li><a href="#" class="active">All</a></li> -->
			<!--     					<li><a href="#">Vegetables</a></li> -->
			<!--     					<li><a href="#">Fruits</a></li> -->
			<!--     					<li><a href="#">Juice</a></li> -->
			<!--     					<li><a href="#">Dried</a></li> -->
			<!--     				</ul> -->
			<!--     			</div> -->
			<!--     		</div> -->




			<!--     		<div class="row"> -->
			<%--     		<a href="<c:url value='/tesstt'/>">123</a> --%>
			<%--     		<c:forEach var='BeanToken'  items="${searchAll}"> --%>
			<!--     			<div class="col-md-6 col-lg-3 ftco-animate"> -->
			<!--     				<div class="product">								 -->
			<%--     						<a href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>" class="img-prod"><img class="img-fluid" src="<c:url value='/getALLImage.controller?rec_id=${BeanToken.rec_id}'/>" alt=""> --%>
			<!--     						</a>	 -->

			<!--     					<div class="text py-3 pb-4 px-3 text-center"> -->
			<%--     							<a href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a> --%>





			<!-- <!--     						<div class="d-flex"> -- -->
			<!-- <!--     							<div class="pricing"> -- -->
			<!-- <!-- 		    						<p class="price"><span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span></p> -- -->
			<!-- <!-- 		    					</div> -- -->
			<!-- <!-- 	    					</div> -- -->
			<!-- 	    					<div style="float: right;"> -->
			<!-- <!-- 	    						<div class="m-auto d-flex"> -- -->
			<!-- <!-- 	    							<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center"> -- -->
			<!-- <!-- 	    								<span><i class="ion-ios-menu"></i></span> -‐ -->
			<!-- <!-- 	    							</a> -- -->
			<!-- <!-- 	    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1"> -- -->
			<!-- <!-- 	    								<span><i class="ion-ios-cart"></i></span> -- -->
			<!-- <!-- 	    							</a> -- -->
			<%-- 	    							<a href="<c:url value='/bookmark?rec_id=${BeanToken.rec_id}'/>" class="heart d-flex justify-content-center align-items-center " id="heart" > --%>
			<!-- 	    								<span><i class="ion-ios-heart"></i></span> -->
			<!-- 	    							</a> -->
			<!-- <!--     							</div>   -- -->
			<!--     						</div> -->
			<!--     					</div> -->
			<!--     				</div> -->
			<!--     			</div> -->


			<%--     		</c:forEach> --%>


			<!--     		</div> -->
		</div>

		<div id="searchSuccess">
			<div id="Success"></div>


			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<ul id="nowPage">
						</ul>
					</div>
				</div>
			</div>

		</div>
	</section>

	<!------------------------------------------------------------------>
	<jsp:include page="../footer.jsp" />

	<script type="text/javascript">
	$(function(){
		 				
		console.log(searchInput)
		var searchSuccess=$("#searchSuccess");
// 		var params=$('#search').serialize();
		$("#send").click(function(){
		var searchInput=$('#searchInput').val();
        console.log('-------------------------'+searchInput);
			$.ajax({
				type:"GET",
				url:"./searchSubmit.controller",
				contentType: "application/json; charset=utf-8",
		        data:{
			        	"input":searchInput}, 						 
 				beforeSend: function(XMLHttpRequest) {
            		console.log(XMLHttpRequest);
        			},
				success:function(data){
					$("#searchSuccess").html(data);
       				console.log(data.length);
						
       			    var html = "";
       			    var str=" ";
                    for(var i=0;i<data.length;i++){    //遍歷data數組
                         var ls = data[i];   
                         var ingredients_A=ls.ingredients_A;
                         html +=
		           ` <div class="blog-entry align-self-stretch d-md-flex"> 
		              <a href="<c:url value='/recipeDetail.controller?rec_id=\${ls.rec_id}'/>" class="block-20" target="_blank"
			              style="background-image: url('<c:url value='/getALLImage.controller?rec_id=\${ls.rec_id}'/>');">
		              </a>
		              <div class="text d-block pl-md-4">

		                <h3 class="heading"><a href="<c:url value='/recipeDetail.controller?rec_id=\${ls.rec_id}'/>" target="_blank">\${ls.name}</a><h5>累積人氣: \${ls.views}</h5></h3>
		                <p>\${ls.desc}</p>
		                <p><a href="<c:url value='/recipeDetail.controller?rec_id=\${ls.rec_id}'/>" target="_blank" class="btn btn-primary py-2 px-3">Read more</a></p>
		              </div>
		            </div>
		          </div>`;
						
                		console.log('ls.ingredients_A: '+ls.ingredients_A);
                    	}
                  		console.log(html);
                        $("#searchSuccess").html(html); 
						},
				error:function(){
					}	
				});
			});
			});

</script>
	<script type="text/javascript"> 
	var currentPage=1;
	var totalPages;
	function list(){
		$.get({
			url:"${pageContext.request.contextPath}/getPageInfo/"+currentPage,
			
			success:function(response){
				console.log(response);
				var data=response.searchAllRecipe;
				console.log('length'+data.length);

				var data2=response.pageNo;
				console.log('pageNo'+data2);

				let content="";
				for(var i=0;i<data.length;i++){
				var val=data[i];
					content+=
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

		           `<div style="margin:auto;width:1500px"><div class="blog-entry align-self-stretch d-md-flex"> 
		           	
		             	 <a href="<c:url value='/recipeDetail.controller?rec_id=\${val.rec_id}'/>" class="block-20"
			            	  style="background-image: url('<c:url value='/getALLImage.controller?rec_id=\${val.rec_id}'/>');">
		              	</a>
		           
		            <div class="text d-block pl-md-4">
						<h3 class="heading"><a href="<c:url value='/recipeDetail.controller?rec_id=\${val.rec_id}'/>">\${val.name}</a><h5>累積人氣: \${val.views}</h5></h3>
		                <p>\${val.desc}</p>
		                <p><a href="<c:url value='/recipeDetail.controller?rec_id=\${val.rec_id}'/>" class="btn btn-primary py-2 px-3">Read more</a>            
	                    </p>
		             </div>
		            </div>
		            </div><br>`;
				console.log('val.rec_id: '+val.rec_id);
					}
				$("#Success").html(content);
		


				currentPage=response.pageNo;
				console.log('1: '+currentPage);
				totalPages=response.totalPage;
				console.log('2: '+totalPages);
				
				content=`
					<li>
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
	window.onload = list();
		
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

</script>
</body>
</html>