<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/views/main.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	var passStatus;
	var userPassword = $('#userPassword').val();
	$('#backBtn').click(function() {
		history.back();
	});
	
	$('#exitBtn').click(function() {
		var curPass = $('#curPass').val();
		
		if(curPass == userPassword){
			
			//form 생성하여 post 방식 전송
			var form = document.createElement("form");
			form.setAttribute("method","Post");
			form.setAttribute("action", "/withdrawal");

			document.body.appendChild(form);
			form.submit();

		} else {
			alert("비밀번호가 일치하지 않습니다");
			document.getElementById('curPass').value="";
		}

	});	
	
	$('#newPassCheck').keyup(function() {
		var newPass = $('#newPass').val();
		var newPassCheck = $('#newPassCheck').val();
		
		if(newPass!='' && newPassCheck!=''){
			if(newPass == newPassCheck){
				document.getElementById('check').innerHTML = "비밀번호가 일치합니다";
				document.getElementById('check').style.color="blue"
					$('#modifyBtn').attr('disabled', false);
			} else {
				document.getElementById('check').innerHTML = "비밀번호가 일치하지 않습니다";
				document.getElementById('check').style.color="red";
				$('#modifyBtn').attr('disabled', true);
			}
		}
	});
	
	$('#modifyBtn').click(function() {		
		var userId = $('#userId').val();
		
		var curPass = $('#curPass').val(); //현재 비밀번호 체크
		var newPass = $('#newPass').val();
	
		
		var curPhone = "${user.userPhone }"; 
		var newPhone = $('#phone').val();
		
		var curAdd = "${user.userAdd }";
		var newAdd = $('#add').val();		
				
		if(curPass == ""){
			alert("비밀번호를 입력하세요")
		} else if(curPass == userPassword){
			
			if(newPass!=""){
				curPass = newPass;	
			}
			
			//form 생성하여 post 방식 전송
			var form = document.createElement("form");
			form.setAttribute("method","Post");
			form.setAttribute("action", "/information");

			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type","hidden");
			hiddenField.setAttribute("name","userId");
			hiddenField.setAttribute("value",userId);
			form.appendChild(hiddenField);
			
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type","hidden");
			hiddenField.setAttribute("name","userPhone");
			hiddenField.setAttribute("value",newPhone);
			form.appendChild(hiddenField);
			
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type","hidden");
			hiddenField.setAttribute("name","userAdd");
			hiddenField.setAttribute("value",newAdd);
			form.appendChild(hiddenField);
			
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type","hidden");
			hiddenField.setAttribute("name","userPassword");
			hiddenField.setAttribute("value",curPass);
			form.appendChild(hiddenField);
			
// 			if(curPhone != newPhone) { //핸드폰 번호 변경 시
// 				hiddenField = document.createElement("input");
// 				hiddenField.setAttribute("type","hidden");
// 				hiddenField.setAttribute("name","userPhone");
// 				hiddenField.setAttribute("value",newPhone);
// 				form.appendChild(hiddenField);
// 			}
			
// 			if(curAdd != newAdd){ //주소 변경 시
// 				hiddenField = document.createElement("input");
// 				hiddenField.setAttribute("type","hidden");
// 				hiddenField.setAttribute("name","userAdd");
// 				hiddenField.setAttribute("value",newAdd);
// 				form.appendChild(hiddenField);
// 			}
			
// 			if(newPass!=""){
// 				curPass = newPass;	
// 			}
// 			if(newPass != "") { //패스워드 변경시
// 				hiddenField = document.createElement("input");
// 				hiddenField.setAttribute("type","hidden");
// 				hiddenField.setAttribute("name","userPassword");
// 				hiddenField.setAttribute("value",curPass);
// 				form.appendChild(hiddenField);
// 			}
			
			document.body.appendChild(form);
			form.submit();
			

		} else {
			alert("현재 비밀번호를 확인해주세요");
			document.getElementById('curPass').value="";
		}

	});	
	
});
</script>

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
.btnDiv{
	display: inline-block;
}
.exitDiv {
	display: inline-block; 
	float: right;
}
table {
	border-collapse: collapse;
	margin-bottom: 20px;
}
th {
	width: 30%;
	background-color: #ccc;
	height: 50px;
}
td {
	width: 70%;
	padding: 10px 10px 10px 20px;
}
</style>

<input type="hidden" id="userPassword" value=${user.userPassword } />
<input type="hidden" id="userId" value=${user.userId } />


<div class="orderContent">
	<div id="left">
		<ul>
			<li><a href="/orderdetail">주문목록/배송조회</a></li>
			<li><a  class="active" href="/information">개인정보수정/확인</a></li>
		</ul>
	</div>
	
	<div id="detailContent">
		<p>개인정보수정/확인</p>
		<hr>
		
		<div id="datailTable">
			<table>
				<tr>
					<th>아이디</th>
					<td>${user.userId }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${user.userName }</td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td><textarea rows="1" name="phone" id="phone">${user.userPhone }</textarea></td>
				</tr>
				<tr>
					<th rowspan="4">비밀번호변경</th>
						<td><label for="curPass">현재 비밀번호 </label></td>
						<td><input type="password" name="curPass" id="curPass" placeholder="현재 비밀번호" /></td>
				</tr>
				<tr>
					<td><label for="newPass">신규 비밀번호</label></td>
					<td><input type="password" name="newPass" id="newPass" placeholder="새로운 비밀번호 입력" /></td>
				</tr>
				<tr>
					<td><label for="newPassCheck">신규 비밀번호 확인</label></td>
					<td><input type="password" name="newPassCheck" id="newPassCheck" placeholder="새로운 비밀번호 재입력" /></td>
				</tr>
				<tr>
					<td></td>
					<td><span id="check"></span></td>
				</tr>
				<tr>
					<th>배송지</th>
					<td><textarea rows="3" cols="50" id="add">${user.userAdd }</textarea></td>
				</tr>
			</table>
			<div class="btnDiv">
				<button id="modifyBtn">정보수정</button>
				<button id="backBtn">뒤로가기</button>
			</div>
			<div class="exitDiv">
				<p>탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요</p>
				<button id="exitBtn">회원탈퇴</button>
			</div>
		</div>
	
	</div>
</div>

</body>
</html>