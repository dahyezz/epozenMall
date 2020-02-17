<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style type="text/css">
.comment-list{
	text-align: left;
	padding: 15px;
	background-color: #ffffff4a;
	margin-bottom: 15px;
}
.comment-writer-info {
/* 	display: inline-block; */
	box-sizing: inherit;
	vertical-align: -webkit-baseline-middle;
/* 	width: calc(100% - 40px); */
}
.comment-clearfix {
	width: 25px;
	display: inline-block;
	font-size: 12px;
	color: #ff7473;
	text-align: right;
	margin: 0 10px 30px 0;
	float: left;
}

.contents {
	font-size: 18px;
}
.comment-clearfix{
	width: 25px;
	height: 25px;
	float: left;
	margin-right: 10px;
	display: inline-block;
	font-size: 12px;
	color: #ff7473;
	text-align: right;
}
.comment_hr {
	height: 1px;
	padding: 0;
	margin: 10px 0;
	border: 0;
	border-top: 1px dotted #9e9e9e;
}
.comment-content {
/*  	margin-left: 30px;  */
}
.recomment_div {
	display: inline-block;
	float: right;
}
recomment_div>a{
	text-decoration: none;
	color: black;
}
#recommentdiv {
	margin-bottom: 10px;
	background-color: #ccc;
	padding: 10px;
}

.writeCmt {
	padding: 10px;
	text-align: center;
	margin-bottom: 20px;
}
.comment-list>p{
	font-size: 20px;
	font-weight: 600;
}
.recomment {
	float: right;
	margin-left: 10px;
}
.delete {
	float: right;
}
#cmtWrite {
	margin: 0 0 50px 20px;
}
</style>

<div class="comment-list">
	<p>댓글 ${commentCnt }개</p>
	<c:forEach items="${commentList}" var="c">
		
		<div id="commentno${c.comNo }" data-commentno="${c.comNo }" data-depth="${c.comDepth }" data-seq="${c.comSeq }" class="comment">
			<c:if test="${c.comDepth ne 0 }"><div class="comment-clearfix">&nbsp;&nbsp;&nbsp;ㄴ</div></c:if>
		
			<div class="comment-writer-info">
				<span class="cell col1">${c.userId}</span><br>
				<span class="cell col2"><fmt:formatDate value="${c.comRegdate}" pattern="yyyy-MM-dd"/></span>
				<c:if test="${c.comDepth eq 0 && login }"><a href="javascript:void(0)" class="recomment">답글작성</a></c:if>
				<c:if test="${c.userId eq userId }"><a href="javascript:void(0)" class="delete">삭제</a></c:if>
			</div>


			<div class="comment-content">
				<span class="cell col2 contents">${c.comContents }</span>
			</div>
			
			<hr class="comment_hr">
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
					<a href="javascript:void()" onclick="getCommentPage(${paging.curPage-1})"><span>&lt;</span></a>
		   	 	</li>
				</c:if>
				<c:if test="${paging.curPage > 5 }">
				<li>
					<a href="javascript:void(0)" onclick="getCommentPage(${paging.curPage-5})"><span>&lt;</span></a>
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
					<a href="javascript:void(0)" onclick="getCommentPage(${i})">${i }</a>
				</li>
				</c:if>	
				
				<c:if test="${paging.curPage ne i}">
				<li>
					<a href="javascript:void(0)" onclick="getCommentPage(${i})">${i }</a>
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
				<a href="javascript:void(0)" onclick="getCommentPage(${paging.curPage+5})">
				<span>&gt;</span>
			</a>
			</li>
			</c:if>
	</ul>
</div>

<div class="writeCmt" id="writeCmt">
	<p style="color:red; margin:0;" id="counter"></p>
	<textarea id="commentcontent" cols="100" rows="3"></textarea>
	<button class="btn btn-sm" id="cmtWrite">등록</button>
<!-- 			<input id="commentBtn" type="button" value="등록"> -->
</div>
