<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>


#div{
	margin-top:20px;
	margin-left:15px;
	width:150px;
}

</style>

</head>
<body>
<jsp:include page="/top.jsp" />
<div id="div">
<div style="margin-left:25px" >
	<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">會員管理</button>
	<div id="demo" class="collapse">
	<li><a href="memberUpdate.controller">資料修改</a></li>
	<li><a href="memberEvaluation.controller">評價查詢</a></li>
	</div>
</div>
<br>
<div style="margin-left:25px" >
	<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo1">商城管理</button>
	<div id="demo1" class="collapse">
	<li><a href="">????</a></li>
	<li><a href="">????</a></li>
	</div>
</div>
<br>
<div style="margin-left:25px" >
	<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo2">市場管理</button>
	<div id="demo2" class="collapse">
	<li><a href="">????</a></li>
	<li><a href="">????</a></li>
	</div>
</div>
<br>
<div style="margin-left:25px" >
	<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo3">食譜管理</button>
	<div id="demo3" class="collapse">
	<li><a href="">????</a></li>
	<li><a href="">????</a></li>
	</div>
</div>
<br>
<div style="margin-left:25px" >
	<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo4">活動管理</button>
	<div id="demo4" class="collapse">
	<li><a href="" />????</li>
	<li><a href="" />????</li>
	</div>
</div>
</div>
</body>
</html>