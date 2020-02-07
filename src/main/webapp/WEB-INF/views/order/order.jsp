<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<c:import url="/WEB-INF/views/main.jsp" />

<div>
<h1> 주문/결제</h1>
	<div>
	<form action="/order">
		<table>
			<tr>
				<td>구매자 정보</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${user.userName }</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${user.userId }</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td>${user.userPhone }</td>
			</tr>
		
			<tr>
				<td>받는사람 정보</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="userName" id="userName"></td>
				
			</tr>	
			<tr>
				<td>배송지</td>
				<td><input type="text" name="userAdd" id="userAdd"> </td>
			</tr>
			<tr>
				<td>휴대폰 번호</td>
				<td><input type="text" name="userPhone" id="userPhone"></td>
			</tr>	
			<tr>
				<td>배송 요청 사항</td>
				<td><input type="text" name="userRequest" id="userRequest"></td>
			</tr>
					<tr>
				<td>총 합계 : </td>
				<td></td>
			</tr>
			<tr>
				<td>배송비</td>
				<td></td>
			</tr>
			<tr>
				<td>총 결제 금액</td>
				<td> <input type="hidden" name="orderPrice" id="orderPrice" value="${detail.orderPrice}"></td>
			</tr>
			<tr>
				<td>결제 방법</td>
				<td><input type="radio" name="chk_info" >무통장입금</td>
				<td><input type="radio" name="chk_info" >신용/체크카드</td>
			</tr>
		</table>
		</form>
	</div>
</div>


</body>
</html>



