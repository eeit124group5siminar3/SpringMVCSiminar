<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>農郁-活動</title>
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
	
	<c:if test="${!empty login_ok}">
		<jsp:include page="/WEB-INF/pages/Message.jsp" />
	</c:if>

<!-- ------------------------內容區 --- ----------------------------------------------------------------->
<!-- 	上面圖片 -->
	<div class="hero-wrap hero-bread" style="background-image: url('images/about.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Active</span></p>
            <h1 class="mb-0 bread">活動列表</h1>
          </div>
        </div>
      </div>
    </div>
    

<!-- 	搜尋bar -->
	<section class="ftco-section ftco-degree-bg">
		<div class="container" >
			<div class="row justify-content-center">
				<div class="col-md-10 mb-5 text-center">
					<ul class="act-type" id="product-category"></ul>
<!-- 					<form class="product-category" action="actFarmerPreListSearch.do" method="POST"> -->
						<input type="search" name="searchString" id="searchString"
							value="${searchString}"/>
						<button class="btn btn-primary"name="searchButton" style="border-radius: 5px;" onclick="searchlist()">查詢</button>
<!-- 					</form> -->
				</div>
			</div>
		</div>		
<!-- 活動列表 -->
	 <div class="container ftco-animate col-md-8 mb-5" id="actfarmerlist"></div>

<!-- 活動分頁 -->
	<form>
	<div class="container col-md-8 mb-5">
          <div class="container col-md-12 text-center">
            <div class="block-27"><ul id="page_id"></ul></div>
          </div>
        </div>
    </form>
	</section>		
	
	
<!-- ------------------------內容區 --- ----------------------------------------------------------------->

	
	<jsp:include page="../footer.jsp" />

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>

	
<!-- ------------------------script的 ----------------------------------------------------------------- -->	
<script type="text/javascript">
var currentPage = 1;
var totalPages;
console.log(searchString);
function list(){
	$.get({
	url:"${pageContext.request.contextPath}/actFarmerList.do/"+currentPage,
	success:function(response){ 
		console.log(response);
		let data = response.data;
		let content="";
		for(var i = 0; i<data.length; i++){
		content+=
		`<div class="col-md-12 d-flex"><div class="blog-entry align-self-stretch d-md-flex">
			<a href="<c:url value='getSingleAct.do?id=\${data[i].actId}'/>" class="block-20" style="background-image: url('<c:url value='ActImageController?id=\${data[i].actId}&type=ACTFARMER'/>');">&gt;</a>
				<div class="text d-block pl-md-4">
						<div class="meta mb-3">
			                 <div><a href="#">\${data[i].actType}</a></div>
						</div>
						 <h3 class="heading"><a href="#">\${data[i].actName}</a></h3>
			             	<p>活動地址:  \${data[i].actAddr}<br>活動電話: \${data[i].tel}<br>
			            	活動日期: \${data[i].actDateSta}~\${data[i].actDateEnd}</p>
			                <p><a href="<c:url value='getSingleAct.do?id=\${data[i].actId}'/>" class="btn btn-primary py-2 px-3">了解更多</a>
		                <a href="<c:url value='actSignPreInsert.do?id=\${data[i].actId}'/>" class="btn btn-primary py-2 px-3">我要報名</a></p>
			        </div>
			</div></div>`;
		}
		$('#actfarmerlist').html(content);
		
		currentPage = response.pageNo;
		totalPages=response.totalPages;
		content = `
        <li>
			<div id="blfirst"><a href="javascript:pagechange('first')">&lt;&lt;</a></div>
	
		</li>
        <li>
        	<div id="blprev"><a href="javascript:pagechange('pre')">&lt;</a></div>
		</li>
		<li>第 \${currentPage} 頁/ 共 \${totalPages} 頁</li>
		<li>
			<div id="blnext"><a href="javascript:pagechange('next')">&gt;</a></div>
		</li>
		<li>
			<div id="bllast"><a href="javascript:pagechange('last')">&gt;&gt;</a></div>
		</li>`;
		$('#page_id').html(content);
	}
})
}

function searchlist(){
	var searchString=$("#searchString").val();
	var currentPage = 1;
	var totalPages;
	$.post({
	url:"${pageContext.request.contextPath}/actFarmerListSearch.do/"+currentPage,
	data:{"searchString":searchString},
	success:function(response){ 
		console.log(response);
		let data = response.data;
		let content="";
		for(var i = 0; i<data.length; i++){
		content+=
		`<div class="col-md-12 d-flex"><div class="blog-entry align-self-stretch d-md-flex">
			<a href="<c:url value='getSingleAct.do?id=\${data[i].actId}'/>" class="block-20" style="background-image: url('<c:url value='ActImageController?id=\${data[i].actId}&type=ACTFARMER'/>');"></a>
				<div class="text d-block pl-md-4">
						<div class="meta mb-3">
			                 <div><a href="#">\${data[i].actType}</a></div>
						</div>
						 <h3 class="heading"><a href="#">\${data[i].actName}</a></h3>
			             	<p>活動地址:  \${data[i].actAddr}<br>活動電話: \${data[i].tel}<br>
			            	活動日期: \${data[i].actDateSta}~\${data[i].actDateEnd}</p>
			                <p><a href="<c:url value='getSingleAct.do?id=\${data[i].actId}'/>" class="btn btn-primary py-2 px-3">了解更多</a>
		                <a href="<c:url value='actSignPreInsert.do?id=\${data[i].actId}'/>" class="btn btn-primary py-2 px-3">我要報名</a></p>
			        </div>
			</div></div>`;
		}
		$('#actfarmerlist').html(content);
		
		currentPage = response.pageNo;
		totalPages=response.totalPages;
		console.log(totalPages);
		content = `
        <li>
			<div id="blfirst"><a href="javascript:pagechangeP('first')">&lt;&lt;</a></div>
	
		</li>
        <li>
        	<div id="blprev"><a href="javascript:pagechangeP('pre')">&lt;</a></div>
		</li>
		<li>第 \${currentPage} 頁/ 共 \${totalPages} 頁</li>
		<li>
			<div id="blnext"><a href="javascript:pagechangeP('next')">&gt;</a></div>
		</li>
		<li>
			<div id="bllast"><a href="javascript:pagechangeP('last')">&gt;&gt;</a></div>
		</li>`;
		$('#page_id').html(content);
	},

})
}
window.onload = list();

function pagechange(value){	
	if(value=='first'){
		currentPage=1;
		list();
	}else if(value =='pre'){
		if(currentPage>1){
			currentPage--;
			list();
		}else{
			currentPage=1;
			list();
		}		
	}
	else if(value =='next'){
		if(currentPage<totalPages){
			currentPage++;
			list();
		}else{
			currentPage=totalPages;
			list();
		}	
	}else{
		currentPage=totalPages;
		list();
	}
}

function pagechangeP(value){	
	if(value=='first'){
		currentPage=1;
		searchlist();
	}else if(value =='pre'){
		if(currentPage>1){
			currentPage--;
			searchlist();
		}else{
			currentPage=1;
			searchlist();
		}		
	}
	else if(value =='next'){
		if(currentPage<totalPages){
			currentPage++;
			searchlist();
		}else{
			currentPage=totalPages;
			searchlist();
		}	
	}else{
		currentPage=totalPages;
		searchlist();
	}
}

</script>
</body>
</html>