<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>食譜討論區</title>
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
</head>
<body class="goto-here">
	<jsp:include page="../header.jsp" />

	<!-- END nav -->

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Blog</span>
					</p>
					<h1 class="mb-0 bread">Blog</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					<div id="searchSuccess">
						<div class="row">

							<c:forEach begin="0" end="${searchAll.size()}" step="1" var="i">
								<div class="col-md-12 d-flex ftco-animate">
									<div class="blog-entry align-self-stretch d-md-flex">
									<c:if test="${searchAll[i].fileName!=null}">
										<a href="./SinglePage?blog_id=${searchAll[i].blog_id}"             
											class="block-20"
											style="background-image: url(<c:url value='/getBlogImage?blog_id=${searchAll[i].blog_id}'/>);">

										</a>
									</c:if>
									<c:if test="${searchAll[i].fileName==null}">
										<a href="./SinglePage?blog_id=${searchAll[i].blog_id}"             
											class="block-20"
											style="background-image: url('images/沒有.jpg');">

										</a>
									</c:if>
										<div class="text d-block pl-md-4">
											<div class="meta mb-3">
												<div>${searchAll[i].date}</div>
												<div>
													<a href="#">${searchAll[i].name}</a>
												</div>
												<div>
													<a href="#" class="meta-chat"><span class="icon-chat"></span>
														${counts[i]}</a>
												</div>
												<div>瀏覽次數 : ${searchAll[i].views}</div>
											</div>
											<h3 class="heading">
												<a href="./SinglePage?blog_id=${searchAll[i].blog_id}">${searchAll[i].title}</a>
											</h3>
											<p>${BeanToken.content}</p>
											<p>
												<a href="./SinglePage?blog_id=${searchAll[i].blog_id}"
													class="btn btn-primary py-2 px-3">Read more</a>
											</p>
										</div>
									</div>
								</div>

							</c:forEach>

						</div>
					</div>
				</div>
				<!-- .col-md-8 -->
				<div class="col-lg-4 sidebar ftco-animate">
					<div class="sidebar-box">
						<form action="javascript:void(0);" method="post"
							class="search-form">
							<div class="form-group">
								<span class="icon ion-ios-search"></span> <input type="text"
									class="form-control" id="searchInput" placeholder="Search...">
								<!-- 									<span> <button type="submit" class="btn btn-primary py-2 px-3" >Search</button></span> -->
							</div>
						</form>
					</div>
					<div class="sidebar-box ftco-animate">
						<h3 class="heading">Categories</h3>
						<ul class="categories">
							<li><a href="#">Vegetables <span>(12)</span></a></li>
							<li><a href="#">Fruits <span>(22)</span></a></li>
							<li><a href="#">Juice <span>(37)</span></a></li>
							<li><a href="#">Dries <span>(42)</span></a></li>
						</ul>
					</div>

					<div class="sidebar-box ftco-animate">
						<h3 class="heading">Recent Blog</h3>

						<c:forEach begin="0" end="2" step="1" var="i">

							<div class="block-21 mb-4 d-flex">
								<c:if test="${searchAll[i].fileName!=null}">
										<a href="./SinglePage?blog_id=${searchAll[i].blog_id}"             
											class="blog-img mr-4"
											style="background-image: url(<c:url value='/getBlogImage?blog_id=${searchAll[i].blog_id}'/>);">

										</a>
									</c:if>
									<c:if test="${searchAll[i].fileName==null}">
										<a href="./SinglePage?blog_id=${searchAll[i].blog_id}"             
											class="blog-img mr-4"
											style="background-image: url('images/沒有.jpg');">

										</a>
									</c:if>
								<div class="text">
									<h3 class="heading-1">
										<a href="./SinglePage?blog_id=${searchAll[i].blog_id}">${searchAll[i].title}</a>
									</h3>
									<div class="meta">
										<div>
											<a href="#"><span class="icon-calendar"></span>
												${searchAll[i].date}</a>
										</div>
										<div>
											<a href="#"><span class="icon-person"></span>
												${searchAll[i].name}</a>
										</div>
										<div id="chatChange${searchAll[i].blog_id}">
											<div>
												<a href="#"><span class="icon-chat"></span> ${counts[i]}</a>
											</div>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
						<div class="sidebar-box ftco-animate">
							<h3 class="heading">Tag Cloud</h3>
							<div class="tagcloud">
								<a href="#" class="tag-cloud-link">fruits</a> <a href="#"
									class="tag-cloud-link">tomatoe</a> <a href="#"
									class="tag-cloud-link">mango</a> <a href="#"
									class="tag-cloud-link">apple</a> <a href="#"
									class="tag-cloud-link">carrots</a> <a href="#"
									class="tag-cloud-link">orange</a> <a href="#"
									class="tag-cloud-link">pepper</a> <a href="#"
									class="tag-cloud-link">eggplant</a>
							</div>
						</div>

						<div class="sidebar-box ftco-animate">
							<!--               <h3 class="heading">Paragraph</h3> -->
							<!--               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p> -->
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- .section -->

	<jsp:include page="../footer.jsp" />

	<script type="text/javascript">
		//     $(function(){
		//     	var event = arguments.callee.caller.arguments[0] || window.event;// 消除浏览器差异
		$('#searchInput').keydown(function(event) {
			if (event.keyCode == 13) {
				var searchInput = $("#searchInput").val();
				$.ajax({
					type : "post",
					url : "./searchPartOfBlog",
					dataType : "html",
					data : {
						"searchInput" : searchInput
					},
					success : function(data) {
						$("#searchSuccess").html(data);
					}
				})
			}
		})
	</script>
</body>
</html>