<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/views/main.jsp" />

<style type="text/css">
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #f1f1f1;
}
li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}
/* li a.active { */
/*     background-color: #4CAF50; */
/*     color: white; */
/* } */
li a:hover:not(.active) {
    background-color: #555;
    color: white;
}
.orderContent {
	padding: 15px;
}
#left {
	display: inline-block;
	margin-right: 30px;
	float: left;
}
#detailContent {
	display: inline-block;
	width: 80%;
}
#detailContent>p {
	margin: 0 0 10px 0;
	font-size: 30px;
	font-weight: 600;
}
</style>

<div class="orderContent">
	<div id="left">
		<ul>
			<li><a class="active" href="/orderdetail">주문목록/배송조회</a></li>
			<li><a href="/information">개인정보수정/확인</a></li>
		</ul>
	</div>
	
	<div id="detailContent">
		<p>주문목록/배송조회</p>
		<hr>
		
		<div id="datailTable">
			<table>
			<thead>
				<tr>
					<th style="width: 20%">주문일자</th>
					<th>상품사진</th>
					<th>상품명</th>
					<th style="width: 15%">배송상태</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
<%-- 				<c:forEach items="${orderList }" var="i"> --%>
<!-- 					<tr> -->
<%-- 						<td>${i.orderDate }</td> --%>
<!-- 						<td> -->
<%-- 						<c:if test="${i.imgNo eq 0 }"> --%>
<!-- 							<img id="thumbnail" src="/image/default.png">	 -->
<%-- 						</c:if> --%>
<!-- 						</td> -->
<%-- 						<td>${i.proName }</td> --%>
<%-- 						<td>${i.orderState }</td> --%>
<!-- 						<td></td> -->
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
			</tbody>
			</table>
		</div>
	
	</div>
</div>
</body>
</html>