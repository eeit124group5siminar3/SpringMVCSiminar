<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章管理</title>
<link rel="stylesheet"
 href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="css/fontawesome-free/all.min.css">
<link rel="stylesheet"
 href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="css/dist/adminlte.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">



<style>
.fieldset {
	margin-left:;
	margin-right: 20%;
}

.wrap {
	width: 1000px;
	margin: auto;
	display: flex;
	align-items: center;
}

.wrap1 {
	vertical-align: middle;
	width: 30%;
	margin-left: 50px;
}

/* .wrap2 { */
/* 	vertical-align: middle; */
/* 	width: 70%; */
/* 	margin-left: 150px; */
/* } */

.txt {
	width: 50%;
	vertical-align: middle;
	margin-left:95px;
}

.deleteRecipe {
	width: 50%;
	vertical-align: middle;
	margin-right: 20px;
}
</style>
</head>
<body class="goto-here">
<div id="deleteSuccess">
<c:if test="${!empty login_ok}">
<jsp:include page="/WEB-INF/pages/Message.jsp" />
</c:if>
	<jsp:include page="/WEB-INF/pages/bar.jsp"/>

<section class="content-wrapper justify-content-center" style="background-color: #FFFFFF">

	<div align="center">
		<fieldset class="border signup-form-fieldset">
			<legend style="color: black; font-size: 23px;">發表過的文章</legend>
			<div class="wrap" style="text-align: center">

				<div style="margin-left: 165px">標題</div>
				<div class="txt">上傳日期</div>
			</div>
			<br>
			<form class="formSet" action="javascript:void(0);" method="post">
				<c:forEach var='BeanToken' items="${user_blog}">
					<div class="wrap">
					
<!-- 					開關 -->
					<input type="hidden" id="status" value="${BeanToken.status}"/>
					
					<c:if test="${BeanToken.status==1}">
					<input type="hidden" id="blog_id" value="${BeanToken.blog_id}"/>
					<div >
					<span onclick="funBtn(${BeanToken.blog_id})"><span id="btnChange${BeanToken.blog_id}"><span class="btn btn-warning">關閉</span></span></span>
					</div>
					</c:if>		
					
						
					<c:if test="${BeanToken.status==0}">
					<input type="hidden" id="blog_id" value="${BeanToken.blog_id}"/>
					<div >
					<span  onclick="funBtn(${BeanToken.blog_id})"><span id="btnChange${BeanToken.blog_id}"><span class="btn btn-outline-warning">開啟</span></span></span>
					</div>
					</c:if>		
					
						
						<div class="wrap1">
							<a href="#"
								class="list-group-item list-group-item-action list-group-item-warning"
								style="width: 200px;" class="wrapLink">${BeanToken.title}</a>
						</div>
						<div class="txt">	
						<div>上傳日期 : ${BeanToken.date}</div><span>修改日期 : </span>
						<c:if test="${BeanToken.update_date!=null}">
						<span>${BeanToken.update_date}</span>
						</c:if>
						</div>
						<div class="deleteRecipe">
							<a class="btn btn-outline-success"
								href="<c:url value='/getIdContent?blog_id=${BeanToken.blog_id}'/>">編輯
							</a>
							<button class="btn btn-outline-danger" id="send" type="submit"
								onclick="funDelete(${BeanToken.blog_id})">刪除</button>
						</div>
						<br>
					</div>
					<br>
				</c:forEach>
				</form>
				
				<form  action="./memberUpdate.controller" name="formsignup_aa" method="post">
			<button type="button" class="btn btn-primary py-3 px-4"  
			onclick="javascript:location.href='<c:url value='blogEdit'/>'">發表文章</button>
					<button type="submit" class="btn btn-primary py-3 px-4">回前頁</button>
			</form>
			
<!-- 					<a class="btn btn-primary py-3 px-4"   -->
<%-- 						href="<c:url value='blogEdit'/>">發表文章</a> --%>
<!-- 					<button type="submit" class="btn btn-primary py-3 px-4"   -->
<%-- 			onclick="javascript:location.href='<c:url value='backstage.controller'/>'">回前頁</button> --%>
		</fieldset>
	</div>

	<jsp:include page="../footer.jsp" />
	</div>
	<script type="text/javascript">
//  	function funSearch(id){
// 		$.ajax({
// 			type:"post",
// 			url:"./getIdContent",
// 			data:{"id":id},
// 			success:function(data){
// 				$("#searchSuccess").html(data);
// 				}

// 			})
// 		}
	
	function funDelete(blog_id){
		$.ajax({
			type:"post",
			url:"./blogPostDelete",
			data:{"blog_id":blog_id},
			success:function(data){
				$("#deleteSuccess").html(data);
				}

			})
		}
	
	function funBtn(blog_id){
		var a = $("#status").val();
		console.log('blog_id: '+blog_id);
		$.ajax({
			type:"post",
			url:"checkStatus",
			data:{"blog_id":blog_id},
			success:function(data){
				if(data){
					$("#btnChange"+blog_id).html(`<span class="btn btn-warning" 
							>關閉</span>`);  
					}
				else {			 		
					$("#btnChange"+blog_id).html(`<span class="btn btn-outline-warning"
							>開啟</span>`);
					}
				}
			})
		}
	</script>
</body>
</html>