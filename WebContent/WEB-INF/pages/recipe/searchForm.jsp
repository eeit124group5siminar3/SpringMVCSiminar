<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜尋結果</title>
</head>
<body>
	<c:forEach begin="0" end="${partSearch.size()-1}" step="1" var="i">
			<div>
				<div class="blog-entry align-self-stretch d-md-flex">		
						<a href="./SinglePage?blog_id=${partSearch[i].blog_id}"
						class="block-20"
						style="background-image: url(<c:url value='/getBlogImage?blog_id=${partSearch[i].blog_id}'/>);">
						</a>
						
					<div class="text d-block pl-md-4">
						<div class="meta mb-3">
							<div>${partSearch[i].date}</div>
<!-- 							<div> -->
<%-- 								<a href="#">${partSearch[i].name}</a> --%>
<!-- 							</div> -->
							<div>
								<a href="#" class="meta-chat"><span class="icon-chat"></span>
									${counts[i]}
									</a>
							</div>
							<div>瀏覽次數 : ${partSearch[i].views}</div>
						</div>
						<h3 class="heading">
							<a href="./SinglePage?blog_id=${partSearch[i].blog_id}">${partSearch[i].title}</a>
						</h3>
<%-- 						<p>${partSearch[i].content}</p> --%>
						<p>
							<a href="./SinglePage?blog_id=${partSearch[i].blog_id}"
								class="btn btn-primary py-2 px-3">閱讀</a>
						</p>
					</div>
				</div>
			</div>

	</c:forEach>
</body>
</html>