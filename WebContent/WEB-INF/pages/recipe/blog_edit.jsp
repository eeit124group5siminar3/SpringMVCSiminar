<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分享食譜</title>

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
<link rel="stylesheet" href="css/ckeditor.css">

</head>
<body class="goto-here">
	<jsp:include page="../header.jsp" />

	<div style="margin: auto; width: 800px">

		<form:form action="./blogContent" method='post'
			modelAttribute="blogBean">

			<form:label for="MsgTextarea" path="introduction"
				style="font-size: 30px;">自我介紹 : <span
					style="font-size: 15px;">最多400字</span>
			</form:label>
			<form:textarea class="form-control" id="MsgTextarea" rows="10"
				cols="40" path="introduction"></form:textarea>

			<br>
			<form:label path="title" style="font-size: 30px;">文章標題 :  </form:label>
			<form:input path="title" />
			<span style="font-size: 15px;">最多15個字</span>
			<form:textarea path="content" id="editor"></form:textarea>

			<%-- <form:label for="exampleFormControlTextarea1" id="editor" path="content"></form:label> --%>
			<%-- 				<form:textarea id="exampleFormControlTextarea1" --%>
			<%--  					rows="3" path="content"></form:textarea>  --%>

			<br>
			<div align="center">
				<button type="submit" class="btn btn-outline-success" id="btn">送出</button>
			</div>
		</form:form>
	</div>
	<jsp:include page="../footer.jsp" />
	<script
		src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>


	<script type="text/javascript">  
var myEditor = null;
window.onload = function(){
     ClassicEditor
    .create(document.querySelector("#editor"))
    .then(editor => { 
        myEditor = editor; 
    }) 
    .catch(error => {
        console.error(error);
    });
}
		
// 		ClassicEditor.create( document.querySelector( '#editor' ), {
// 			toolbar: {
			
				
// 					items: [
// 						'heading',
// 						'|',
// 						'bold',
// 						'italic',
// 						'link',
// 						'bulletedList',
// 						'numberedList',
// 						'|',
// 						'indent',
// 						'outdent',
// 						'|',
// 						'imageUpload',
// 						'blockQuote',
// 						'insertTable',
// 						'mediaEmbed',
// 						'undo',
// 						'redo'
// 					]
// 				},			
// 				language: 'zh',
// 				image: {
// 					toolbar: [
// 						'imageTextAlternative',
// 						'imageStyle:full',
// 						'imageStyle:side'
// 					]
// 				},
// 				table: {
// 					contentToolbar: [
// 						'tableColumn',
// 						'tableRow',
// 						'mergeTableCells'
// 					]
// 				},
// 				licenseKey: '',
// 		})
		
// 		.then( editor => {
// 				// 加载了适配器
// 				    editor.plugins.get('FileRepository').createUploadAdapter = (loader)=>{
// 				        return new UploadAdapter(loader);
// 				    };
// 				window.editor = editor;
		
				
				
				
// 			} )
// 			.catch( error => {
// 				console.error( 'Oops, something gone wrong!' );
// 				console.error( 'Please, report the following error in the https://github.com/ckeditor/ckeditor5 with the build id and the error stack trace:' );
// 				console.warn( 'Build id: kngfcngsrrab-jujsj4qk5w31' );
// 				console.error( error );
// 			} );
					

 </script>

	<script> 
// class UploadAdapter {
//         constructor(loader) {
//             this.loader = loader;
//         }
//          upload() {
//             return new Promise((resolve, reject) => {
//             const data = new FormData();
// 						let file = [];
// 						//this.loader.file 这是一个Promise格式的本地文件流，一定要通过.then 进行获取，之前在各大博客查了很多文章都拿不到这个值，最后经过两个多小时的探索终于找到了是Promise问题。
// 						this.loader.file.then(res=>{
// 							file = res; //文件流 
// 							data.append('file', file); //传递给后端的参数，参数名按照后端需求进行填写
// 							// data.append('type','1');
// // 							data.append('bucketName','xydms');//传递给后端的参数，参数名按照后端需求进行填写
// // 							data.append('ckCsrfToken','oCS0feM9aUb0v4zQqrEgcExpQeWTZXG4pch37uds');//传递给后端的参数，参数名按照后端需求进行填写
// // 							data.append('objectName','1101053001');//传递给后端的参数，参数名按照后端需求进行填写
// 							console.log('1111111111111111111111111111111111');
// 							$("#btn").click(function(){
// 								alert('成功送出');
// 							$.ajax({
// 							    url: './blogContent', //后端的上传接口 
// 							    type: 'POST',
// 							    data: data,
// 							    dataType: 'json',
// 							    processData: false,
// 							    contentType: false,
// 							    success: function (data) {
// 							        if (data) {
// 							        	console.log('succcccccccccccccces');
// 										console.log(data)
// 							            resolve({
// 							                default: data.default //后端返回的参数 【注】返回参数格式是{uploaded:1,default:'http://xxx.com'}
// 							            });
// 							        } else {
// 							            reject(data.msg);
// 							        }
							
// 							    }
// 							});
// 						})
// 						});
						

//         });
//         }
//         abort() {
//         }
//     }
  		</script>
</body>
</html>