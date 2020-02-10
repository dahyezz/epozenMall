<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/views/main.jsp" />

<style type="text/css">
.contain{
	padding:50px;
	width:700px;
	heigt:300px;
	margin-left:720px;
}
td{
	padding:20px 5px 5px 15px;
}
.div1{
	/* border: 1px solid black; */
}
</style>

<div class="contain">
<h1> 주문/결제</h1>
	<div>
		<p>구매자 정보</p>
		
		<div class="div1">
		<table>
			<tr>
				<td>이름</td>
				<td name="userName" value="test">${user.userName}</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${user.userId}</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td>${user.userPhone}</td>
			</tr>
			<tr>
				<td>받는사람 정보</td>
				<td><input type="checkbox" name="user" value="주문자와 동일" onClick="check()">주문자와 동일</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="userName"></td>
				<td><input type="hidden" name="userId" id="userId"></td>
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
				<td> <input type="hidden" name="orderPrice" id="orderPrice" ></td>
			</tr>
			<tr>
				<td>결제 방법</td>
				<td><input type="radio" name="chk_info" >무통장입금</td>
				<td><input type="radio" name="chk_info" >신용/체크카드</td>
			</tr>
		</table>
			<input type="button" id="btnOrder" value="구매하기">
			<input type="button" id="btnBack" value="뒤로가기">			
			
	</div>
</div>

<script>
function check(){
	
	document.getElementByName('user').checked;
	var s = document.getElementByName('user').checked;
	
	if(s.checked){
		document.getElementByName('name').value = document.getElementByName('userName').value;
	}else{
		document.getElementByName('name').value="";
	}
}




</script>

</body>
</html>



