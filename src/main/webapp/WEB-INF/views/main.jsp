<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EPOZEN mall</title>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
#head {
	background-color: #ccc;
	width: 100%;
	margin-bottom: 20px;
	height: 40px;
}

#home_name {
	float: left;
	margin: 5px 0 0 10px;
	font-size: 23px;
}

#loginStatus {
	float: right;
	margin: 10px;
}

#head > a {
	text-decoration: none !important;
	color: black;
}
</style>

</head>
<body>

<div id="head">
	<div id="home_name">
		<a href="/list">EPOZEN mall</a>
	</div>
	<div id="loginStatus">
		<a href="/login">로그인</a>
	</div>
</div>

</body>
</html>