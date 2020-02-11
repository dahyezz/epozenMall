<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style type="text/css">
.row {
	margin: 0;
}
.deprocom_hr{
	height: 1px;
	padding: 0;
	margin: 10px 0;
	border: 0;
	border-top: 1px dotted #9e9e9e;
	width: 100%
}
.procom-list {
	text-align: left;
	padding: 15px;
	background-color: #ffffff4a;
	margin-bottom: 15px;
}
.procom-list>p{
	font-size: 20px;
	font-weight: 600;
}
.procom-writer-info {
	box-sizing: inherit;
	float: right;
}
.contents {
	font-size: 18px;
}
</style>

<div class="procom-list">
	<p>상품평 ${procomCnt }개</p>
	<c:forEach items="${procomList}" var="procom">
	<div class="row">
		<span class="cell col1 contents">${procom.procomContents}</span>
		<div class="procom-writer-info">
			<span class="cell col2 userId">${procom.userId}</span><br>
			<span class="cell col2"><fmt:formatDate value="${procom.procomRegdate }" pattern="yyyy.MM.dd"/> </span>
		</div>
		<hr class="deprocom_hr">
	</div>
	</c:forEach>
</div>

<div class="text-center">
	<ul class="pagination pagination-sm">
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
					<a href="javascript:void()" onclick="getProcomPage(${paging.curPage-1})"><span>&lt;</span></a>
		   	 	</li>
				</c:if>
				<c:if test="${paging.curPage > 5 }">
				<li>
					<a href="javascript:void(0)" onclick="getProcomPage(${paging.curPage-5})"><span>&lt;</span></a>
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
					<a href="javascript:void(0)" onclick="getProcomPage(${i})">${i }</a>
				</li>
				</c:if>	
				
				<c:if test="${paging.curPage ne i}">
				<li>
					<a href="javascript:void(0)" onclick="getProcomPage(${i})">${i }</a>
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
				<a href="javascript:void(0)" onclick="getProcomPage(${paging.curPage+5})">
				<span>&gt;</span>
			</a>
			</li>
			</c:if>
	</ul>
</div>