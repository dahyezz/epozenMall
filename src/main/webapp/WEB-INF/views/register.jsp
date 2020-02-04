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
	<form action="" method="post">
	
	<div class="form-group">
		<label class="control-label" for="userId">아이디</label>
		<input class="form-control" type="text" id="userId" name="userId" />	
	</div>
	<div class="form-group">
		<label class="control-label" for="userName">이름</label>
		<input class="form-control" type="text" id="userName" name="userName" />		
	</div>
	<div class="form-group">
		<label class="control-label" for="userPhone">휴대폰번호</label>
		<input class="form-control" type="text" id="userPhone" name="userPhone" />		
	</div>
	<div class="form-group">
		<label class="control-label" for="userPass">비밀번호</label>
		<input class="form-control" type="password" id="userPass" name="userPass" />		
	</div>
	<div class="form-group">
		<label class="control-label" for="userName">배송지</label>
		<input class="form-control" type="text" id="userAdd" name="userAdd" />		
	</div>
	<div class="form-group">
		<button class="btn" type="submit" id="submit">회원가입</button>
		<button class="cencle btn" type="button">뒤로가기</button>		
	</div>
	
	</form>
	
</div>

</body>
</html>