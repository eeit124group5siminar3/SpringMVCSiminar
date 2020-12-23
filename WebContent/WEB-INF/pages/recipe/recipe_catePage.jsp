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
	<div class="row filtered-items-wrap">
		<c:forEach var="bean" items="${catePage}">
		<div class="col-sm-6 col-md-4 col-lg-4 mix filter-launch">
			<div class="menu-item" style="width: 80%; margin: 50px">
				<div class="menu__item-img">
					<a
						href="<c:url value='/recipeDetail.controller?rec_id=${bean.rec_id}'/>"
						class="block-20"
						style="background-image: url('<c:url value='/getImageE?rec_id=${bean.rec_id}'/>');">
					</a>
				</div>
				<div class="menu__item-content">
					<h4 class="menu__item-title">${bean.name}</h4>
					<p class="menu__item-desc">${bean.desc}</p>
					<span class="menu__item-price">累積人氣: ${bean.views}</span>
					<p>
						<a
							href="<c:url value='/recipeDetail.controller?rec_id=${bean.rec_id}'/>"
							class="btn btn-primary py-2 px-3">看食譜去</a>
					</p>
				</div>
			</div>
		</div>
			</c:forEach>
	</div>
</body>
</html>