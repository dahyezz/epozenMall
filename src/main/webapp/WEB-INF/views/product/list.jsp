
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<c:import url="/WEB-INF/views/main.jsp" />

<style type="text/css">
.content {
	margin: 3%;
}

.content > select {
	margin: 0 0 0 20px;
}

.list {
	margin: 20px;
}

.list > table {
	width: 100%;
	border-collapse: collapse;
}

.list > table > thead {
	text-align: center;
	background-color: #b5abab;
}
.list > table>thead>tr>th {
	text-align: center;
	padding: 20px;
}
.list > table > tbody {
/* 	background-color: #ccc; */
}
.list > table > tbody > tr {
	height: 30px;
	border-bottom: 1px solid #ccc;
}

.footer {
	width: 100%;
	text-align: center;
	margin-bottom: 20px;
}
.pagination-container {
	display: inline-block;
	float: center;
}
.chat {
	display: inline-block;
	float: right;
}

</style>

<div class="content">

	<select name="cate">
		<option value="all" selected="selected">전체</option>
		<option value="fashion">패션의류</option>
		<option value="goods">생활용품</option>
		<option value="cosmetic">화장품</option>
	</select>
	
	<div class="list">
		<table>
			<thead>
				<tr>
					<th style="width: 20%">상품사진</th>
					<th>상품명</th>
					<th style="width: 15%">가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${proList }" var="i">
					<tr>
						<td>
						<c:if test="${i.imgNo eq 0 }">
							<img id="thumbnail" src="/image/default.png">	
					</c:if>
					</td>
					<td><a href="/prodetail?proNo=${i.proNo}">${i.proName }</a></td>	
					<td style="text-align: right"><fmt:formatNumber value="${i.proPrice }" pattern="##,###원"/></td>	
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
					<a href="/list?curPage=${paging.curPage-1 }"><span>&lt;</span></a>
		   	 	</li>
				</c:if>
				<c:if test="${paging.curPage > 5 }">
				<li>
					<a href="/list?curPage=${paging.curPage-5 }"><span>&lt;</span></a>
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
					<a href="/list?curPage=${i }">${i }</a>
				</li>
				</c:if>	
				
				<c:if test="${paging.curPage ne i}">
				<li>
					<a href="/list?curPage=${i }">${i }</a>
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
				<a href="/list?curPage=${paging.curPage+5 }">
				<span>&gt;</span>
			</a>
			</li>
			</c:if>
		</ul>	
	</div>

	<div class="chat">
		<a href="/ "><img src="/image/chat.PNG" /></a>
	</div>
</div>
</body>
