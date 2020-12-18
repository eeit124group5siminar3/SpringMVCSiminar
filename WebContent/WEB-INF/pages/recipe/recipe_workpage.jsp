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

.hero-wrap hero-bread {
	position: absolute;
}

.hero-wrap hero-bread:searchPosition {
	position: relative;
	left: 50%;
	top: 50%;
	margin-top: -50px;
	margin-left: -100px;
}
</style>


</head>
<body>
<body class="goto-here">


	<jsp:include page="../header.jsp" />


	<div class="hero-wrap hero-bread"
		style="background-image: url('images/食譜封面.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Recipe</span>
					</p>
					<h1 class="mb-0 bread">食譜</h1>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="row justify-content-center">
		<div>
			<form class="form-inline my-2 my-lg-0" id="search"
				action="javascript:void(0);" method="post">
				<input class="form-control mr-sm-2" type="text" id="searchInput"
					name="searchInput" placeholder="search delicious"
					aria-label="Search" /> <input
					class="btn btn-outline-success my-2 my-sm-0" onblur="ch()"
					id="send" type="submit" name="action" value="Search" />
			</form>
		</div>
	</div>


	<section class="ftco-section">
		<div class="container"></div>
		<div class="row justify-content-center">
			<div class="col-md-10 mb-5 text-center" align="center">
				<ul class="product-category">

					<li><a href='#' onclick='category("五穀根莖")'> 五穀根莖</a></li>
					<li><a href='#' onclick='category("奶類")'> 奶類</a></li>
					<li><a href='#' onclick='category("蛋豆魚肉類")'> 蛋豆魚肉類</a></li>
					<li><a href='#' onclick='category("蔬菜類")'> 蔬菜類</a></li>
					<li><a href='#' onclick='category("水果類")'> 水果類</a></li>
					<li><a href='#' onclick='category("油酯類")'> 油酯類</a></li>
				</ul>
			</div>
		</div>
		<div id="cateChange">
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
                    for(var i=0;i<data.length;i++){  
                    	var val=data[i]; 
                         var ingredients_A=val.ingredients_A; 
                         html +=
                        	 `<div class="col-sm-6 col-md-4 col-lg-4 mix filter-launch"> 
     						<div class="menu-item" style="width:80%;margin:50px">
     							<div class="menu__item-img" >
     							 <a href="<c:url value='/recipeDetail.controller?rec_id=\${val.rec_id}'/>" class="block-20" 
     				            	  style="background-image: url('<c:url value='/getImageA?rec_id=\${val.rec_id}'/>');">
     			              	</a>
     							</div>
     							<div class="menu__item-content">
     								<h4 class="menu__item-title">\${val.name}</h4>
     								<p class="menu__item-desc">\${val.desc}</p>
     								<span class="menu__item-price">累積人氣: \${val.views}</span>
     								<p><a href="<c:url value='/recipeDetail.controller?rec_id=\${val.rec_id}'/>" class="btn btn-primary py-2 px-3" >Read more</a>            
     			                    </p>
     							</div>
     						</div>
     					</div>`;
						
                		console.log('val.ingredients_A: '+val.ingredients_A);
                    	}
                        $("#searchSuccess").html(`<div class="row filtered-items-wrap" >`+html+`</div>`); 
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
					`<div class="col-sm-6 col-md-4 col-lg-4 mix filter-launch">
						<div class="menu-item" style="width:80%;margin:50px">
							<div class="menu__item-img" >
							 <a href="<c:url value='/recipeDetail.controller?rec_id=\${val.rec_id}'/>" class="block-20" 
				            	  style="background-image: url('<c:url value='/getImageA?rec_id=\${val.rec_id}'/>');">
			              	</a>
							</div>
							<div class="menu__item-content">
								<h4 class="menu__item-title">\${val.name}</h4>
								<p class="menu__item-desc">\${val.desc}</p>
								<span class="menu__item-price">累積人氣: \${val.views}</span>
								<p><a href="<c:url value='/recipeDetail.controller?rec_id=\${val.rec_id}'/>" class="btn btn-primary py-2 px-3" >Read more</a>            
			                    </p>
							</div>
						</div>
					</div>`;
				console.log('val.rec_id: '+val.rec_id);
					}
				$("#Success").html(`<div class="row filtered-items-wrap" >`+content+`</div>`);
		


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
	<script>
	function category(cate){
		console.log('cate: '+cate);
		$.ajax({
			type:"post",
			url:"./chooseCate",
			data:{"cate":cate},
			datetype:"html",
			success:function(response){
				$("#cateChange").html(response);
				}
			
			});
		}
	
</script>
</body>
</html>