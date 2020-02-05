<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<c:import url="/WEB-INF/views/main.jsp" />

<div class="container">
	<form action="/registerProc" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td> <input type="text" name="userId" id="userId"> </td>
			<td> <input type="button" id="userIdcheck" value="중복 확인"> </td>
		</tr>
		<tr>
			<td>이름</td>
			<td> <input type="text" name="userName" > </td>
		</tr>
		<tr>
			<td>휴대폰 번호</td>
			<td> <input type="text" name="userPhone" > </td>
		</tr>
		<tr>
			<td rowspan="2">비밀번호</td>
			<td> <input type="password" name="userPassword" id="userPassword" placeholder="비밀번호 "> </td>
		</tr>
		<tr>
			<td> <input type="password" name="userPasswordCheck" id="userPasswordCheck" placeholder="비밀번호 확인"> </td>
			<td><span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
   			 <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span></td>
		</tr>
			
		<tr>
			<td>배송지</td>
			<td> <input type="text" name="userAdd" > </td>
		</tr>
	</table>
	
	<div class="form-group">
		<button class="btn" type="submit" id="submit">회원가입</button>
		<button class="cencle btn" type="button">뒤로가기</button>		
	</div>
	
	</form>
	
</div>

<script>
//아이디 중복 확인 후 아이디 재입력
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
var idck = 0;
$(function() {
    //idck 버튼을 클릭했을 때 
    $("#userIdcheck").click(function() {
        
        //userid 를 param.
        var userid =  $("#userId").val(); 
        
        $.ajax({
            async: true,
            type : 'POST',
            data : userid,
            url : "/idcheck",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#divInputId").addClass("has-error")
                    $("#divInputId").removeClass("has-success")
                    $("#userId").focus();
                } else {
                    alert("사용가능한 아이디 입니다.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#divInputId").addClass("has-success")
                    $("#divInputId").removeClass("has-error")
                    $("#userpwd").focus();
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                    
                }
            },
            error : function(error) {
                alert("error : " + error);
            }
            
            }
        });
    });
});

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

</script>

</body>
</html>