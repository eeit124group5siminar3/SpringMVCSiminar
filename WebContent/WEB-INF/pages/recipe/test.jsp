<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Client Side jQuery DataTables</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
</head>
<body>

    
      
<input type="file" id="imgfile">
<img src="" id="img" alt=""> 
<img src="" id="img2" alt="">


  <script>
 document.getElementById('imgfile').onchange = function(){
     reads(this.files[0],function(base64Data){   //获取图片的base64格式，显示
         document.getElementById("img").src= reader.result;
         var blob = dataURItoBlob(reader.result); //转换为blob格式
         blobToDataURI(blob,function(result){    //blob格式再转换为base64格式
             document.getElementById('img2').src = result;
         })
     });
 }
 function reads(_file,callback){
     var reader = new FileReader();
     reader.readAsDataURL(_file);
     reader.onload = function(){
         callback(reader.result);
     };
 }
 function dataURItoBlob(base64Data) {
     //console.log(base64Data);//data:image/png;base64,
     var byteString;
     if(base64Data.split(',')[0].indexOf('base64') >= 0)
         byteString = atob(base64Data.split(',')[1]);//base64 解码
     else{
         byteString = unescape(base64Data.split(',')[1]);
     }
     var mimeString = base64Data.split(',')[0].split(':')[1].split(';')[0];//mime类型 -- image/png
 
     // var arrayBuffer = new ArrayBuffer(byteString.length); //创建缓冲数组
     // var ia = new Uint8Array(arrayBuffer);//创建视图
     var ia = new Uint8Array(byteString.length);//创建视图
     for(var i = 0; i < byteString.length; i++) {
         ia[i] = byteString.charCodeAt(i);
     }
     var blob = new Blob([ia], {
         type: mimeString
     });
     return blob;
 }  
 
 function blobToDataURI(blob, callback) {
     var reader = new FileReader();
     reader.readAsDataURL(blob);
     reader.onload = function (e) {
         callback(e.target.result);
     }
 }
</script>
</body>
</html>