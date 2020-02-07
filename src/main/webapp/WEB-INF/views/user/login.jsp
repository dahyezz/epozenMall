<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EPOZEN mall 로그인</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('#btnJoin').click(function() {
		location.href="/register"
	});
	
	$('#btnLogin').click(function() {
		var form = document.getElementById("loginForm");
		form.submit();
	});
});
</script>

<style type="text/css">
.siteName {
	background-color: #ccc;
	text-align: center;
	margin-top: 0;
	height: 350px;
	margin-bottom: 50px
}
.siteName>p {
	margin: 0;
	font-size: 50px;
	font-weight: 600;
	display: inline-block;
	margin-top: 130px;
}

.login {
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>

<div class="siteName">
	<p>EPOZEN mall</p>
</div>

<div class="login">
	<form action="/login" method="post" id="loginForm">
		<table style="text-align: center; margin: auto;">
			<tr>
				<th style="width: 100px" scope="row">
				<label>아이디<input type="text" name="userId" /></label>
				</th>
			</tr>
			<tr>
				<th style="width: 100px" scope="row">
				<label>패스워드<input type="password" name="userPassword" /></label><br><br>
				</th>
			</tr>
		</table>
	</form>
	<button id="btnJoin">회원가입</button>
	<button id="btnLogin">로그인</button>
</div>

</body>
</html>