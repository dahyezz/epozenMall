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
</style>

<div class="procomContent">

	<div>
		<p>구매후기</p>
		<hr>	
	</div>
	<div>
		<p>${product.proName }</p>
		<p><fmt:formatDate value="${product.orderDate }" pattern="yyyy.MM.dd"/> 배송완료</p>
		<hr>
	</div>
	<div>
		<p>구매후기</p>
		<textarea id="proComcontent" rows="20" cols="100" placeholder="자세한 구매후기는 고객의 구매에 많은 도움이 됩니다."></textarea>
		<hr>
	</div>
	<div>
		<p>사진 첨부</p>
		<input type="file" disabled="disabled"/>
		<hr>
	</div>
	<div>
		<button id="writeBtn">등록하기</button>
		<button id="backBtn">뒤로가기</button>
	</div>

</div>

</body>
</html>