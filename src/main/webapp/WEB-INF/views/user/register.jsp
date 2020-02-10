<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<c:import url="/WEB-INF/views/main.jsp" />

<style type="text/css">
.regi_div{
	width:500px;
	height:600px;
	margin-left:750px;
	margin-top:50px;
	
}
td{
	padding:20px 10px 10px 25px;
}
.agree{
	text-align:center;
	padding:10px;
}
.buttons{
	text-align:center;
	padding:10px;
}

</style>

<div class="containser_regi">
	<div class="regi_div">
		<form method="post" name="form" action="/registerProc" >
		<table>
			<tr>
				<td class="tabAA">아이디</td>
				<td class="tabBB"> <input type="text" name="userId" id="userId"> </td>
				<td> <input type="button" id="userIdcheck" value="중복 확인" onClick="fn_idChk()"> </td>
			</tr>
			<tr>
				<td class="tabAA">이름</td>
				<td class="tabBB"> <input type="text" name="userName" id="userName"> </td>
				
			</tr>
			<tr>
				<td class="tabAA">휴대폰 번호</td>
				<td class="tabBB"> <input type="text" name="userPhone" id="userPhone"> </td>
			</tr>
			<tr>
				<td rowspan="2" class="tabAA">비밀번호</td>
				<td class="tabBB"> <input type="password" name="userPassword" id="userPassword" placeholder="비밀번호 "> </td>
			</tr>
			<tr>
				<td class="tabBB"> <input type="password" name="userPasswordCheck" id="userPasswordCheck" placeholder="비밀번호 확인"> </td>
				<td><span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
	   			 <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span></td>
			</tr>
				
			<tr>
				<td class="tabAA">배송지</td>
				<td class="tabBB"> <textarea cols="23" rows="5" name="userAdd" id="userAdd"></textarea> </td>
			</tr>
		</table>
		
		<div class="agree">
			<input type="checkbox" name="agree" >이용약관 및 개인정보취급 동의
		</div>
		<div class="buttons">
			<button type="button" onclick="check()">회원가입</button>
	    </form>
			<button type="button" id="cancle" style="margin-left:15px;">뒤로가기</button>		
		
		</div>
	</div>
</div>	


<script>

//아이디 확인
function fn_idChk(){
	$.ajax({url : "/idChk",
		type : "post",
		dataType : "json",
		data : {"userId" : $("#userId").val()},
	success : function(data){
		if(data == 1){
			alert("중복된 아이디입니다.");
		}else if(data == 0){
			$("#idChk").attr("value", "Y");
		alert("사용가능한 아이디입니다.");
		}
	}
	})
}
 // 비밀 번호 확인
$('#userPasswordCheck').focusout(function () {
    var pwd1 = $("#userPassword").val();
    var pwd2 = $("#userPasswordCheck").val();
    if (pwd1 != "" || pwd2 != "") {
        if (pwd1 == pwd2) {
            $("#alert-success").css('display', 'inline-block');
            $("#alert-danger").css('display', 'none');
        } else {
            $("#alert-success").css('display', 'none');
            $("#alert-danger").css('display', 'inline-block');
        }
    }
});


// 회원가입 버튼 클릭시
function check(){	
	if(form.userId.value == ""){
		alert("아이디를 입력해주세요.");
		form.userId.focus();
		return false;
	} 
	else if(form.userName.value == ""){
		alert("이름을 입력 해주세요.");
		form.userName.focus();
		return false;
	 }
	else if(form.userPhone.value == ""){
		alert("휴대폰 번호를 입력해주세요.");
		form.userPhone.focus();
		return false;
	}
	else if(form.userPassword.value == ""){
		alert("비밀번호를 입력해주세요");
		form.userPassword.focus();
		return false;
	}
	else if(form.userPasswordCheck.value == ""){
		alert("비밀번호 확인을 해주세요");
		form.userPasswordCheck.focus();
		return false;
	}
	else if(form.agree.checked ==""){
		alert("약관에 동의해주세요.");
		form.checkag.focus();
		return false;
	}
	 else 
		document.form.submit();
	
}

$('#cancle').click(function() {
	location.href="/login"
});

</script>

</body>
</html>