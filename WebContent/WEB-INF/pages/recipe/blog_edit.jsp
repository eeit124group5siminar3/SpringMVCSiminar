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

	<div align="center" class="form-group">
		<a href="#" onclick="funClick()">一鍵輸入</a>

		<form:form action="./blogContent" method='post'
			modelAttribute="editBean" style="width: 60%" enctype="multipart/form-data">

			<div>
				<form:label for="title" path="title" style="font-size: 30px;"
					class="input-group-text">文章標題 :  <span style="font-size: 15px;"> 最多15個字</span></form:label>
				<form:input id="title" path="title" class="form-control" placeholder="請輸入.."/>
				
			</div>
			<div>
				<label style="font-size: 30px;" class="input-group-text">封面圖片 :  </label>
			</div>
			<br>
			<!-- 			<div align="center" style="height:300px ;border: 3px solid red"> -->
			<img id="image" src=""
				style="max-height: 100%; max-width: 100%; width: auto; height: auto;zoom=1">
			<!-- 			</div> -->
			<div class="custom-file">
				<form:input type="file" class="custom-file-input"
					id="validatedCustomFile" path="multipartFile"
					onchange="loadImageFile(event)" />
				<form:label class="custom-file-label" for="validatedCustomFile"
					path="multipartFile">Choose
					file</form:label>
				<div class="invalid-feedback">請上傳圖片</div>
			</div>
			<br>
			<div>
				<form:label for="editor" path="content" style="font-size: 30px;"
					class="input-group-text">文章介紹 : </form:label>
				<form:textarea type="hidden" id="editor" rows="6" path="content"></form:textarea>
			</div>
			<!-- 			    <button id="bt">顯示內容</button> -->
			<!-- 			    <div id="out"></div> -->

			<br>
			<div align="center">
				<button type="submit" class="btn btn-outline-success" id="btn">送出</button>
			</div>
		</form:form>
	</div>

	<!-- 	    <div id="edt1"></div> -->


	<jsp:include page="../footer.jsp" />

	<script src="js/ckeditor/ckeditor.js"></script>

	<script type="text/javascript">
		function loadImageFile(event) {
			var image = document.getElementById('image');
			image.src = URL.createObjectURL(event.target.files[0]);
		};   
    </script>
    
	<script type="text/javascript">
    CKEDITOR.replace('editor');
//  document.getElementById("bt").addEventListener("click",(evt)=>{　
//  var out=document.getElementById("out");
//  var d//         document.getElementById("bt").addEventListener("click",(evt)=>{　
//  var out=document.getElementById("out");
//  var data=CKEDITOR.instances['editor'].getData();
//  out.textContent=data; ata=CKEDITOR.instances['editor'].getData();
//  out.textContent=data; 
//});
	function funClick(){
		$("#MsgTextarea").val("筆者經營「台灣貪吃胖的玩樂故事」部落格已超過兩年，一直是以業餘的心態經營（後文會再解釋），不是當作主要收入來源。這兩年來發生了許多事情，也有許多感觸。在剛經營三個月時，曾寫過一篇部落格心得文章《部落客三個月心得分享(1)-平臺推廣篇》，也請參考。在這裡，想要將過去經營部落格的經驗分享給大家，希望給將來有興趣經營自己部落格的朋友參考，未來可以少走一點冤枉路。論資歷、排技術，筆者不敢自稱是部落客高手。若內容有誤，或有不足的地方，也歡迎大家提出意見一起分享。");
		$("#title").val("在地美食完全攻略");
		CKEDITOR.instances.editor.setData( "燒肉同話的店內裝潢漂亮乾淨，寬敞沒有擁擠感，可以讓人放鬆用餐，還有提供特色服裝給客人拍照，是一家很有特色的燒肉店。"+"\r\n"+"除了裝潢之外，燒肉同話的肉品也很不錯，雖然是燒肉店，卻有清爽的特色女子套餐，讓人眼睛一亮。"+
				"https://imgs.gvm.com.tw/upload/gallery/20180328/43663_00.jpg" ) ;
		}
</script>

	<!-- 	<script type="text/javascript">  
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
		
		ClassicEditor.create( document.querySelector( '#editor' ), {
			toolbar: {
			
				
					items: [
						'heading',
						'|',
						'bold',
						'italic',
						'link',
						'bulletedList',
						'numberedList',
						'|',
						'indent',
						'outdent',
						'|',
						'imageUpload',
						'blockQuote',
						'insertTable',
						'mediaEmbed',
						'undo',
						'redo'
					]
				},			
				language: 'zh',
				image: {
					toolbar: [
						'imageTextAlternative',
						'imageStyle:full',
						'imageStyle:side'
					]
				},
				table: {
					contentToolbar: [
						'tableColumn',
						'tableRow',
						'mergeTableCells'
					]
				},
				licenseKey: '',
		})
		
		.then( editor => {
				// 加载了适配器
				    editor.plugins.get('FileRepository').createUploadAdapter = (loader)=>{
				        return new UploadAdapter(loader);
				    };
				window.editor = editor;
		
				
				
				
			} )
			.catch( error => {
				console.error( 'Oops, something gone wrong!' );
				console.error( 'Please, report the following error in the https://github.com/ckeditor/ckeditor5 with the build id and the error stack trace:' );
				console.warn( 'Build id: kngfcngsrrab-jujsj4qk5w31' );
				console.error( error );
			} );
					

  </script> -->

	<!-- 	<script>  
class UploadAdapter {
        constructor(loader) {
            this.loader = loader;
        }
         upload() {
            return new Promise((resolve, reject) => {
            const data = new FormData();
						let file = [];
						//this.loader.file 这是一个Promise格式的本地文件流，一定要通过.then 进行获取，之前在各大博客查了很多文章都拿不到这个值，最后经过两个多小时的探索终于找到了是Promise问题。
						this.loader.file.then(res=>{
							file = res; //文件流 
							data.append('file', file); //传递给后端的参数，参数名按照后端需求进行填写
//							data.append('type','1');
// 							data.append('bucketName','xydms');//传递给后端的参数，参数名按照后端需求进行填写
// 							data.append('ckCsrfToken','oCS0feM9aUb0v4zQqrEgcExpQeWTZXG4pch37uds');//传递给后端的参数，参数名按照后端需求进行填写
// 							data.append('objectName','1101053001');//传递给后端的参数，参数名按照后端需求进行填写
							console.log('1111111111111111111111111111111111');
							$("#btn").click(function(){
								alert('成功送出');
							$.ajax({
							    url: './blogContent', //后端的上传接口 
							    type: 'POST',
							    data: data,
							    dataType: 'json',
							    processData: false,
							    contentType: false,
							    success: function (data) {
							        if (data) {
							        	console.log('succcccccccccccccces');
										console.log(data)
							            resolve({
							                default: data.default //后端返回的参数 【注】返回参数格式是{uploaded:1,default:'http://xxx.com'}
							            });
							        } else {
							            reject(data.msg);
							        }
							
							    }
							});
						})
						});
						

        });
        }
        abort() {
        }
    }
  		</script> -->
</body>
</html>