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
<link rel="stylesheet" media="all"
	href="//assets-global.cpcdn.com/packs/css/v2/application-d0c81457.css"
	data-turbolinks-track="reload" />
<link rel="stylesheet" media="all"
	href="//assets-global.cpcdn.com/packs/css/application-3cb2ebbe.css"
	data-turbolinks-track="reload" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900|Lora:400,700,400italic,700italic&display=swap"
	rel="stylesheet" type="text/css">
<style>
#heart:hover {
	color: red;
}
</style>
</head>

<body>

	<div id="Login">
	<jsp:include page="../header.jsp" />
	<!-- Main -->
	<div data-intercept-banner-container-id="popup-overlay"
		data-intercept-banner-overlay-class="popup-overlay"
		data-intercept-banner-cookie="dismissed_tray_banner"
		data-intercept-banner-url="/tw/activity_logs?event=intercept_dialog.show&amp;keyword=open_in_app">

		<div class="main-container " id="main">
			<div class="page-overlay" data-behavior="cancel_search"
				data-target="#navigation_search"></div>
			<div id="popup-overlay"></div>
			<div id="main_contents" class="main-content  webview__contents">

				<div id="recipe_main" class="recipe-show">
					<div class="bg-pure-white" data-controller="dir">
						<div class="paywalled">
							<div id="about" class="bg-pure-white">
								<div>
									<div id="recipe_image" class="recipe-show__image image">
										<!--     <a rel="nofollow" data-action="modal#advance" tabindex="-1" href="/tw/recipe/images/2dcf98061afb1116"> -->

										<img title="${detailBean.name}" width="751" height="532"
											src="<c:url value='getImageA?rec_id=${list.rec_id}'/>" />
										<!-- </a> -->
									</div>

									<section class="intro-container document-section">
										<h1
											class="break-words mb-xs text-cookpad-18 xs:text-cookpad-24 md:text-cookpad-36 font-extrabold leading-tight clear-both field-group--no-container-xs"
											itemprop="name" data-target="dir.auto">${list.name}
											<c:if test="${login_ok!=null}">
												<c:choose>
													<c:when test="${flag!=true}">
														<span><i class="ion-ios-heart" id="heart" onclick="fun('${login_ok}','${list.rec_id}')"></i></span>
													</c:when>
													<c:otherwise>
														<span><i class="ion-ios-heart" id="heart" onclick="fun('${login_ok}','${list.rec_id}')" style="color: red;"></i></span>
													</c:otherwise>
												</c:choose>
											</c:if>
											
											<c:if test="${login_ok==null}">
												<span><i class="ion-ios-heart" id="heart" onclick="funLogin('${login_ok}','${list.rec_id}')"></i></span>
											</c:if>
										</h1>



<!------------------------ 			會員大頭貼 			------------------------------>
										<div class="media my-sm">
										<a href="/tw/%E4%BD%BF%E7%94%A8%E8%80%85/21449609"> <span
												class="mr-sm float-left w-8 xs:w-auto"><img
													title="${datailBean.name}" class=" rounded-full" width="48" height="48"
													srcset="<c:url value='getImageDetail?mem_no=${detailBean.mem_no}'/>"
													src="" /></span>
												<span> <span class="block truncate" itemprop="author" itemscope itemtype="http://schema.org/Person"> <span
														itemprop="name" class="text-cookpad-14 xs:text-cookpad-16">${datailBean.name}</span>
												</span> <span
													class="text-tertiary text-cookpad-12 xs:text-cookpad-14 mt-xs"
													id="location"><i class="icf icf--pin "></i>Taiwan</span>
											</span>
											</a>
										</div>


										<div
											class="recipe-show__story prose break-words text-cookpad-14 xs:text-cookpad-16"
											data-clamp="2" data-clamp-more="更多" data-dir-attribute="auto"
											data-target="dir.auto">
											<p class="mb-sm">${list.desc}
												<br> <a class="text-support-02"
													href="https://cookpad.com/tw/%E6%90%9C%E5%B0%8B/%23%E5%A5%BD%E6%96%99%E6%97%A5%E8%A8%98">#好料日記</a>
												<a class="text-support-02"
													href="https://cookpad.com/tw/%E6%90%9C%E5%B0%8B/%23%E5%91%B3%E5%A2%9E">#味增</a>
												<a class="text-support-02"
													href="https://cookpad.com/tw/%E6%90%9C%E5%B0%8B/%23%E8%98%BF%E8%94%94">#蘿蔔</a>
												<a class="text-support-02"
													href="https://cookpad.com/tw/%E6%90%9C%E5%B0%8B/%23%E7%99%BD%E8%98%BF%E8%94%94">#白蘿蔔</a>
												<a class="text-support-02"
													href="https://cookpad.com/tw/%E6%90%9C%E5%B0%8B/%23%E7%B4%85%E8%98%BF%E8%94%94">#紅蘿蔔</a>
												<a class="text-support-02"
													href="https://cookpad.com/tw/%E6%90%9C%E5%B0%8B/%23%E5%91%B3%E5%A2%9E%E7%87%89%E8%98%BF%E8%94%94">#味增燉蘿蔔</a>
												<a class="text-support-02"
													href="https://cookpad.com/tw/%E6%90%9C%E5%B0%8B/%23%E5%91%B3%E5%A2%9E%E7%87%89%E8%B1%AC%E8%82%89">#味增燉豬肉</a>
												<a class="text-support-02"
													href="https://cookpad.com/tw/%E6%90%9C%E5%B0%8B/%23%E5%91%B3%E5%A2%9E%E8%B1%9A%E6%B1%81%E7%87%89%E8%98%BF%E8%94%94">#味增豚汁燉蘿蔔</a>
												<a class="text-support-02"
													href="https://cookpad.com/tw/%E6%90%9C%E5%B0%8B/%23%E5%BF%AB%E7%85%AE%E9%8D%8B">#快煮鍋</a>
												<a class="text-support-02"
													href="https://cookpad.com/tw/%E6%90%9C%E5%B0%8B/%23%E7%93%A6%E6%96%AF%E7%88%90">#瓦斯爐</a>
												<a class="text-support-02"
													href="https://cookpad.com/tw/%E6%90%9C%E5%B0%8B/%23%E6%9A%96%E5%86%AC%E6%96%99%E7%90%86">#暖冬料理</a>
											</p>
										</div>

									</section>


								</div>
							</div>

							<div
								class="text-cookpad-14 xs:text-cookpad-16 p-1 xs:p-3 border-t border-quaternary text-center text-secondary print:hidden">
								<span class="px-4"> <i class="icf icf--timer "></i> 30min
								</span>
							</div>

							<section id="ingredients"
								class="ingredients-container document-section border-b border-t border-quaternary bg-pure-white">
								<div class="document-title-container">
									<h2 class="text-cookpad-16 xs:text-cookpad-24 font-extrabold">預備食材</h2>
									<div class="shrink-xs text-tertiary">
										<div id="serving_recipe_14223472">
											<div class="text-secondary mt-sm">
												<i class="icf icf--user "></i> 2～3人份
											</div>
										</div>

									</div>
								</div>



								<div class="ingredient-list">
									<ol
										class="list-unstyled text-cookpad-14 xs:text-cookpad-18 divide-y"
										data-target="dir.auto">
										<li
											class="ingredient py-1 border-quaternary font-extrabold border-none mt-sm -mb-px pt-3">
											<div itemprop="ingredients">食材</div>
										</li>
										<c:if test="${list.ingredients_A!=null}">
										<li class="ingredient py-1 border-quaternary border-dashed">
											<div itemprop="ingredients"><a href="<c:url value='/connectMall?mall_searchString=${list.ingredients_A}&mall_pageNo=1'/>">${list.ingredients_A}</a>
												${list.gram_A} g</div>
										</li>
										</c:if>
										<c:if test="${list.ingredients_B!=null}">
										<li class="ingredient py-1 border-quaternary border-dashed">
											<div itemprop="ingredients"><a href="<c:url value='/connectMall?mall_searchString=${list.ingredients_B}&mall_pageNo=1'/>">${list.ingredients_B}</a>
												${list.gram_B} g</div>
										</li>
										</c:if>
										<c:if test="${list.ingredients_C!=null}">
										<li class="ingredient py-1 border-quaternary border-dashed">
											<div itemprop="ingredients"><a href="<c:url value='/connectMall?mall_searchString=${list.ingredients_C}&mall_pageNo=1'/>">${list.ingredients_C}</a>
												${list.gram_C} g</div>
										</li>
										</c:if>
										<c:if test="${list.ingredients_D!=null}">
										<li class="ingredient py-1 border-quaternary border-dashed">
											<div itemprop="ingredients"><a href="<c:url value='/connectMall?mall_searchString=${list.ingredients_D}&mall_pageNo=1'/>">${list.ingredients_D}</a>
												${list.gram_D} g</div>
										</li>
										</c:if>
										<!--     <li class="ingredient py-1 border-quaternary font-extrabold border-none mt-sm -mb-px pt-3" id="ingredient_66447547"> -->
										<!--       <div itemprop="ingredients"> -->
										<!--         調味料 <bdi class="ingredient__quantity"></bdi> -->

										<!--       </div> -->
										<!--     </li> -->

									</ol>
								</div>
							</section>

							<section id="steps"
								class="steps-container document-section bg-pure-white">
								<div class="document-title-container">
									<h2 class="text-cookpad-16 xs:text-cookpad-24 font-extrabold">步驟</h2>
								</div>

								<ol class="numbered-list" data-target="dir.auto">

									<!------------------------ 步驟一 ------------------------------>
									<li class="step numbered-list__item" id="step_39829192"
										data-target="dir.auto" style="display: flex;">
										<div style="width: 30%; margin: 10px;">
											<c:if test="${list.fileName_A!=null}">
												<img width="751" height="532" id="imageA"
													src="<c:url value='getImageA?rec_id=${list.rec_id}'/>" />
											</c:if>
											<c:if test="${list.fileName_A==null}">
												<img width="751" height="532" id="imageA"
													src="<c:url value='images/新ちゃん.jpg'/>" />
											</c:if>
										</div>
										<div class="numbered-list__contents" style="width: 70%">
											<div class="text-cookpad-14 xs:text-cookpad-18">
												<div class="prose">
													<div itemprop="recipeInstructions"
														data-dir-attribute="auto">
														<p class="mb-sm inline">${list.method_A}</p>

													</div>
												</div>
											</div>

											<div class="flex space-x-sm"></div>
										</div>
									</li>

									<!------------------------ 步驟二 ------------------------------>

									<li class="step numbered-list__item" id="step_39829192"
										data-target="dir.auto" style="display: flex;">
										<div style="width: 30%; margin: 10px;">
											<c:if test="${list.fileName_B!=null}">
												<img width="751" height="532" id="imageB"
													src="<c:url value='getImageB?rec_id=${list.rec_id}'/>" />
											</c:if>
											<c:if test="${list.fileName_B==null}">
												<img width="751" height="532" id="imageB"
													src="<c:url value='images/沒有.jpg'/>" />
											</c:if>
										</div>
										<div class="numbered-list__contents" style="width: 70%">
											<div class="text-cookpad-14 xs:text-cookpad-18">
												<div class="prose">
													<div itemprop="recipeInstructions"
														data-dir-attribute="auto">
														<p class="mb-sm inline">${list.method_B}</p>

													</div>
												</div>
											</div>

											<div class="flex space-x-sm"></div>
										</div>
									</li>

									<!------------------------ 步驟三 ------------------------------>

									<li class="step numbered-list__item" id="step_39829192"
										data-target="dir.auto" style="display: flex;">
										<div style="width: 30%; margin: 10px;">
											<c:if test="${list.fileName_C!=null}">
												<img width="751" height="532" id="imageC"
													src="<c:url value='getImageC?rec_id=${list.rec_id}'/>" />
											</c:if>
											<c:if test="${list.fileName_C==null}">
												<img width="751" height="532" id="imageC"
													src="<c:url value='images/沒有.jpg'/>" />
											</c:if>
										</div>
										<div class="numbered-list__contents" style="width: 70%">
											<div class="text-cookpad-14 xs:text-cookpad-18">
												<div class="prose">
													<div itemprop="recipeInstructions"
														data-dir-attribute="auto">
														<p class="mb-sm inline">${list.method_C}</p>

													</div>
												</div>
											</div>

											<div class="flex space-x-sm"></div>
										</div>
									</li>

									<!------------------------ 步驟四 ------------------------------>

									<li class="step numbered-list__item" id="step_39829192"
										data-target="dir.auto" style="display: flex;">
										<div style="width: 30%; margin: 10px;">
											<c:if test="${list.fileName_D!=null}">
												<img width="751" height="532" id="imageD"
													src="<c:url value='getImageD?rec_id=${list.rec_id}'/>" />
											</c:if>
											<c:if test="${list.fileName_D==null}">
												<img width="751" height="532" id="imageD"
													src="<c:url value='images/沒有.jpg'/>" />
											</c:if>
										</div>
										<div class="numbered-list__contents" style="width: 70%">
											<div class="text-cookpad-14 xs:text-cookpad-18">
												<div class="prose">
													<div itemprop="recipeInstructions"
														data-dir-attribute="auto">
														<p class="mb-sm inline">${list.method_D}</p>

													</div>
												</div>
											</div>

											<div class="flex space-x-sm"></div>
										</div>
									</li>

									<!------------------------ 步驟五 ------------------------------>

									<li class="step numbered-list__item" id="step_39829192"
										data-target="dir.auto" style="display: flex;">
										<div style="width: 30%; margin: 10px;">
											<c:if test="${list.fileName_E!=null}">
												<img width="751" height="532" id="imageE"
													src="<c:url value='getImageE?rec_id=${list.rec_id}'/>" />
											</c:if>
											<c:if test="${list.fileName_E==null}">
												<img width="751" height="532" id="imageE"
													src="<c:url value='images/沒有.jpg'/>" />
											</c:if>
										</div>
										<div class="numbered-list__contents" style="width: 70%">
											<div class="text-cookpad-14 xs:text-cookpad-18">
												<div class="prose">
													<div itemprop="recipeInstructions"
														data-dir-attribute="auto">
														<p class="mb-sm inline">${list.method_E}</p>

													</div>
												</div>
											</div>

											<div class="flex space-x-sm"></div>
										</div>
									</li>

								</ol>
							</section>

						</div>
					</div>
				</div>
				<div id="author_profile"
					class="print:hidden border-b border-t border-quaternary">
					<div class="recipe-media" data-controller="source-tracking"
						data-source-tracking-via="recipe.author_preview">
						<div class="recipe-media__section">
							<div class="text-center">
								<div class="text-secondary text-cookpad-14 xs:text-cookpad-20">
									<a data-action="source-tracking#appendParam"
										href="/tw/%E4%BD%BF%E7%94%A8%E8%80%85/21449609"> <img
										alt="" title="${detailBean.name}"
										class="inline mb-0 xs:mb-sm w-10 xs:w-auto rounded-full lazy-image"
										width="60" height="60"
										data-original="https://img-global.cpcdn.com/users/941b26e31fa143b7/60x60cq50/photo.jpg"
										data-src="<c:url value='getImageDetail?mem_no=${detailBean.mem_no}'/>"
										data-srcset="https://img-global.cpcdn.com/users/941b26e31fa143b7/120x120cq50/photo.jpg 2x"
										src="" />
									</a>
									<div class="py-1">已發布</div>

									<a data-action="source-tracking#appendParam"
										href="/tw/%E4%BD%BF%E7%94%A8%E8%80%85/21449609"> <span
										class="text-primary text-cookpad-16 xs:text-cookpad-20 font-extrabold leading-snug">${detailBean.name}</span>
									</a>
									<div class="py-1">
										於
										<time datetime="2020-12-14T02:02:58Z"
											data-controller="localtime" data-format="LL">${list.date}</time>
									</div>

									<div class="py-0 xs:py-2 break-words">
										主攻氣炸鍋與快煮鍋料理，出乎意料發現快煮鍋能這麼好煮！近期又購入無油煙的氣炸鍋，能盡情享用牛排！
										外宿也能輕鬆煮遍各式美味料理！</div>
								</div>


							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
	</div>
	<script type="text/javascript">
		function fun(login_ok, rec_id) {
			console.log('login_okval: ' + login_ok);
			console.log('rec_id: ' + rec_id);
			if (login_ok != null) {
				$.ajax({
					type : "GET",
					url : "./bookmark",
					data : {
						"rec_id" : rec_id
					},
					success : function(response) {
						alert(response);
						$("#heart").css("color", "red");
					}
				});
			}
		}

		
		function funLogin(login_ok, rec_id) {
			console.log('login_okval: ' + login_ok);
			console.log('rec_id: ' + rec_id);
			if (login_ok != null) {
				$.ajax({
					type : "GET",
					url : "./login.controller",
					success : function(response) {
						alert('請登入')
						$("#Login").html(response);
					}
				});
			}
		}
	</script>
</body>
</html>

<!-- <style>
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
 </style> -->

<!-- </head> -->
<!-- <body class="goto-here"> -->
<!-- 	<div id="notLogin"> -->
<%-- 		<jsp:include page="../header.jsp" /> --%>
<!-- 	<div id="addSuccess"> -->

<!-------------------------內容區--------------------------------->

<%-- 		<c:if test="${login_ok==null}"> --%>
<!-- 			<div align="center"> -->
<!-- 				<form action="frontPage.controller" method="get" runat="server"> -->
<!-- 					<fieldset> -->
<!-- 						<legend>搜尋結果</legend> -->
<%-- 						<c:forEach var='BeanToken' items="${List}">	 --%>
<!-- 							<div class="wrap" style="text-align: center;"> -->
<!-- 								<a style="border:3px solid red;" -->
<%-- 									href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>"> --%>
<!-- 									<img height="100" width="100%" -->
<%-- 									src="<c:url value='/getImageA?rec_id=${BeanToken.rec_id}'/>" /> --%>
<!-- 								</a> -->

<!-- 								<div class="txt"> -->
<!-- 									<div align="center"> -->
<!-- 										<h2 align="center" -->
<!-- 											style="width: 300px; float: left; display: inline"> -->
<!-- 											<a -->
<%-- 												href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a> --%>
<!-- 										</h2> -->

<%-- 										<input type="hidden" id="send" value="${BeanToken.rec_id}" /> --%>
<!-- 										<h2 style="width: 50px; float: left; display: inline"> -->
<!-- 											<a href="javascript:void(0);" -->
<!-- 												class="heart d-flex justify-content-center align-items-center " -->
<%-- 												onclick="fun(${login_ok})"><span><i --%>
<!-- 													class="ion-ios-heart" id="heart"></i></span> </a> -->
<!-- 										</h2> -->
<!-- 									</div> -->
<!-- 									<div> -->
<%-- 										<p>累積人氣: ${BeanToken.views}</p> --%>
<!-- 									</div> -->
<!-- 									<hr> -->
<!-- 									<div> -->
<%-- 											食材: <a href="<c:url value='/connectMall?mall_searchString=${BeanToken.ingredients_A}&mall_pageNo=1'/>" > --%>
<%-- 												${BeanToken.ingredients_A} --%>
<!-- 											</a>										 -->
<%-- 										<p>食材: ${BeanToken.ingredients_B}</p> --%>
<%-- 										<p>介紹 : ${BeanToken.desc}</p> --%>
<%-- 										<p>料理方法 : ${BeanToken.method}</p> --%>
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<hr> -->
<%-- 						</c:forEach> --%>
<!-- 						<div style="text-align: center;"> -->
<!-- 							<label> <input type="submit" value="回首頁" /> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 					</fieldset> -->
<!-- 				</form> -->
<!-- 			</div> -->
<%-- 		</c:if> --%>

<%-- 		<c:if test="${login_ok!=null}"> --%>
<%-- 			<c:if test="${flag==true}"> --%>
<!-- 				<div align="center"> -->
<!-- 					<form action="frontPage.controller" method="get" runat="server"> -->
<!-- 						<fieldset> -->
<!-- 							<legend>搜尋結果</legend> -->
<%-- 							<c:forEach var='BeanToken' items="${list}"> --%>
<!-- 								<a -->
<%-- 										href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>"> --%>
<!-- 										<img height="100" width="80" -->
<%-- 										src="<c:url value='/getImageA?rec_id=${BeanToken.rec_id}'/>" /> --%>
<!-- 									</a> -->
<!-- 								<div style="width: 800px;margin: auto;background-color:wheat;"> -->

<!-- 								<div class="wrap" style="text-align: center;"> -->

<!-- 									<div class="txt"> -->
<!-- 										<div align="center"> -->
<!-- 											<h2 align="center" -->
<!-- 												style="width: 300px; float: left; display: inline"> -->
<!-- 												<a -->
<%-- 													href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a> --%>
<!-- 											</h2> -->

<%-- 											<input type="hidden" id="send" value="${BeanToken.rec_id}" /> --%>
<!-- 											<h2 style="width: 50px; float: left; display: inline"> -->
<!-- 												<a href="javascript:void(0);" -->
<!-- 													class="heart d-flex justify-content-center align-items-center " -->
<%-- 													onclick="fun('${login_ok}')"> <span><i --%>
<!-- 														class="ion-ios-heart" id="heart" style="color: red;"></i></span></a> -->
<!-- 											</h2> -->
<!-- 										</div> -->
<!-- 										<div> -->
<%-- 										<p>累積人氣: ${BeanToken.views}</p> --%>
<!-- 										</div> -->
<!-- 										<hr> -->
<!-- 										<div> -->
<%-- 											食材: <a href="<c:url value='/connectMall?mall_searchString=${BeanToken.ingredients_A}&mall_pageNo=1'/>" > --%>
<%-- 												${BeanToken.ingredients_A} --%>
<!-- 											</a>	 -->
<!-- 											<h5>食材  :  </h5> -->
<%-- 											<p>${BeanToken.ingredients_B}</p> --%>
<!-- 											<h5>介紹  :  </h5> -->
<%-- 											<p>${BeanToken.desc}</p> --%>
<!-- 											<h5>料理方法 :  </h5> -->
<%-- 											<p>${BeanToken.method}</p> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								</div> -->
<!-- 								<hr> -->
<%-- 							</c:forEach> --%>

<!-- 							<div style="text-align: center;"> -->
<!-- 								<label> <input type="submit" value="回首頁" /> -->
<!-- 								</label> -->
<!-- 							</div> -->
<!-- 						</fieldset> -->
<!-- 					</form> -->
<!-- 				</div> -->
<%-- 			</c:if> --%>

<%-- 			<c:if test="${flag!=true}"> --%>
<!-- 				<div align="center"> -->
<!-- 					<form action="frontPage.controller" method="get" runat="server"> -->
<!-- 						<fieldset> -->
<!-- 							<legend>搜尋結果</legend> -->


<%-- 							<c:forEach var='BeanToken' items="${list}"> --%>
<!-- 								<div class="wrap" style="text-align: center;"> -->
<!-- 									<a -->
<%-- 										href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>"> --%>
<!-- 										<img height="100" width="80" -->
<%-- 										src="<c:url value='/getImageA?rec_id=${BeanToken.rec_id}'/>" /> --%>
<!-- 									</a> -->

<!-- 									<div class="txt"> -->
<!-- 										<div align="center"> -->
<!-- 											<h2 align="center" -->
<!-- 												style="width: 300px; float: left; display: inline"> -->
<!-- 												<a -->
<%-- 													href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a> --%>
<!-- 											</h2> -->


<%-- 											<input type="hidden" id="send" value="${BeanToken.rec_id}" /> --%>
<!-- 											<h2 style="width: 50px; float: left; display: inline"> -->
<!-- 												<a href="javascript:void(0);" -->
<!-- 													class="heart d-flex justify-content-center align-items-center " -->
<%-- 													onclick="fun('${login_ok}')"> <span><i --%>
<!-- 														class="ion-ios-heart" id="heart"></i></span></a> -->
<!-- 											</h2> -->
<!-- 										</div> -->
<!-- 										<div> -->
<%-- 										<p>累積人氣: ${BeanToken.views}</p> --%>
<!-- 										</div> -->
<!-- 										<hr> -->
<!-- 										<div> -->
<%-- 											食材: <a href="<c:url value='/connectMall?mall_searchString=${BeanToken.ingredients_A}&mall_pageNo=1'/>" > --%>
<%-- 												${BeanToken.ingredients_A} --%>
<!-- 											</a>	 -->
<!-- 											<h5>食材  :  </h5> -->
<%-- 											<p>${BeanToken.ingredients_B}</p> --%>
<!-- 											<h5>介紹  :  </h5> -->
<%-- 											<p>${BeanToken.desc}</p> --%>
<!-- 											<h5>料理方法 :  </h5> -->
<%-- 											<p>${BeanToken.method}</p> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<hr> -->
<%-- 							</c:forEach> --%>

<!-- 							<div style="text-align: center;"> -->
<!-- 								<label> <input type="submit" value="回首頁" /> -->
<!-- 								</label> -->
<!-- 							</div> -->
<!-- 						</fieldset> -->
<!-- 					</form> -->
<!-- 				</div> -->
<%-- 			</c:if> --%>


<%-- 		</c:if> --%>

<!------------------------------------------------------------------>
<!-- 	</div> -->
<%-- 		<jsp:include page="../footer.jsp" /> --%>
<!-- 	</div> -->


<!-- 	<script type="text/javascript"> 

// 	function fun(login_ok){
// 		console.log('login_okval: '+login_ok);
// 		var rec_id=$("#send").val();
// 		console.log('rec_id: '+rec_id);
// 		if(login_ok!=null){
// 			$.ajax({
// 			type:"GET",
// 			url:"./bookmark",
// 			data:{"rec_id":rec_id},
// 			success:function(response){
// 				alert(response);
// 				$("#heart").css("color","red");
// 				}
// 			});
// 		}else{
// 			$.ajax({
// 				type:"GET",
// 				url:"./login.controller",
// 				success:function(response){				
// 				$("#notLogin").html(response);
// 				}
// 			});
// 		}
// 	}
	</script> -->
<!-- </body> -->
<!-- </html> -->