<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/views/main.jsp" />

<style>
.div>table{
	width:700px;
	margin-left:250px;
}

.tabA{
	hegint:20px;
	width:100px;
}
.btns{
	margin:5px;
}
.nav-tabs>li {
	text-align: center;
	width: 33.33%;
	background-color: #ccc;
}
.nav-tabs>li>a {
	text-decoration: none;
	color: black;
	font-weight: 500;
	margin-right: 0;
}
.tab-content {
	margin-top: 20px;
	padding: 10px;
}
#tab_detail {
	padding: 15px;
}
</style>

<div class="container">

	<div class="div">
	<form method="post" name="form" action="/incart">
	  <table id="table">
	  	<tr>
	  		<td rowspan="5">
<!-- 	  		<img id="thumbnail" src="/image/default.PNG" width="250px" height="200px" >  -->
			<img style="margin: 20px;" id="thumbnail" src="/image/${detail.imgNo }.png" >
			</td>
	  	</tr>	
	  	
	  	<tr>
	  		<td class="tabA" >상품명 </td>
	  		<td class="tabB">${detail.proName}</td>
		</tr>	  
		<tr>
			<td class="tabA" >가격</td>
	  		<td >${detail.proPrice}</td>
		</tr>
		
		<tr>

			<td>
					<select name="amount"id="cartAmount" >
						<c:forEach begin="1" end="5" var="i">
							<option value="${i}">${i}</option> 
						</c:forEach>
					</select>
					&nbsp;개</td>
			<td><input type="hidden" name="proNo" id="proNo" value="${detail.proNo}"> </td>
			<td><input type="hidden" name="cartPrice" id="cartPrice" value="${detail.proPrice}"> </td> 
			<td><input type="hidden" name="orderState" id="orderState" value="중비중"> </td>
			<td><input type="hidden" name="orderNo" id="orderNo"> </td>
			
			<td><input type="button" id="btnIncart" class="btn" value="장바구니 담기"> </td>
			<!-- <td><button type="button" id="btnBuy" class="btns">바로 구매</button>  </td> -->
		</tr>
		</table>
		</form>
    
     <!-- Nav tabs -->
     <div>
		<ul class="nav nav-tabs" role="tablist">
		  <li role="presentation"><a href="javavscript:void(0)" onclick="select('detail')" >상품 상세</a></li>
		  <li role="presentation" class="deprocom"><a href="javascript:void(0)" onclick="select('procom')">상품 평</a></li>
		  <li role="presentation"><a href="javascript:void(0)" onclick="select('comment')">댓글</a></li>
		</ul>
 	</div>
 
	<!-- Tab panes -->
	<div class="tab-content">
	  	<div class="tab" id="tab_detail">
		  	<p>${detail.proDetail}</p>
		  	
		  	<p>상품 상세 입니다
		  	네이버쇼핑과 쇼핑몰에서 제공하는 상품정보와 가격은 일치하지 않을 수 있습니다.

			네이버쇼핑에 서비스중인 상품의 가격은 쿠폰이 적용된 가격이며,
			쇼핑몰 페이지에서 쿠폰을 다운 받으셔야 해당 가격으로 구매하실 수 있습니다.
			
			상품의 배송비는 지역별, 구매 조건별 추가 요금이 발생할 수 있으며, 설치가 필요한 상품은 설치비가
			별도 부과될 수 있으므로 해당 쇼핑몰에서 상품정보 및 가격을 반드시 확인하여 주시기 바랍니다.
			
			네이버(주)는 고객이 해당 쇼핑몰에서 제품을 구입하신 경우 상품의 품질이나
			쇼핑몰의 신뢰도에 대해서는 보증하지 않습니다.
			
			네이버(주)는 네이버쇼핑에서 제공된 정보에 대해서 별도의 책임을 지지 않습니다.
			
			네이버(주)는 고객이 쇼핑몰을 통해 구매한 상품에 대해 보증하거나 별도의 책임을 지지
			않으며, 상품의 주문, 결제, 배송, 교환, 환불 등 상품판매와 관련한 일체의 책임은 해당 쇼핑몰에 있습니다.
			
			쇼핑몰을 통한 상품 구매 시, 구매안전 서비스(에스크로, 소비자피해보상보험, 일반 보증 등)를 이용하지
			않고 결제하는 경우, 고객에게 상품 미배송 등으로 인한 피해가 발생할 수 있습니다.
			
			고객께서는 상품 구매 전, 해당 쇼핑몰의 구매안전 서비스 절차를 반드시 확인해 주시기 바랍니다.네이버쇼핑과 쇼핑몰에서 제공하는 상품정보와 가격은 일치하지 않을 수 있습니다.		
			</p> 
		</div>

		<div  class="tab" id="tab_procom">
		</div>
		<div  class="tab" id="tab_comment">
		</div>
		
	</div>
</div>
</div>

<script>

$(document).ready(function(){

	select('detail');	

	/* 댓글 글자 수 제한 */
	$(document).on('keyup','#commentcontent', function(){
		var content = $(this).val();
		
		if(content.length>=500){
			$(this).val(content.substring(0,500));
			$('#counter').html("최대500자까지 입력가능합니다.");
// 			$('#cmtWrite').attr('disabled', true);
		} else {
// 			$('#cmtWrite').attr('disabled', false);	
			$('#counter').html("");
		}
		
	});
	
	
	/* 댓글 작성 */
	$(document).on('click', '#cmtWrite', function(){
		
		if(!"${login }"){
			alert("로그인이 필요합니다.")
			location.href="/login";
			return;
		}
	
		var userId = "${userId }";
		var proNo = "${detail.proNo }";
		var comContents = $('#commentcontent').val();
		
		$.ajax({
			url: "/comment"
			, type: "post"
			, data: {
				"userId" : userId,
				"proNo" : proNo,
				"comContents" : comContents,
			}
			,success: function(){
				select('comment');
			}
			, error: function() {
// 				console.log("error")
				alert("다시 시도해주세요")
			}
		});
	});
		

	var commentno_re;
	/* 대댓글 작성 폼 띄우기 */
	$('#tab_comment').on("click", ".recomment",function(){
		
		$('#recommentdiv').remove();
		if(commentno_re == $(this).parent().parent().attr("data-commentno")){
			commentno_re = 0;
			return false;
		}
		commentno_re = $(this).parent().parent().attr("data-commentno");
		$(this).parent().parent().append(
			"<div id='recommentdiv'><a href='javascript:void(0)' id='recommentBtn' >입력</a>"
			+ "<textarea class='form-control' id='recommentcontent' rows='2' cols='30'></textarea></div>"		
		);
	
	});
	
	/* 대댓글 작성 */
	$('#tab_comment').on("click", "#recommentBtn", function(){

		//작성자, 상품번호, parent 댓글 번호
		var userId = "${userId }";
		var proNo = "${detail.proNo }";
		var comDepth = $(this).parent().parent().attr("data-commentno");
		
		//댓글 내용
		
		var comContents = $('#recommentcontent').val();
		
		//대댓글 입력 ajax
		$.ajax({
			url: "/comment"
			, type: "post"
			, data: {
				"userId" : userId,
				"proNo" : proNo,
				"comContents" : comContents,
				"comDepth" : comDepth
			}
			,success: function(){
				select('comment',1);
			}
			, error: function() {
// 				console.log("error");
				alert("다시 시도해주세요")
			}
		});
		
	});

});
/* 장바구니 담기 버튼 */
$(document).on('click', '#btnIncart', function(){
	
	if(!"${login }"){
		alert("로그인이 필요합니다.")
		location.href="/login";
		return;
	}
	var proNo = "${detail.proNo }";
	var cartPrice = "${detail.proPrice}";
	var cartAmount =  $('#cartAmount').val();
	
	$.ajax({
		url: "/incart"
		, type: "post"
		, data: {
			"cartPrice" : cartPrice,
			"proNo" : proNo,
			"cartAmount" : cartAmount
		
		}
		,success: function(){
			var re = confirm("장바구니로 이동하시겠습니까?");
			if(re) {
				location.href="/cart";
			}else {
				return;
			}
			
		}
		, error: function() {
// 			console.log("error")
			alert("다시 시도해주세요")
		}
	});
});
var paging;

function select(board) {
	if(board=='detail'){
		$('.tab').hide();
		document.getElementById('tab_detail').style.display="block";
	}
	if(board=='procom'){
		getProcomPage(1);
	}
	if(board=='comment'){
		getCommentPage(1);
	}
}

function getProcomPage(curPage){
	$.ajax({
		type: "get"
		, url: "/deprocom"
		, data: {
			"proNo" : ${detail.proNo }, 
			"curPage" : curPage
		}
		, success: function(data){
			$('.tab').hide();
			document.getElementById('tab_procom').style.display="block";
			document.getElementById('tab_procom').innerHTML = data;
		}
		, error: function(data) {
// 			console.log(data);
			alert("다시 시도해주세요")
		}
	});
}
function getCommentPage(curPage){
	
	$.ajax({
		type: "get"
		, url: "/comment"
		, data: {
			"proNo" : ${detail.proNo }, 
			"curPage" : curPage
		}
		, success: function(data){
			$('.tab').hide();
			document.getElementById('tab_comment').style.display="block";
			document.getElementById('tab_comment').innerHTML = data;
		}
		, error: function(data) {
			console.log(data);
			alert("다시 시도해주세요")
		}
	});
}
/* 구매하기 */
$(document).on('click', '#btnBuy', function(){
	
	if(!"${login }"){
		alert("로그인이 필요합니다.")
		location.href="/login";
		return;
	}
	
	var orderPrice = "${detail.proPrice}";
	var cartAmount =  $('#cartAmount').val();
	var orderState = $('#orderState').val();

	
	$.ajax({
		url: "/order"
		, type: "post"
		, data: {
		
			"proPrice" : orderPrice,
			"cartAmount" : cartAmount,
			"orderState" : orderState
		}
		,success: function(){
			var re = confirm("구매 하시겠습니까??");
			if(re) {
				location.href="/order";
			}else {
				return;
			}
		}
		, error: function() {
			console.log("error")
			alert("다시 시도해주세요")
		}
	});
});
</script>
		

</body>
</html>