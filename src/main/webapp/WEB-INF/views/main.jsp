<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EPOZEN mall</title>

<link rel="shortcut icon" type="image/x-icon" href="/image/logo.PNG" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
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

#home_name > a {
	text-decoration: none !important;
	color: black;
}
#loginStatus>a {
	text-decoration: none;
	margin-right: 15px;
}
</style>

</head>
<body>

<div id="head">
	<div id="home_name">
		<a href="/list">EPOZEN mall</a>
	</div>
	<div id="loginStatus">
		<c:if test="${empty login }">
			<a href="/login">로그인</a>
		</c:if>
		<c:if test="${login }">
			<a href="/orderdetail">마이페이지</a>
			<a href="/cart">장바구니</a>
			<a href="/logout">로그아웃</a>
		</c:if>
	</div>
</div>

