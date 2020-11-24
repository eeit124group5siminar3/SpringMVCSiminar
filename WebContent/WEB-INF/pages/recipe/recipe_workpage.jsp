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

.wrap{
	width: 600px;
	margin: auto;
	display:flex;
	align-items:center;
	padding-top: 10px;
}

.wrap img{
	width: 250px;
	height:200px;
	vertical-align: middle;
	margin:20px;
	
}

.txt{
	width: 50%;
	vertical-align: middle;
	padding-left: 20px;
}
	 
	 
</style>


</head>
<body>
<body class="goto-here">
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

		<jsp:include page="../header.jsp" />

	<!-------------------------內容區--------------------------------->


<%--     <form action="<c:url value='/function.controller'/>" method="post"> --%>
<!--     		<c:set var="funcName" value="ORD" scope="session" />   -->

           


<!--             <div class="list-group" style="width: 200px;"> -->
<%--                 <a href="<c:url value='uploadPage.controller'/>" class="list-group-item list-group-item-action list-group-item-warning">上傳食譜</a> --%>
<%--                 <a href="<c:url value='updatePage.controller'/>" class="list-group-item list-group-item-action list-group-item-info">修改食譜</a> --%>
<%--                 <a href="<c:url value='searchPage.controller'/>" class="list-group-item list-group-item-action list-group-item-light">搜尋料理</a> --%>
<!--               </div> -->

<!--  </form> -->


<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand">Recipe</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">User Blog<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value='uploadPage.controller'/>">Upload</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value='updatePage.controller'/>">Update</a>
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
      <input class="btn btn-outline-success my-2 my-sm-0" id="send" type="submit" name="action" value="Search"/>
    </form>
  </div>
</nav>

<p style="font-size: 60px;text-align: center;">美食推薦</p>

<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10 mb-5 text-center">
					<ul class="product-category" id="product-category"></ul>
						<input type="hidden" name="searchString"
							value=${searchString}>
				</div>
			</div>
			<div class="row  ftco-animate" id="mall_products"></div>
		</div>
		<div id="mall_pages"></div>

<div id="searchSuccess">

<c:forEach var='BeanToken'  items="${searchAll}">
		<div class="wrap" style="text-align: center;">
			<a href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">
					<img height="100" width="80"   
					src="<c:url value='/getALLImage.controller?rec_id=${BeanToken.rec_id}'/>" />
			</a>
					
			<div class="txt">
					<h2>
						<a href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a>
					</h2>
					<hr>
					<p>食材: ${BeanToken.ingredients_A} </p>	
					<p>食材: ${BeanToken.ingredients_B} </p>
					<p>介紹 : ${BeanToken.desc}</p>				
					<p>料理方法 : ${BeanToken.method}</p>
				
		</div>
	</div>
</c:forEach>
	
</div>
	
	
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
					alert("successsssssssss");
       				console.log(data.length);
//            	     $.each(data,function(i,list){
//            	      alert(list[0]);
//            	     });
						
       			    var html = "";
       			    var str=" ";
                    for(var i=0;i<data.length;i++){    //遍歷data數組
                         var ls = data[i];   
                         var ingredients_A=ls.ingredients_A;

                          	searchProduct(ingredients_A);
                         html +=
//                          "<div align='center'><p><a href='<c:url value='/RetrieveSearch/?searchString="+ingredients_A+"&search="+str+"'/>'>"+ls.ingredients_A+"</a></p>"
//                          "<div align='center'><p><a href='<c:url value='/RetrievePageProducts?searchString="+ingredients_A+"&search="+str+"'/>'>"+ls.ingredients_A+"</a></p>"
                      "<div align='center'><p><a href='<c:url value='/searchProducts?search="+ingredients_A+"'/>'>"+ls.ingredients_A+"</a></p>"
//                       "<div align='center'><p><a href='#' onclick='getProductDetail("+ingredients_A+")'>"+ls.ingredients_A+"</a></p>"
                         
                         +"<p><a href='<c:url value='/searchSubmit.controller?rec_id="+ls.rec_id+"'/>'>"+ls.name+"</a></p>"
                         +"<p>"+ls.ingredients_A+"</p>"
//                          +"<button name='searchButton' style='border-radius: 5px;'onclick='searchProduct()'>"+查詢+"</button>"
                         +"<p>"+ls.ingredients_B+"</p>"
                         +"<p>"+ls.cate+"</p>"
                         +"<p>"+ls.method+"</p></div><hr>";         
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

// 	--------------------連結商城---------------------------------


	function productList(pageNo) {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/RetrievePageProducts' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var aProductBean = JSON.parse(xhr.responseText);
				var content = "";
				for (var i = 0; i < aProductBean.length; i++) {
					content += "<div class='col-md-6 col-lg-3'>"
							+ "<div class='product'><a href='#mall_products' class='img-prod'><img class='img-fluid' src=<c:url value='retrieveImageServlet?id="
							+ aProductBean[i].productId
							+ "&type=PRODUCT' /> alt='Colorlib Template'>";
					if (aProductBean[i].discount != 1) {
						content += "<span class='status'>"
								+ (1 - aProductBean[i].discount) * 100
								+ "%</span>";
					}
					content += "<div class='overlay'></div> </a><div class='text py-3 pb-4 px-3 text-center'><h3><a href='#'>"
							+ aProductBean[i].product
							+ "</a></h3><div class='d-flex'><div class='pricing'>";
					if (aProductBean[i].discount != 1) {
						content += "<p class='price'><span class='mr-2 price-dc'>"
								+ aProductBean[i].price
								+ "元</span><span class='price-sale'>"
								+ aProductBean[i].price
								* aProductBean[i].discount + "元</span></p>";
					} else {
						content += "<span>" + aProductBean[i].price
								+ "元</span>";
					}
					content += "</div></div><div class='bottom-area d-flex px-3'><div class='m-auto d-flex'>"
							+ "<a href='#mall_products' class='add-to-cart d-flex justify-content-center align-items-center text-center'><span><i class='ion-ios-menu'></i></span></a>"
							+ "<a href='#mall_products' class='buy-now d-flex justify-content-center align-items-center mx-1'><span><i class='ion-ios-cart'></i></span></a>"
							+ "<a href='#mall_products' class='heart d-flex justify-content-center align-items-center '><span><i class='ion-ios-heart'></i></span></a>"
							+ "</div></div></div></div></div>"
				}
				let divs = document.getElementById("mall_products");
				divs.innerHTML = content;
			}
		}
	}

	function page(pageNo) {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/RetrievePage/"+pageNo+"' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var content = "<div class='row mt-5'><div class='col text-center'><div class='block-27'><ul>";
				var totalPages = xhr.responseText;
				if (pageNo == 1) {
					content += "<li><span>&lt;&lt;</span></li><li><span>&lt;</span></li>";
				} else {
					content += "<li><a href='#product_top'onclick='page("
							+ 1
							+ ")'>&lt;&lt;</a></li><li><a href='#product_top'onclick='page("
							+ (pageNo - 1) + ")'>&lt;</a></li>";
				}
				if (totalPages <= 5) {
					for (var i = 1; i <= totalPages; i++) {
						if (pageNo == i) {
							content += "<li class='active'><span>" + i
									+ "</span></li>"
						} else {
							content += "<li><a href='#product_top' onclick='page("
									+ i + ")'>" + i + "</a></li>"
						}
					}
				} else if (pageNo > (totalPages - 3)) {
					for (var i = totalPages - 4; i <= totalPages; i++) {
						if (pageNo == i) {
							content += "<li class='active'><span>" + i
									+ "</span></li>"
						} else {
							content += "<li><a href='#product_top' onclick='page("
									+ i + ")'>" + i + "</a></li>"
						}
					}
				} else {
					for (var i = pageNo - 2; i <= pageNo + 2; i++) {
						if (pageNo == i) {
							content += "<li class='active'><span>" + i
									+ "</span></li>"
						} else {
							content += "<li><a href='#product_top' onclick='page("
									+ i + ")'>" + i + "</a></li>"
						}
					}
				}
				if (pageNo == totalPages) {
					content += "<li><span>&gt;</span></li><li><span>&gt;&gt;</span></li>";
				} else {
					content += "<li><a href='#product_top'onclick='page("
							+ (pageNo + 1)
							+ ")'>&gt;</a></li><li><a href='#product_top'onclick='page("
							+ totalPages + ")'>&gt;&gt;</a></li>";
				}
			}
			productList(pageNo);
			content += "</ul></div></div></div>";
			let divs = document.getElementById("mall_pages");
			divs.innerHTML = content;
			console.log(totalPages);
		}
	}

	function searchProduct() {
// 		var searchString = document.forms[0].elements[0].value;
		console.log(searchString);
		var xhr = new XMLHttpRequest();
		if (searchString == null || searchString == "") {
			var url = "<c:url value='/RetrieveSearch/' />"
			console.log(searchString);
		} else {
			var url = "<c:url value='/RetrieveSearch/" + searchString + "' />"
		}
		xhr.open("GET", url, false);
		xhr.send();
		page(1);
	}

	function productCategory(categoryId) {
		var categoryList = document.getElementById("product-category");
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/RetrieveCategory/"+categoryId+"' />",
				true);
		xhr.send();
		content = ""
		xhr.onreadystatechange = function() {
			page(1);
			if (xhr.readyState == 4 && xhr.status == 200) {
				var categoryBean = JSON.parse(xhr.responseText);
				categoryBean.unshift({
					id : 0,
					name : "全部"
				});
				for (var i = 0; i < categoryBean.length; i++) {
					if (i == categoryId) {
						content += "<li class='active'><span>" 
								+ categoryBean[i].name + "</span></li>";
					} else {
						content += "<li><a href='#product_top' onclick='productCategory("
								+ i
								+ ")'>"
								+ categoryBean[i].name
								+ "</a></li>";
					}
				}
			}
			categoryList.innerHTML = content;
		}
		
	}

	window.onload =function() {
		productCategory(0);
		page(1);
	}
	
	</script>

		
</body>
</html>