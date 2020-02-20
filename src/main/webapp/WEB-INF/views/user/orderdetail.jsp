<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/views/main.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	$(document).on("click", "#writeBtn", function(){
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

	$(document).on("click", "#cancelBtn", function(){
		alert("준비중입니다.")
	});
});

</script>

<style type="text/css">
#left>ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #f1f1f1;
}
#left>ul>li a {
    display: block;
    color: #000;
    padding: 8px 16px;
/*     text-decoration: none; */
}
#left>ul>li>a:hover {
	text-decoration: none;
}
/* li a.active { */
/*     background-color: #4CAF50; */
/*     color: white; */
/* } */
#left>ul>li a:hover:not(.active) {
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
#datailTable>table {
	width: 100%;
	border-top: 1px solid;
	border-bottom: 1px solid;
}
#datailTable>thead, tbody {
	border-top: 1px solid;
	border-bottom: 1px solid;
}
#datailTable>table>thead {
	background-color: #ccc;
}
#datailTable>table>thead>tr>th {
	text-align: center;
}
#datailTable>table>tbody>tr>td {
	text-align: center;
}

#datailTable>table>tbody>tr {
	border-top: 1px solid #777;
	border-bottom: 1px solid #777;
}
#proname_a {
	text-decoration: none;
	color: black;
	font-weight: 600;
	font-size: 16px;
	vertical-align: top;
}
.footer {
	text-align: center;
}
#thumbnail {
	width: 168px;
	height: 168px;	
}

#proname_a {
	margin-left: 30px;
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
					<th style="width: 15%">주문일자</th>
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
							<img id="thumbnail" src="/image/default.PNG">	
						</c:if>
						<c:if test="${i.imgNo ne 0 }">
							<img id="thumbnail" src="/image/${i.imgNo }.png" >
						</c:if>
						</td>
						<td style="text-align: left; padding: 10px 0 10% 0;">
							<a id="proname_a" href="/prodetail?proNo=${i.proNo}">${i.proName }</a><br>
							<span style="margin-left: 30px;"><fmt:formatNumber value="${i.proPrice }" pattern="##,###원" /></span>
						</td>
						<td>${i.orderState }</td>
						<td>
						<c:if test="${i.orderState eq '배송준비중'}">
							<button class="btn" id="cancelBtn">취소요청</button>
						</c:if>
						<c:if test="${i.orderState eq '배송완료'}">
							<input type="hidden" id="writeProName" value="${i.proName }" />
							<input type="hidden" id="writeorderDate" value="<fmt:formatDate value='${i.orderDate }' pattern='yyyy/MM/dd HH:mm'/>" />
							<c:if test="${i.procomChk > 0 }">
								<button class="btn" id="writeBtn" value="${i.proNo }" disabled="disabled">리뷰쓰기</button>
							</c:if>
							<c:if test="${i.procomChk == 0 }">
								<button class="btn" id="writeBtn" value="${i.proNo }">리뷰쓰기</button>
							</c:if>
						</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
	
	</div>
</div>

<div class="footer">
	<div class="pagination-container padding-horizontal-small@s">
		<ul class="tasty pagination pagination-sm">
			<!-- 이전 페이지 -->
			<!-- 첫 페이지라면 버튼 동작 안 되게 만들기 -->
			<c:if test="${paging.curPage eq 1 }">
			<li class="disabled prev">
				<span>&lt;</span>
			</li>
			</c:if>
	
			<c:if test="${paging.curPage ne 1 }">
				<c:if test="${paging.curPage >= 1 && paging.curPage <=5 }">
				<li>
					<a href="/orderdetail?curPage=${paging.curPage-1 }"><span>&lt;</span></a>
		   	 	</li>
				</c:if>
				<c:if test="${paging.curPage > 5 }">
				<li>
					<a href="/orderdetail?curPage=${paging.curPage-5 }"><span>&lt;</span></a>
		   	 	</li>
				</c:if>
		    </c:if>
	
			<!-- 페이징 리스트 -->
			<c:forEach
		     begin="${paging.startPage }" end="${paging.endPage }"
		     var="i">
		
				<!-- 현재 보고 있는 페이지번호만 강조해주기 -->
				<c:if test="${paging.curPage eq i}">
				<li class="active">
					<a href="/orderdetail?curPage=${i }">${i }</a>
				</li>
				</c:if>	
				
				<c:if test="${paging.curPage ne i}">
				<li>
					<a href="/orderdetail?curPage=${i }">${i }</a>
				</li>
				</c:if>
						
		    </c:forEach>
			
			<!-- 다음 페이지 -->
			<c:if test="${paging.curPage eq paging.totalPage }">
			<li class="disabled">
				<span>&gt;</span>
			</li>
			</c:if>
	
			<c:if test="${paging.curPage ne paging.totalPage }">
			<li>
				<a href="/orderdetail?curPage=${paging.curPage+5 }">
				<span>&gt;</span>
			</a>
			</li>
			</c:if>
		</ul>	
	</div>
</div>

</body>
</html>