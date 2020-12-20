<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-md-12">
	<div class="carousel-testimony owl-carousel">
		<c:forEach begin="0" end="2" step="1" var="i">
			<div class="item">
				<div class="testimony-wrap p-4 pb-5">
					<div class="user-img mb-5" 
						style="background-image: url(<c:url value='/getBlogImage?blog_id=${frontPageContent[i].blog_id}'/>)">
						<a href="<c:url value='./SinglePage?blog_id=${frontPageContent[i].blog_id}'/>" data-toggle="tooltip" title="查看"><span 
							class="quote d-flex align-items-center justify-content-center">
							<i class="icon-quote-left"></i>
						</span></a>
					</div>
					<div class="text text-center">
						<p class="mb-5 pl-4 line">${frontPageContent[i].title}</p>
						<p class="name">${frontPageContent[i].name}</p>
						<span class="position"></span>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
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
<script src="js/main.js"></script>