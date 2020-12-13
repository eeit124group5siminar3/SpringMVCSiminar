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

.wrap {
	width: 900px;
	margin: auto;
	display: flex;
	align-items: center;
	padding-top: 10px;
}

 .wrap img { 
 	width: 100%; 
 	height: 100%; 
 	vertical-align: middle; 
 	margin-right: 20px; 
 } 

.txt {
	width: 50%;
	vertical-align: middle;
	padding-left: 20px;
}

.heart:hover {
	color: red;
}
</style>

</head>
<body class="goto-here">
	<div id="notLogin">
		<jsp:include page="../header.jsp" />
	<div id="addSuccess">

		<!-------------------------內容區--------------------------------->

		<c:if test="${login_ok==null}">
			<div align="center">
				<form action="frontPage.controller" method="get" runat="server">
					<fieldset>
						<legend>搜尋結果</legend>
						<c:forEach var='BeanToken' items="${List}">
							<div class="wrap" style="text-align: center;">
								<a style="border:3px solid red;"
									href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">
									<img height="100" width="100%"
									src="<c:url value='/getALLImage.controller?rec_id=${BeanToken.rec_id}'/>" />
								</a>

								<div class="txt">
									<div align="center">
										<h2 align="center"
											style="width: 300px; float: left; display: inline">
											<a
												href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a>
										</h2>

										<input type="hidden" id="send" value="${BeanToken.rec_id}" />
										<h2 style="width: 50px; float: left; display: inline">
											<a href="javascript:void(0);"
												class="heart d-flex justify-content-center align-items-center "
												onclick="fun(${login_ok})"><span><i
													class="ion-ios-heart" id="heart"></i></span> </a>
										</h2>
									</div>
									<div>
										<p>累積人氣: ${BeanToken.views}</p>
									</div>
									<hr>
									<div>
											食材: <a href="<c:url value='/connectMall?mall_searchString=${BeanToken.ingredients_A}&mall_pageNo=1'/>" >
												${BeanToken.ingredients_A}
											</a>										
										<p>食材: ${BeanToken.ingredients_B}</p>
										<p>介紹 : ${BeanToken.desc}</p>
										<p>料理方法 : ${BeanToken.method}</p>
									</div>
								</div>
							</div>
							<hr>
						</c:forEach>
						<div style="text-align: center;">
							<label> <input type="submit" value="回首頁" />
							</label>
						</div>
					</fieldset>
				</form>
			</div>
		</c:if>

		<c:if test="${login_ok!=null}">
			<c:if test="${flag==true}">
				<div align="center">
					<form action="frontPage.controller" method="get" runat="server">
						<fieldset>
							<legend>搜尋結果</legend>


							<c:forEach var='BeanToken' items="${list}">
								<div class="wrap" style="text-align: center;">
									<a
										href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">
										<img height="100" width="80"
										src="<c:url value='/getALLImage.controller?rec_id=${BeanToken.rec_id}'/>" />
									</a>

									<div class="txt">
										<div align="center">
											<h2 align="center"
												style="width: 300px; float: left; display: inline">
												<a
													href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a>
											</h2>

											<input type="hidden" id="send" value="${BeanToken.rec_id}" />
											<h2 style="width: 50px; float: left; display: inline">
												<a href="javascript:void(0);"
													class="heart d-flex justify-content-center align-items-center "
													onclick="fun('${login_ok}')"> <span><i
														class="ion-ios-heart" id="heart" style="color: red;"></i></span></a>
											</h2>
										</div>
										<div>
										<p>累積人氣: ${BeanToken.views}</p>
										</div>
										<hr>
										<div>
											食材: <a href="<c:url value='/connectMall?mall_searchString=${BeanToken.ingredients_A}&mall_pageNo=1'/>" >
												${BeanToken.ingredients_A}
											</a>	
											<h5>食材  :  </h5>
											<p>${BeanToken.ingredients_B}</p>
											<h5>介紹  :  </h5>
											<p>${BeanToken.desc}</p>
											<h5>料理方法 :  </h5>
											<p>${BeanToken.method}</p>
										</div>
									</div>
								</div>
								<hr>
							</c:forEach>

							<div style="text-align: center;">
								<label> <input type="submit" value="回首頁" />
								</label>
							</div>
						</fieldset>
					</form>
				</div>
			</c:if>

			<c:if test="${flag!=true}">
				<div align="center">
					<form action="frontPage.controller" method="get" runat="server">
						<fieldset>
							<legend>搜尋結果</legend>


							<c:forEach var='BeanToken' items="${list}">
								<div class="wrap" style="text-align: center;">
									<a
										href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">
										<img height="100" width="80"
										src="<c:url value='/getALLImage.controller?rec_id=${BeanToken.rec_id}'/>" />
									</a>

									<div class="txt">
										<div align="center">
											<h2 align="center"
												style="width: 300px; float: left; display: inline">
												<a
													href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a>
											</h2>


											<input type="hidden" id="send" value="${BeanToken.rec_id}" />
											<h2 style="width: 50px; float: left; display: inline">
												<a href="javascript:void(0);"
													class="heart d-flex justify-content-center align-items-center "
													onclick="fun('${login_ok}')"> <span><i
														class="ion-ios-heart" id="heart"></i></span></a>
											</h2>
										</div>
										<div>
										<p>累積人氣: ${BeanToken.views}</p>
										</div>
										<hr>
										<div>
											食材: <a href="<c:url value='/connectMall?mall_searchString=${BeanToken.ingredients_A}&mall_pageNo=1'/>" >
												${BeanToken.ingredients_A}
											</a>	
											<h5>食材  :  </h5>
											<p>${BeanToken.ingredients_B}</p>
											<h5>介紹  :  </h5>
											<p>${BeanToken.desc}</p>
											<h5>料理方法 :  </h5>
											<p>${BeanToken.method}</p>
										</div>
									</div>
								</div>
								<hr>
							</c:forEach>

							<div style="text-align: center;">
								<label> <input type="submit" value="回首頁" />
								</label>
							</div>
						</fieldset>
					</form>
				</div>
			</c:if>


		</c:if>

	<!------------------------------------------------------------------>
	</div>
		<jsp:include page="../footer.jsp" />
	</div>


	<script type="text/javascript">

	function fun(login_ok){
		console.log('login_okval: '+login_ok);
		var rec_id=$("#send").val();
		console.log('rec_id: '+rec_id);
		if(login_ok!=null){
			$.ajax({
			type:"GET",
			url:"./bookmark",
			data:{"rec_id":rec_id},
			success:function(response){
				alert(response);
				$("#heart").css("color","red");
				}
			});
		}else{
			$.ajax({
				type:"GET",
				url:"./login.controller",
				success:function(response){				
				$("#notLogin").html(response);
				}
			});
		}
	}
	</script>
</body>
</html>