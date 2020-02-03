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

<table>
	<thead>
		<th>상품사진</th>
		<th>상품명</th>
		<th>가격</th>
	</thead>
	<tbody>
		<c:forEach items="${proList }" var="i">
			<tr></tr>
			<tr>${i.proName }</tr>	
			<tr>${i.proPrice }</tr>	
		</c:forEach>
	</tbody>
</table>

</body>
</html>