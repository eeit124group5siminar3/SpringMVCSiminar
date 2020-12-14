<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<textarea namen="content" id="editor">
    <p>这里的内容会被初始化到编辑器中</p>
</textarea>

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

</script>
</body>
</html>