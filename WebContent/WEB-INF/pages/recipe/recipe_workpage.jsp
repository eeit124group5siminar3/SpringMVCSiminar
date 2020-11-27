<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
*{
	box-sizing:border-box;
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
	 
	 
.heart:hover{
	 color:red;
}	 



</style>


</head>
<body>
<body class="goto-here">


		<jsp:include page="../header.jsp" />

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
    
    <form class="form-inline my-2 my-lg-0" id="search" action="javascript:void(0);" method="post">
      <input class="form-control mr-sm-2" type="text" id="searchInput" name="searchInput" placeholder="search delicious" aria-label="Search"/>
      <input class="btn btn-outline-success my-2 my-sm-0"　 onblur="ch()" id="send" type="submit" name="action" value="Search"/>
    </form>
  </div>
</nav>

<p style="font-size: 60px;text-align: center;">美食推薦</p>

<!-- <div class="container"> -->
<!-- 			<div class="row justify-content-center"> -->
<!-- 				<div class="col-md-10 mb-5 text-center"> -->
<!-- 					<ul class="product-category" id="product-category"></ul> -->
<!-- 						<input type="hidden" name="searchString" -->
<!-- 							value=${searchString}> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="row  ftco-animate" id="mall_products"></div> -->
<!-- 		</div> -->
<!-- 		<div id="mall_pages"></div> -->


<%-- <c:forEach var='BeanToken'  items="${searchAll}"> --%>
<!-- 		<div class="wrap" style="text-align: center;"> -->
<%-- 			<a href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>"> --%>
<!-- 					<img height="100" width="80"    -->
<%-- 					src="<c:url value='/getALLImage.controller?rec_id=${BeanToken.rec_id}'/>" /> --%>
<!-- 			</a> -->
					
<!-- 			<div class="txt"> -->
<!-- 					<h2> -->
<%-- 						<a href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a> --%>
<!-- 					</h2> -->
<!-- 					<hr> -->
<%-- 					<p>食材: ${BeanToken.ingredients_A} </p>	 --%>
<%-- 					<p>食材: ${BeanToken.ingredients_B} </p> --%>
<%-- 					<p>介紹 : ${BeanToken.desc}</p>				 --%>
<%-- 					<p>料理方法 : ${BeanToken.method}</p> --%>
				
<!-- 		</div> -->
<!-- 	</div> -->


<!-- --------------------------------------------------------------------- -->


      <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-10 mb-5 text-center">
    				<ul class="product-category">
    					<li><a href="#" class="active">All</a></li>
    					<li><a href="#">Vegetables</a></li>
    					<li><a href="#">Fruits</a></li>
    					<li><a href="#">Juice</a></li>
    					<li><a href="#">Dried</a></li>
    				</ul>
    			</div>
    		</div>
    		
    		<div id="searchSuccess">
    		
    		<div class="row">
    		<c:forEach var='BeanToken'  items="${searchAll}">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">								
    						<a href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>" class="img-prod"><img class="img-fluid" src="<c:url value='/getALLImage.controller?rec_id=${BeanToken.rec_id}'/>" alt="">
    						</a>	
    						
    					<div class="text py-3 pb-4 px-3 text-center">
    							<a href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a>
    						




<!--     						<div class="d-flex"> -->
<!--     							<div class="pricing"> -->
<!-- 		    						<p class="price"><span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span></p> -->
<!-- 		    					</div> -->
<!-- 	    					</div> -->
	    					<div style="float: right;">
<!-- 	    						<div class="m-auto d-flex"> -->
<!-- 	    							<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center"> -->
<!-- 	    								<span><i class="ion-ios-menu"></i></span> -->
<!-- 	    							</a> -->
<!-- 	    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1"> -->
<!-- 	    								<span><i class="ion-ios-cart"></i></span> -->
<!-- 	    							</a> -->
	    							<a href="<c:url value='/bookmark?rec_id=${BeanToken.rec_id}'/>" class="heart d-flex justify-content-center align-items-center " id="heart" >
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
<!--     							</div>   -->
    						</div>
    					</div>
    				</div>
    			</div>
    		
    		
    		</c:forEach>
    		</div>
    		<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
    	</div>
    	</div>
    	
    </section>


<!-- --------------------------------------------------------------------- -->




<%-- </c:forEach> --%>
	
	
	
<!-- 	</form> -->
	<!------------------------------------------------------------------>
	<jsp:include page="../footer.jsp" />

	<script type="text/javascript">
	$(function(){
		 				
		console.log(searchInput)
		var searchSuccess=$("#searchSuccess");
// 		var params=$('#search').serialize(); //把id为login的form表单里的参数自动封装为参数传递
		$("#send").click(function(){
		var searchInput=$('#searchInput').val();
        console.log('-------------------------'+searchInput);
			$.ajax({
				type:"GET",
				url:"./searchSubmit.controller",
// 				dataType:"json",
				contentType: "application/json; charset=utf-8",
// 				async : true,
		        data:{
			        	"input":searchInput}, 						 
// 					'input='+searchInput,
 				beforeSend: function(XMLHttpRequest) {
            		console.log(XMLHttpRequest);
        			},
				success:function(data){
					$("#searchSuccess").html(data);
// 					alert("successsssssssss");
       				console.log(data.length);
//            	     $.each(data,function(i,list){
//            	      alert(list[0]);
//            	     });
						
       			    var html = "";
       			    var str=" ";
                    for(var i=0;i<data.length;i++){    //遍歷data數組
                         var ls = data[i];   
                         var ingredients_A=ls.ingredients_A;

//                           	searchProduct(ingredients_A);
//                          html +=
//                          "<div align='center'><p><a href='<c:url value='/RetrieveSearch/?searchString="+ingredients_A+"&search="+str+"'/>'>"+ls.ingredients_A+"</a></p>"
//                          "<div align='center'><p><a href='<c:url value='/RetrievePageProducts?searchString="+ingredients_A+"&search="+str+"'/>'>"+ls.ingredients_A+"</a></p>"
//                       "<div align='center'><p><a href='<c:url value='/searchProducts?search="+ingredients_A+"'/>'>"+ls.ingredients_A+"</a></p>"
//                       "<div align='center'><p><a href='#' onclick='getProductDetail("+ingredients_A+")'>"+ls.ingredients_A+"</a></p>"
                         
//                          +"<button name='searchButton' style='border-radius: 5px;'onclick='searchProduct()'>"+查詢+"</button>"

//                          "<p><a href='<c:url value='/searchSubmit.controller?rec_id="+ls.rec_id+"'/>'>"+ls.name+"</a></p>"
//                          +"<p>"+ls.ingredients_A+"</p>"
//                          +"<p>"+ls.ingredients_B+"</p>"
//                          +"<p>"+ls.cate+"</p>"
//                          +"<p>"+ls.method+"</p></div><hr>";         




//                      	`<div class="row">
//                      	`<div class="col-md-6 col-lg-3 ftco-animate"> 
//         				`<div class="product">				
//         						<a href="<c:url value='/recipeDetail.controller?rec_id=\${ls.rec_id}'/>" class="img-prod">
//         						<img class="img-fluid" src="<c:url value='/getALLImage.controller?rec_id=\${ls.rec_id}'/>" alt="">
//         						</a>	
        						
//         					<div class="text py-3 pb-4 px-3 text-center">                                     
//         							<a href="<c:url value='/searchSubmit.controller?rec_id=\${ls.rec_id}'/>">\${ls.rec_id}</a>  
//         							<h3 style="border:3px solid red;">\${ls.rec_id}</h3>  				
//     	    					<div style="float: right;">

//     	    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
//     	    								<span><i class="ion-ios-heart"></i></span>
//     	    							</a>
//         						</div>
//         					</div>  
//         				</div>`;
//         			</div>`;
//         			</div>`;




		           ` <div class="blog-entry align-self-stretch d-md-flex">  
		              <a href="<c:url value='/recipeDetail.controller?rec_id=\${ls.rec_id}'/>" class="block-20" 
			              style="background-image: url('<c:url value='/getALLImage.controller?rec_id=\${ls.rec_id}'/>');">
		              </a>
		              <div class="text d-block pl-md-4">

		                <h3 class="heading"><a href="<c:url value='/recipeDetail.controller?rec_id=\${ls.rec_id}'/>">Even the all-powerful Pointing has no control about the blind texts</a></h3>
		                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                <p><a href="<c:url value='/recipeDetail.controller?rec_id=\${ls.rec_id}'/>" class="btn btn-primary py-2 px-3">Read more</a></p>
		              </div>
		            </div>
		          </div>`;

 


                         
                		console.log('ls.ingredients_A: '+ls.ingredients_A);
//                 		searchProduct(ls.ingredients_A);
                    	}
                  		//在html頁面id=test的標籤顯示html内容
                  		console.log(html);
                        $("#searchSuccess").html(html); 
						},
				error:function(){
					}	
				});
			});
			});

</script>
<!-- <script type="text/javascript"> 
function touch(rec_id){
	$("#heart").click(function(){
		$.ajax({
			type:"POST",
			url:"./bookmark",
			data:{"rec_id":rec_id
				},
			success.function(data){
				alert('succccccccccces');
					$("#heart").html(data)
				},
				error.function(){
				alert('errrrrrrrrrrrrror')
					}
			});
		});
}

 </script> -->
</body>
</html>