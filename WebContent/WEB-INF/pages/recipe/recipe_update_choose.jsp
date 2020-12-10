<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>修改食譜</title>
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
.fieldset {
	margin-left:;
	margin-right: 20%;
}

.wrap {
	width: 800px;
	margin: auto;
	display: flex;
	align-items: center;
}

.wrap1 {
	vertical-align: middle;
	width: 30%;
	margin-left: 50px;
}

.wrap2 {
	vertical-align: middle;
	width: 70%;
	margin-left: 150px;
}

.txt {
	width: 50%;
	vertical-align: middle;
	margin-left: 150px;
}

.deleteRecipe {
	width: 50%;
	vertical-align: middle;
	margin-left: 100px;
}
</style>

</head>
<body class="goto-here">
	<div id="deleteSuccess">
	<jsp:include page="../header.jsp" />

		<!-------------------------內容區--------------------------------->

<!-- 		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand">Recipe</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="<c:url value='blogPage.controller'/>">User Blog<span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='uploadPage.controller'/>">Upload</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='updatePage.controller'/>">Update</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='myRecipe'/>">Bookmark</a></li>

					<!--       <li class="nav-item dropdown"> -->
					<!--         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> -->
					<!--           Dropdown -->
					<!--         </a> -->
					<!--         <div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
					<!--           <a class="dropdown-item" href="#">Action</a> -->
					<!--           <a class="dropdown-item" href="#">Another action</a> -->
					<!--           <div class="dropdown-divider"></div> -->
					<!--           <a class="dropdown-item" href="#">Something else here</a> -->
					<!--         </div> -->
					<!--       </li> -->
					<!--       <li class="nav-item"> -->
					<!--         <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> -->
					<!--       </li> -->
<!-- 				</ul> -->

				<%--     <form class="form-inline my-2 my-lg-0" action='<c:url value="/searchSubmit.controller"/>' method="post"> --%>
				<!--       <input class="form-control mr-sm-2" type="search" placeholder="search delicious" aria-label="Search"> -->
				<!--       <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="action">Search</button> -->
				<%--     </form> --%>
<!-- 			</div> -->
<!--  		</nav> --> 

		<div id="Success"></div>

		<div align="center">
			<fieldset class="border signup-form-fieldset">
				<legend style="color: black; font-size: 23px;">已上傳食譜</legend>

				<form:form class="formSet" action="javascript:void(0);" 
				method="post" modelAttribute="updateBean">
					<c:forEach var='BeanToken' items="${user_recipe}">
						<div class="wrap">

							<div class="wrap1">

								<a href="#"
									class="list-group-item list-group-item-action list-group-item-warning"
									style="width: 200px;" class="wrapLink" data-toggle="modal"
									onclick="updateFun(${BeanToken.rec_id})" 
									data-target="#exampleModalCenter"> ${BeanToken.name}</a>
							</div>
							<div class="txt">上傳日期 : ${BeanToken.date}</div>
							<div class="deleteRecipe"> 
								<button class="btn btn-outline-danger" id="send" type="submit" 
								onclick="fun(${BeanToken.rec_id})" >刪除</button>
							</div>
							<br>
						</div>
						<br>
					</c:forEach>

					<!-- Modal -->
					<div class="modal fade" id="exampleModalCenter" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalCenterTitle"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">更改食譜</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body" id="updateForm"></div>
								<div style="text-align: center;">
									<div class="modal-footer"></div>
								</div>
							</div>
						</div>
					</div>


				</form:form>
			</fieldset>
		</div>
<!-- 		<div style="text-align: center;"> -->
<!-- 			<label> <input type="submit" name="action" value="回首頁"> -->
<!-- 			</label> -->
<!-- 		</div> -->





		<!-- <br> -->

		<!------------------------------------------------------------------>
	<jsp:include page="../footer.jsp" />

	</div>

	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
        $(function () {

            $("#myDataTalbe").DataTable({
                searching: true,
                columnDefs: [{
                    targets: [3],
                    orderable: false,
                }]
            });
        });
    </script>

	<script type="text/javascript"> 
// 		$(function(){		
// // 			var data=$("#delete_id").serializeArray();
// 			$("#send").click(function(){
// 				var delete_id=$("#delete_id").val();
// 				console.log('delete_id: '+delete_id);
// 				$.ajax({
// 					type:"GET",
// 	 				dataType:"html",
// 					url:"./deleteConfirm",
// 					data:{
// 						"rec_id":delete_id
// 						},
// 					success:function(data){
// 						console.log(data);
// 						alert('刪除成功');
// 						$("#deleteSuccess").html(data);

// 						},
// 					error:function(){
// 						}	
// 					});
// 				});
// 			});

		function fun(rec_id){
			var deleteSuccess=document.getElementById("deleteSuccess");
			var xhr = new XMLHttpRequest();	
			xhr.onreadystatechange = function(){
				if (xhr.readyState === 4) {
					// 伺服器回應成功
					if (xhr.status === 200) {
						// 收到伺服器的回應
						alert('刪除成功');
						deleteSuccess.innerHTML= xhr.responseText;
					}
				}	
			}
			var url = "<c:url value='/deleteConfirm?rec_id=" + rec_id + "' />"
			xhr.open("GET",url,true);
			xhr.send();
			}


		function updateFun(rec_id) {
// 			$('#update').on('show.bs.modal', function (event) {
// 				var tr = $(event.relatedTarget);
// 				var productId = tr.data('whatever');
			console.log('進入onclick fun rec_id'+rec_id)
			$.ajax({
				url : "./updateProcess.controller",
				type : "GET",
				data : {
					"rec_id":rec_id	
				},
				datatype : "html",
				success : function(data, status) {
					$("#updateForm").html(data);
				},
				error : function(data, status) {
					$("#updateForm").html(data);
				}
			})
}		
			


 	</script>

	<!--  <script type="text/javascript">  
$(function(){
	var currentPage=1;
	var totalPages;
	console.log('currentPage'+currentPage);
	function list(){
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/ChoosePage/"+currentPage, 
// 			$.getJSON("./ChoosePage/"+currentPage, {jsonData: JSON.stringify(getFormData())}, 
// 					function(data) 
// 					{
// 					alert(data[0].name);
// 					});
			success:function(data){
				alert('succccccccccccccccces');
// 				console.log(data.length);
// 				var data=response.searchMyRecipe;
// 				console.log('length'+data.length);

// 				var data2=response.pageNo;
// 				console.log('pageNo'+data2);

// 				let content="";
// 				for(var i=0;i<data.length;i++){
// 				var val=data[i];
// 					content+=
// 						`<div class="row">
// 			    			<div class="col-md-6 col-lg-3 ftco-animate">
			    
// 			    				<div>							                                                                           
// 					              <a href="<c:url value='/recipeDetail.controller?rec_id=\${val.rec_id}'/>" class="block-20" 
// 						              style="background-image: url('<c:url value='/getALLImage.controller?rec_id=\${val.rec_id}'/>');">
// 					              </a>
			    						
// 			    					<div class="text py-3 pb-4 px-3 text-center">
// 			    							<a href="<c:url value='/recipeDetail.controller?rec_id=\${val.rec_id}'/>">\${val.name}</a>
// 				    					<div style="float: right;"
// 				    							<a href="<c:url value='/bookmark?rec_id=\${val.rec_id}'/>" class="heart d-flex justify-content-center align-items-center " id="heart" >
// 				    								<span><i class="ion-ios-heart"></i></span>
// 				    							</a>
// 			    						</div>
// 			    					</div>
// 			    				</div>
// 			    			</div>  					    		
// 			    		</div>`;

		           	
 
		           
// 						`<div><p>累積人氣: \${val.name}</p>
// 		                <p>\${val.desc}</p></div>`;
// 				console.log('val.rec_id: '+val.rec_id);
// 					}
// 				$("#Success").html(content);
		


				currentPage=response.pageNo;
				console.log('1: '+currentPage);
				totalPages=response.totalPage;
				console.log('2: '+totalPages);
				
				content=
					`<li>
						<div id="afirst"><a href="#" onclick="pagechange('first')">
								&lt;&lt;</a>
						</div>
					</li>
					<li>
						<div id="apre"><a href="#" onclick="pagechange('pre')">
								&lt;</a>
						</div>
					</li>
					<li>\${currentPage}/ \${totalPages}</li>
					<li>
						<div id="bnext"><a href="#" onclick="pagechange('next')">

								&gt;</a>
						</div>
					</li>
					<li>
						<div id="blast"><a href="#" onclick="pagechange('last')">
								&gt;&gt;</a>
						</div>
					</li>`;
					$("#nowPage").html(content);
									
				
				}
			});
		}
//		<img border='0' alt='下一頁' height='30' width='30' src='./images/next-icon.png'/> </a></div>
});
		
	function pagechange(val){
		console.log(val);
		console.log(currentPage);
		console.log(totalPages);
		if(val=='first'){
			currentPage=1;
			list();
		}else if(val=='pre'){
			if(currentPage>1){
				currentPage--;
				list();
				}else{
					currentPage=1;
					list();
				}	
		}
		else if(val=='next'){
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

 </script>  -->
</body>
</html>