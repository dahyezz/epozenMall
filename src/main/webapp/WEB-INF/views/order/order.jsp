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
			<form name="form">
		<table>
			<tr>
				<td>이름</td>
				<td>${user.userName}</td>
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
				<td><input type="text" name="orderName" id="orderName"></td>
				<td><input type="hidden" name="userId" id="userId"></td>
			</tr>	
			<tr>
				<td>배송지</td>
				<td><input type="text" name="userAdd" id="userAdd" > </td>
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

				<td>총 상품가격 : </td>
				<td><p id="price"><%= request.getParameter("proPrice") %>원</p></td>
			</tr>
			<tr>
				<td>배송비</td>
				<td><%= request.getParameter("deliveryCost") %>원</td>
			</tr>
			<tr>
				<td>총 결제 금액</td>
				<td><p id="total" style="display:inline-block;"></p>원</td>

			</tr>
			<tr>
				<td>결제 방법</td>
				<td><input type="radio" name="chk_info" value="1">무통장입금</td>
				<td><input type="radio" name="chk_info" value="1">신용/체크카드</td>
				<td><input type="hidden" name="orderNo" id="orderNo" value="orderNo" ></td>
			</tr>
		</table>
			</form>
			<input type="button" id="btnOrder" value="구매하기">
			<input type="button" id="btnBack" value="뒤로가기">			
			
	</div>
</div>

<script>

/* 주문자와 동일 */

$(document).ready(function(){
		var b = <%= request.getParameter("proPrice") %>;
		var a = <%= request.getParameter("deliveryCost")%>;
		var total = a + b;
		document.getElementById("total").innerHTML = total;
	
});
function check(){
	
	if($("input:checkbox[name=user]").is(":checked") == true) {
		var user = "${user.userName}";
		var add = "${user.userAdd}";
		var phone = "${user.userPhone}";

		document.getElementById("orderName").value = user;
		document.getElementById("userAdd").value = add;
		document.getElementById("userPhone").value = phone;
		
	}else {
		
		document.getElementById("orderName").value = "";
		document.getElementById("userAdd").value = "";
		document.getElementById("userPhone").value = "";
	}
}

$('#btnOrder').click(function() {
	
	if($('#orderName').val()==""){
		alert("이름을 입력해주세요");
		$('#orderName').focus();
		return false;
	}
	else if($('#userAdd').val()==""){
		alert("주소를 입력해 주세요");
		$('#userAdd').focus();
		return false;
	}
	else if($('#userPhone').val()==""){
		alert("휴대폰 번호를 입력해 주세요");
		$('#userPhone').focus();
		return false;
	}
	else if($("input[name=chk_info]:checked").length<1){
		alert("결제 수단을 선택해 주세요");
		$('#chk_info').focus();
		return false;
	}
	var b = <%= request.getParameter("proPrice") %>;
	var a = <%= request.getParameter("deliveryCost")%>;
	var total = a + b;
	
	var userId = "${user.userId}";
	var orderPrice = total;
	var price = price;
	
	$.ajax({
			url: "/order"
			, type: "post"
			, data: {
				"userId" : userId,
				"orderPrice" : orderPrice
			}
			,success: function(){
				var re = confirm("구매  완료 하시겠습니까??");
				if(re) {
					alert("구매 완료 되었습니다.");
					location.href="/cart";
				}else {
					return;
				}
			}
			, error: function() {
				console.log("error")
			}
		});
});

$('#btnBack').click(function(){
	history.back();
});

</script>

</body>
</html>



