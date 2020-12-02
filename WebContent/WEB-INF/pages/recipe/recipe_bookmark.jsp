<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>我的食譜</title>
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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />


<style>
* {
	box-sizing: border-box;
}

.heart:hover {
	color: gray;
}
.heart




:
</style>


</head>
<body>
<body class="goto-here">
	<div id="deleteSuccess">


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
				</ul>

				<form class="form-inline my-2 my-lg-0" id="search"
					action="javascript:void(0);" method="post">
					<input class="form-control mr-sm-2" type="text" id="searchInput"
						name="searchInput" placeholder="search delicious"
						aria-label="Search" /> <input
						class="btn btn-outline-success my-2 my-sm-0" 　 onblur="ch()"
						id="send" type="submit" name="action" value="Search" />
				</form>
			</div>
		</nav>

		<p style="font-size: 60px; text-align: center;">我的食譜</p>
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




						<c:forEach var='BeanToken' items="${allRecipe}">
							<div class="col-md-6 col-lg-3 ftco-animate">
								<div class="product" class="shadow-lg p-3 mb-5 bg-white rounded">
									<a
										href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>"
										class="img-prod"><img class="img-fluid"
										src="<c:url value='/getALLImage.controller?rec_id=${BeanToken.rec_id}'/>"
										alt=""> </a>

									<div class="text py-3 pb-4 px-3 text-center">
										<a
											href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a>






										<div style="float: right;" class="deleteRecipe" id="heart">
											<a href="" data-toggle="tooltip" title="確定要移除嗎?"> <span
												class="heart d-flex justify-content-center align-items-center ">
													<span><i class="ion-ios-heart" style="color: red"
														id="heart" onclick="fun(${BeanToken.rec_id})"></i></span>
											</span></a>
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



<!-- 		    <table id="myDataTalbe" class="display" cellspacing="0" width="100%"> -->
<!-- 		       <thead> -->
<!-- 		       <tr> -->
<!-- 		           <th>食譜</th> -->
<!-- 		           <th>作者</th> -->
<!-- 		           <th>人氣</th> -->
<!-- 		           <th>上傳日期</th> -->
<!-- 		           <th>刪除</th> -->
<!-- 		       </tr> -->
<!-- 		       </thead> -->
<%-- 		    <c:forEach var='BeanToken'  items="${searchLove}"> --%>
<!-- 		       <tbody> -->
<!-- 		       <tr> -->
<%-- 		           <td><a href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.id}</a></td> --%>
<%-- 		           <td>${BeanToken.member_no}</td> --%>
<!-- 		           <td>1000</td> -->
<%-- 		           <td>${BeanToken.date}</td> --%>
<%-- 		           <td><input type="submit" name="delete" value="刪除" onclick="fun(${BeanToken.id})"/></td> --%>
<!-- 		       </tr> -->
<!-- 		       </tbody> -->
<%-- 		</c:forEach> --%>
<!-- 		   </table> -->
		<!------------------------------------------------------------------>
		<jsp:include page="../footer.jsp" />
	</div>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
function fun(rec_id){
	var deleteSuccess=$("#deleteSuccess");
	console.log('rec_id: '+rec_id);
	var mymessage=confirm("確定要刪除？");
	if(mymessage==true)
	{
	$.ajax({
		type:"GET",
		url:"./removeMyRecipe",
		data:{
			"rec_id":rec_id
			},
		success:function(response){
			console.log('response:'+response);
			}
		});
	}
}
</script>
	<script type="text/javascript">
	$(function(){
		$('[data-toggle="tooltip"]').tooltip();
	});
//         $(function () {

//             $("#myDataTalbe").DataTable({
//                 searching: false,
//                 columnDefs: [{
//                     targets: [3],
//                     orderable: false,
//                 }]
//             });
//         });
    </script>
</body>
</html>