<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EPOZEN mall</title>
</head>
<body>

<div id="head">
	<div id="home_name">
		<a href="/list">EPOZEN mall</a>
	</div>
	<div id="login">
		<a href="/login">로그인</a>
	</div>
</div>

<div id="content">

	<div id="list">
		<table>
			<thead>
				<tr>
					<th>상품사진</th>
					<th>상품명</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${proList }" var="i">
					<tr>
						<td><a href="/prodetail?proNo=${i.proNo}">${i.proName }</a></td>	
						<td>${i.proPrice }</td>	
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>


</body>
</html>