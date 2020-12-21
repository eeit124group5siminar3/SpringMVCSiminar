<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<c:forEach var="bean" items="${cateList}">
		<div>
			<div class="blog-entry align-self-stretch d-md-flex">
				<c:if test="${bean.fileName!=null}">
					<div id="div1">

						<a href="./SinglePage?blog_id=${bean.blog_id}"
							class="block-20" id="img1"
							style="background-image: url(<c:url value='/getBlogImage?blog_id=${bean.blog_id}'/>);">
						</a>
					</div>
				</c:if>
				<c:if test="${bean.fileName==null}">
					<div id="div1">
						<a href="./SinglePage?blog_id=${bean.blog_id}"
							class="block-20" id="img1"
							style="background-image: url('images/沒有.jpg');"> </a>
					</div>
				</c:if>
				<div class="text d-block pl-md-4">
					<div class="meta mb-3">
						<div>${bean.date}</div>
						<div>
							<a href="#">${bean.name}</a>
						</div>
						<div>

						</div>
						<div>瀏覽次數 : ${bean.views}</div>
					</div>
					<h3 class="heading">
						<a href="./SinglePage?blog_id=${bean.blog_id}">${searchAll[i].title}</a>
					</h3>
					<p>
						<a href="./SinglePage?blog_id=${bean.blog_id}"
							class="btn btn-primary py-2 px-3">閱讀</a>
					</p>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>