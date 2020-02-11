<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/views/main.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$('#backBtn').click(function() {
		history.back();
	});
	
	$('#writeBtn').click(function() {
		var content = $('#proComcontent').val();
		
		var $form = $("<form>")
		.attr("action","/procom")
		.attr("method", "post")
		.append(
			$("<input>")
					.attr("type","hidden")
					.attr("name", "proNo")
					.attr("value", ${product.proNo })
		)
		.append(
				$("<input>")
						.attr("type","hidden")
						.attr("name", "procomContents")
						.attr("value", content)
			);

		$(document.body).append($form);
		$form.submit();
		
	});
});
</script>

<style type="text/css">
.procomContent {
	width: 80%;
	margin: auto;
}
.procomhead>p {
	margin: 0 0 10px 0;
	font-size: 30px;
	font-weight: 600;
}
hr {
	margin: 10px 0 10px 0;
	border: 0;
	border-top: 4px solid #eee;
}
.productInfo, .content_input {
	padding: 10px 0 10px 0;
}
.productInfo>p {
	font-size: 14px;
}
.content_input>p{
	display: inline-block;
	float: left;
}
.content_input>textarea {
	margin-left: 60px;
}
.btnGroup {
	text-align: center;
}
</style>

<div class="procomContent">

	<div class="procomhead">
		<p>구매후기</p>
	</div>
		<hr>
		
	<div class="productInfo">
		<p>${product.proName }</p>
		<p><fmt:formatDate value="${product.orderDate }" pattern="yyyy.MM.dd"/> 배송완료</p>
	</div>
		<hr>
		
	<div class="content_input">
		<p>구매후기</p>
		<textarea id="proComcontent" rows="20" cols="100" placeholder="자세한 구매후기는 고객의 구매에 많은 도움이 됩니다."></textarea>
	</div>
		<hr>
		
	<div>
		<p>사진 첨부</p>
		<input type="file" disabled="disabled"/>
	</div>
		<hr>
		
	<div class='btnGroup'>
		<button class="btn" id="writeBtn">등록하기</button>
		<button class="btn" id="backBtn">뒤로가기</button>
	</div>

</div>

</body>
</html>