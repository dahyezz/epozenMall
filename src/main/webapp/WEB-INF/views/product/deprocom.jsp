<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<div>
		<div>상품평</div>
	<%-- //<c:forEach items="${procomList}" var="procom"> --%>
		<div class="row">
			<span class="cell col1">${procomList.procomContents}</span>
			<span class="cell col2">${procomList.userId}</span>
		</div>
	<%-- </c:forEach> --%>
</div>	
