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
	<c:forEach begin="0" end="${cateList.size()-1}" step="1" var="i">

		<%-- 	<c:forEach var="bean" items="${cateList}"> --%>
		<div>
			<div class="blog-entry align-self-stretch d-md-flex">
				<c:if test="${cateList[i].fileName!=null}">
					<div id="div1">

						<a href="./SinglePage?blog_id=${cateList[i].blog_id}"
							class="block-20" id="img1"
							style="background-image: url(<c:url value='/getBlogImage?blog_id=${cateList[i].blog_id}'/>);">
						</a>
					</div>
				</c:if>
				<c:if test="${cateList[i].fileName==null}">
					<div id="div1">
						<a href="./SinglePage?blog_id=${cateList[i].blog_id}"
							class="block-20" id="img1"
							style="background-image: url('images/沒有.jpg');"> </a>
					</div>
				</c:if>
				<div class="text d-block pl-md-4">
					<div class="meta mb-3">
						<div>${cateList[i].date}</div>
						<!-- 						<div> -->
						<%-- 							<a href="#">${bean.name}</a> --%>
						<!-- 						</div> -->
						<div>
							<a href="#" class="meta-chat"><span class="icon-chat"></span>
								${counts[i]} </a>
						</div>
						<div>瀏覽次數 : ${cateList[i].views}</div>
					</div>
					<h3 class="heading">
						<a href="./SinglePage?blog_id=${cateList[i].blog_id}">${cateList[i].title}</a>
					</h3>
					<p>
						<a href="./SinglePage?blog_id=${cateList[i].blog_id}"
							class="btn btn-primary py-2 px-3">閱讀</a>
					</p>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>