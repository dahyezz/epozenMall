<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/views/main.jsp" />

<script type="text/javascript">
$(document).ready(function() {
		
	var total = $("#total").val();

	/* model로 넘겨준 cartList받기 */
	var size = ${cartList.size() }; //checkbox제어 하기 위해 size 체크
	
	/* 계속 쇼핑하기 버튼  동작 */
	$('#shopBtn').click(function() {
		location.href="/list";
	});
	
	var targets="";
	/* 구매하기 버튼 동작 */
	$('#buyBtn').click(function() {
		targets="";
		// 선택된 체크 박스
		var $checkboxes = $("input:checkbox[name=orderChk]:checked");
// 		console.log($checkboxes.parent().parent().children().eq(1).children().val())
		
		// 체크된 대상들을 map으로 만들기
		var map = $checkboxes.map(function() {
			return $(this).parent().parent().children().eq(1).children().val();
		});
		var names = map.get().join(",");
		console.log(names);
		
		var rows = $('#cartInfo tr');
		
		$(rows).each(function(idx){
			//idx!=0 : idx=0인 경우는 th태그임
			if(idx!=0 && $(this).children().children().eq(0).prop('checked')){ //체크된 항목들만 계산
				var $target = $(rows[idx]).find('td').eq(5).children();

				targets = targets + $target.val() + ",";
			}
			
		});	
		console.log(targets)
		
		if(total >= 50000)
			deliveryCost = 0;
		else
			deliveryCost = 2500;
		location.href ="/order?proPrice="+total+"&deliveryCost="+deliveryCost+"&products="+names+"&price="+targets;	
	});
	
	/* 삭제 버튼 동작  */
	$('#deleteBtn').click(function() {
		
		// 선택된 체크 박스
		var $checkboxes = $("input:checkbox[name=orderChk]:checked");
		
		// 체크된 대상들을 map으로 만들기
		var map = $checkboxes.map(function() {
			return $(this).val();
		});
		var names = map.get().join(",");
		
		
		
		$.ajax({
			url: "/cartDelete"
			, type: "post"
			, dataType: "html"
			, data : {"names": names}
			, success : function() {
				// 삭제 후 해당 리스트 삭제
				for(var i=0; i<map.length; i++){
					$('#'+map.get(i)).remove();
				}
			}
			, error : function() {
				alert("관리자에게 문의하세요")
// 				return;
			}
		})

	});

	
	/* 한개의 체크박스 선택 해제 시 전체선택 체크박스도 해제 */
	$(".orderChk").click(function(){
		if($("input[name=orderChk]:checked").length==size){
			$('#checkAllOrders').prop("checked", true);
		} else {
			$('#checkAllOrders').prop("checked", false);
		}
	});
		
	/* 체크된 행들의 가격 처리 */
	total *= 1;
	var deliveryCost = 0;
	
	proStatus(deliveryCost, total);

	/* 체크박스 체크/해제 시 총 주문금액 계산 */
	$("input:checkbox").on('click', function(){
		var rows = $('#cartInfo tr');
		total = 0; //전체금액 초기화

		if($(this).prop('checked')){ //체크 시
			$(rows).each(function(idx){
				//idx!=0 : idx=0인 경우는 th태그임
				if(idx!=0 && $(this).children().children().eq(0).prop('checked')){ //체크된 항목들만 계산
					var eachPrice = $(rows[idx]).find('td').eq(4).text();
					eachPrice *= 1;
					total += eachPrice;
				}
			});	
		} else { //체크 해제 시
			$(rows).each(function(idx){
				//체크된 항목들만 계산
				if(idx!=0 && $(this).children().children().eq(0).prop('checked')){
					var eachPrice = $(rows[idx]).find('td').eq(4).text();
					eachPrice *= 1;
					total += eachPrice;
				}
			});
		}
		
		proStatus(deliveryCost, total);

	});
	
	/* 수량 선택 변경 시 가격 정보 변경 */
	var select_amt = $("[id^='amount_']");
	select_amt.on("change", function(){
		var selected = $(this).val();
		
		$(this).parent().parent().children().eq(4).html(selected); //가격정보에 해당 데이터 삽입
		
		//각 상품별 배송비 제어
		var dCost = $(this).parent().parent().children().eq(5).text(); 
		if(selected>50000){
			$(this).parent().parent().children().eq(6).html("0원");
		} else {
			$(this).parent().parent().children().eq(6).html("2,500원");
		}
		
		/* tr값 변경 시 */
		$('#cartInfo tr td').change(function(){
			var rows = $('#cartInfo tr');
			total = 0;
			$(rows).each(function(idx){
				if(idx!=0  && $(this).children().children().eq(0).prop('checked') ){
					var eachPrice = $(rows[idx]).find('td').eq(4).text();
					eachPrice *= 1;
					total += eachPrice;
				}
			});
			proStatus(deliveryCost, total)
		}); 
		
	})

});

//전체 체크/체크해제 되는 동작
function checkAll() {
	//checkbox들
	var $checkboxes=$("input:checkbox[name='orderChk']");
	
	// checkAll 체크 상태 
	var check_status = $("#checkAllOrders").is(":checked");
	
	if( check_status ){
		$checkboxes.each(function() {
			this.checked = true;
		});
	} else {
		$checkboxes.each(function() {
			this.checked = false;
		});
	}
}

/* 총 주문금액 + 총 배송비 = 총 주문금액 보이기 */
function proStatus(deliveryCost, total){
	// 총 주문금액이 50000원 이상이면 배송비 0원 처리
	if(total >= 50000)
		deliveryCost = 0;
	else
		deliveryCost = 2500;
	
	document.getElementById("proPrice").innerHTML = total;
	document.getElementById("deliveryCost").innerHTML = deliveryCost;
	document.getElementById("totalPrice").innerHTML = total+deliveryCost; 

}

</script>

<style type="text/css">
.cartContent {
	width: 80%;
	margin: auto;
}
.cartDetail>table {
	width: 100%;
	margin-bottom: 20px;
	border-top: 1px solid #777;
	border-bottom: 1px solid #777;
	text-align: center;
}
.cartDetail>table>tbody>tr {
	border-bottom: 1px solid #777;
}
.cartDetail>table>tbody>tr>th {
	background-color: #ccc;
	text-align: center;
}
.priceContent>p {
	display: inline-block;
}
.cartHead>p:first-child {
	margin: 0 0 10px 0;
	font-size: 30px;
	font-weight: 600;
}
.cartHead>p:last-child {
	display: inline-block;
	float: right;
}
.cartHead {
	height: 80px;
}
.cartDetail {
	margin: 15px 0 15px 0;
}
#proname_a{
	text-decoration: none;
	color: black;
	font-weight: 600;
	margin-left: 30px;
}
.totalInfo {
	margin-bottom: 15px;
}
.totalInfo>p{
	display: inline-block;
	float: right;
}
.priceContent {
	text-align: center;
	width: 80%;
	margin: auto;
	border: 1px solid #ccc;
}
.priceContent>p{
	font-size: 20px;
	margin: 5px 0;
}
.btnContent {
	text-align: center;
}
#thumbnail {
	width: 168px;
	height: 168px;	
}

</style>

<!-- 총 주문금액 계산 -->
<c:set var="sum" value="0" />
<c:forEach items="${cartList }" var="i">
	<c:set var="sum" value="${sum + i.proPrice*i.cartAmount }" />
</c:forEach>
<input type="hidden" id="total" value="${sum }" />

<div class="cartContent">
	<div class="cartHead">
		<p>장바구니</p>
		<p>장바구니에 담긴 상품은 30일동안 보관됩니다.</p>
	</div>
	
	<div class="cartDetail">
		<table id="cartInfo">
			<tr>
				<th><input type="checkbox" id="checkAllOrders" onclick="checkAll()" checked="checked" /></th>
				<th style="width: 0%"></th>
				<th style="width: 20%;">상품사진</th>
				<th style="width: 45%;">상품명</th>
				<th style="width: 10%;">가격</th>
				<th style="width: 10%;">수량</th>
				<th style="width: 10%;">배송비</th>
			</tr>
			
			<c:forEach items="${cartList }" var="i">
			<tr id="${i.cartNo }">
				<td>
					<input type="checkbox" class="orderChk" name="orderChk" id="orderChk_${i.cartNo }" checked="checked" value="${i.cartNo }"/>
					
				</td>
				<td><input type="hidden" name="proNoChk" value="${i.proNo }" />
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
					<a id="proname_a" href="/prodetail?proNo=${i.proNo}">${i.proName }</a>
				</td>
				<td style="text-align: right;" class="prClasss" id="price_${i.proNo }">
<%-- 				<fmt:formatNumber value="${i.proPrice * i.cartAmount }" pattern="##,###원" />  --%>
				${i.proPrice * i.cartAmount }
				</td>
				<td>
					<select name="amount" id="amount_${i.cartNo }">
					<c:forEach begin="1" end="5" var="j">
						<option value="${j * i.proPrice}" <c:if test="${i.cartAmount eq j }">selected</c:if>>${j}</option> 
					</c:forEach>
					</select>
				</td>
				<td id="delivery">
				<c:if test="${i.proPrice * i.cartAmount >= 50000 }">0원</c:if>
				<c:if test="${i.proPrice * i.cartAmount < 50000 }">2,500원</c:if>
				</td>
			</tr>
			</c:forEach>	

		</table>

		<div class="totalInfo">
			<button class="btn btn-sm" id="deleteBtn">삭제</button>
			<p>50,000원 이상 결제 시 배송비 무료</p>
		</div>

		<div class="priceContent">
			<p>총 주문금액&nbsp;&nbsp;</p><p id="proPrice"></p><p>원 + 총 배송비</p>
			<p id="deliveryCost"></p><p>원 = 총 주문금액&nbsp;&nbsp;</p><p id="totalPrice"></p><p>원</p>
		</div>
		
	</div>
	
	<div class="btnContent">

		<button class="btn" id="shopBtn">계속 쇼핑하기</button> 
		<button class="btn btn-success" id="buyBtn">구매하기</button>
	</div>
	
</div>

</body>
</html>