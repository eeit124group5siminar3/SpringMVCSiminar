<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${partSearch.title}</title>
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
					<h2 class="mb-3">${partSearch.title}</h2>
					<p>${partSearch.content}</p>

<!-- 					<p> -->
<!-- 						<img src="images/image_1.jpg" alt="" class="img-fluid"> -->
<!-- 					</p> -->
					<!--             <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p> -->
					<!--             <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2> -->
					<!--             <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p> -->
					<!--             <p> -->
					<!--               <img src="images/image_2.jpg" alt="" class="img-fluid"> -->
					<!--             </p> -->
					<!--             <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p> -->
					<!--             <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p> -->
					<!--             <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p> -->
					<!--             <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p> -->

					<div class="tag-widget post-tag-container mb-5 mt-5">
						<div class="tagcloud">
							<a href="#" class="tag-cloud-link">Life</a> <a href="#"
								class="tag-cloud-link">Sport</a> <a href="#"
								class="tag-cloud-link">Tech</a> <a href="#"
								class="tag-cloud-link">Travel</a>
						</div>
					</div>

					<div class="about-author d-flex p-4 bg-light">
						<div class="bio align-self-md-center mr-4">
<!-- 							<img src="images/person_1.jpg" alt="Image placeholder" -->
<!-- 								class="img-fluid mb-4"> -->
						</div>
						<div class="desc align-self-md-center">
							<h3>${detailBean.name}</h3>
							<p>${detailBean.introduction}</p>

						</div>
					</div>


					<div class="pt-5 mt-5">
						<div id="MsgChange">

							<h3 class="mb-5">${partSearch.counts}&nbsp;&nbsp;則留言</h3>
							<c:forEach var='BeanToken' items="${searchMsg}">
								<ul class="comment-list">
									<li class="comment">
										<div class="vcard bio">
											<img src="images/新ちゃん.jpg" alt="Image placeholder">
										</div>
										<div class="comment-body">

											<c:if test="${BeanToken.mem_no!=null}">
												<h3 class="alert alert-success">${BeanToken.name}</h3>
											</c:if>
											<c:if test="${BeanToken.mem_no==null}">
												<h3 class="alert alert-dark">${BeanToken.name}</h3>
											</c:if>

											<div class="meta">${BeanToken.date}</div>
											<p>${BeanToken.content}</p>
											<p>
												<a href="#" class="reply">Reply</a>
											</p>
										</div>
									</li>
								</ul>
							</c:forEach>
						</div>

						<!-- END comment-list -->

						<div class="comment-form-wrap pt-5">
							<h3 class="mb-5">發問區</h3>
							<form action="javascript:void(0);" method="post"
								class="p-5 bg-light">
								<div class="form-group">


									<%-- 									<form:label path="blog_id" type="hidden"></form:label> --%>
									<%-- 									<form:input path="blog_id" type="hidden" --%>
									<%--  										value="${partSearch.blog_id}" /> --%>
									<label for="MsgTextarea" style="font-size: 30px;">留言 :
										<span style="font-size: 15px;">最多500字</span>
									</label>
									<div id="cleanTextarea">
										<textarea class="form-control" id="MsgTextarea" rows="10"
											cols="40" name="content"></textarea>
									</div>
								</div>

								<div align="right" class="form-group">

									<c:if test="${login_ok==null}">
										<input type="submit" value="訪客留言"
											class="btn py-3 px-4 btn-primary"
											onclick="funSend(${partSearch.blog_id})" />
									
										<input type="submit" value="登入" onclick="javascript:location.href='<c:url value='login.controller'/>'"
											class="btn py-3 px-4 btn-primary" /> 
									</c:if>

									<c:if test="${login_ok!=null}">
										<input type="submit" value="我要留言"
											class="btn py-3 px-4 btn-primary"
											onclick="funSend(${partSearch.blog_id})" />
									</c:if>
								</div>
							</form>
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
						<div class="block-21 mb-4 d-flex">

							<c:if test="${popular1.fileName!=null}">
								<a class="blog-img mr-4"
									style="background-image: url(<c:url value='/getBlogImage?blog_id=${popular1.blog_id}'/>);"></a>
							</c:if>
							<c:if test="${popular1.fileName==null}">
								<a href="./SinglePage?blog_id=${popular1.blog_id}"
									class="blog-img mr-4"
									style="background-image: url('images/沒有.jpg');"> </a>
							</c:if>



							<div class="text">
								<h3 class="heading-1">
									<a href="./SinglePage?blog_id=${popular1.blog_id}">${popular1.title}</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> ${popular1.date}</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> ${popular1.name}</a>
									</div>
									<div id="chatChange${popular1.blog_id}">
									<div>
										<a href="#"><span class="icon-chat"></span> ${chat[0]}</a>
									</div>
									</div>
								</div>
							</div>
						</div>
						<div class="block-21 mb-4 d-flex">
							<c:if test="${popular2.fileName!=null}">
										<a class="blog-img mr-4"
										style="background-image: url(<c:url value='/getBlogImage?blog_id=${popular2.blog_id}'/>);"></a>
									</c:if>
									<c:if test="${popular2.fileName==null}">
										<a href="./SinglePage?blog_id=${popular2.blog_id}"             
											class="blog-img mr-4"
											style="background-image: url('images/沒有.jpg');">
										</a>
									</c:if>
							<div class="text">
								<h3 class="heading-1">
									<a href="./SinglePage?blog_id=${popular2.blog_id}">${popular2.title}</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> ${popular2.date}</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> ${popular2.name}</a>
									</div>
									<div id="chatChange${popular2.blog_id}">
									<div>
										<a href="#"><span class="icon-chat"></span> ${chat[1]}</a>
									</div>
									</div>
								</div>
							</div>
						</div>
						<div class="block-21 mb-4 d-flex">
							<c:if test="${popular3.fileName!=null}">
										<a class="blog-img mr-4"
										style="background-image: url(<c:url value='/getBlogImage?blog_id=${popular3.blog_id}'/>);"></a>
									</c:if>
									<c:if test="${popular3.fileName==null}">
										<a href="./SinglePage?blog_id=${popular3.blog_id}"             
											class="blog-img mr-4"
											style="background-image: url('images/沒有.jpg');">
										</a>
									</c:if>
							<div class="text">
								<h3 class="heading-1">
									<a href="./SinglePage?blog_id=${popular3.blog_id}">${popular3.title}</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> ${popular3.date}</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> ${popular3.name}</a>
									</div>
									<div id="chatChange${popular3.blog_id}">
									<div>
										<a href="#"><span class="icon-chat"></span> ${chat[2]}</a>
									</div>
									</div>
								</div>
							</div>
						</div>

					</div>

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
						<h3 class="heading">Paragraph</h3>
						<p>${detailBean.introduction}</p>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- .section -->

	<jsp:include page="../footer.jsp" />




	<!-- loader -->
	<%--   <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div> --%>

	<script type="text/javascript">
		function funSend(blog_id) {
			var content=$("#MsgTextarea").val();
			console.log('content: '+content);
			console.log('blog_id: '+blog_id);
			if(content==null || content==""){
				alert('請輸入!');
			}else{
			$.ajax({
				type : "POST",
				url : "./msgContent",
				dataType:"html",
				data : {
						"content":content,
						"blog_id":blog_id
					},
				success : function(data) {
					alert('送出成功!');
					$("#MsgChange").html(data);
					$("#cleanTextarea").html(`<textarea class="form-control" id="MsgTextarea" rows="10"
			                   cols="40" name="content"></textarea>`);
					},
				error : function(data) {
					alert('送出失敗');
					}
			})
		}
	}
		</script>
 
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