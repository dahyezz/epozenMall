<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EPOZEN mall</title>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<style type="text/css">
.content {
	background-color: #ccc;
	text-align: center;
	margin-top: 0;
	height: 350px;
	margin-bottom: 50px
}
.content>p {
	margin: 0;
	font-size: 50px;
	font-weight: 600;
	display: inline-block;
	margin-top: 130px;
}
.errorInfo{
	width: 80%;
	text-align: center;
}
</style>

<body>
<div class="content">
    <p>Error Page</p>
</div>
<div class="errorInfo">
	error code : <span>${code}</span>
    <br>error msg : <span>${msg}</span>
    <br>timestamp : <span>${timestamp}</span>
	<p>오류가 발생하였습니다.</p>
	
	<a href="/list">메인으로가기</a>
</div>

</body>
</html>