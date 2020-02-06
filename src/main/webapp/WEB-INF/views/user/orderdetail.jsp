<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/views/main.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	$('#writeBtn').click(function(){
		
		var proNo = $(this).val();
		var proName = $('#writeProName').val();
		var orderDate = $('#writeorderDate').val();
		
		var $form = $("<form>")
		.attr("action","/procom")
		.attr("method", "get")
		.append(
			$("<input>")
					.attr("type","hidden")
					.attr("name", "proNo")
					.attr("value", proNo)
		)
		.append(
				$("<input>")
						.attr("type","hidden")
						.attr("name", "proName")
						.attr("value", proName)
			)
		.append(
				$("<input>")
						.attr("type","hidden")
						.attr("name", "orderDate")
						.attr("value", orderDate)
			);
		$(document.body).append($form);
		$form.submit();

	});
	
	$('#cancelBtn').click(function(){
		alert("준비중입니다.")
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
				<c:forEach items="${orderList }" var="i">
					<tr>
						<td>
						<fmt:formatDate value="${i.orderDate }" pattern="yyyy/MM/dd"/>
						</td>
						<td>
						<c:if test="${i.imgNo eq 0 }">
							<img id="thumbnail" src="/image/default.png">	
						</c:if>
						</td>
						<td><a href="/prodetail?proNo=${i.proNo}">${i.proName }</a></td>
						<td>${i.orderState }</td>
						<td>
						<c:if test="${i.orderState eq '배송준비중'}">
							<button id="cancelBtn">취소요청</button>
						</c:if>
						<c:if test="${i.orderState eq '배송완료'}">
							<input type="hidden" id="writeProName" value="${i.proName }" />
							<input type="hidden" id="writeorderDate" value="<fmt:formatDate value='${i.orderDate }' pattern='yyyy/MM/dd'/>" />
							<button id="writeBtn" value="${i.proNo }">리뷰쓰기</button>
						</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
	
	</div>
</div>
</body>
</html>