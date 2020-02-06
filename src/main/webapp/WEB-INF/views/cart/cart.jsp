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
	
	/* 구매하기 버튼 동작 */
	$('#buyBtn').click(function() {
		location.href="/order";
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
				console.log("error")
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
	if(total >= 50000)
		deliveryCost = 0;
	else
		deliveryCost = 2500;
	
	document.getElementById("proPrice").innerHTML = total;
	document.getElementById("deliveryCost").innerHTML = deliveryCost;
	document.getElementById("totalPrice").innerHTML = total+deliveryCost;
	
	$("input:checkbox").on('click', function(){
		
		if($(this).prop('checked')){
			var check = $(this);
			var tr = check.parent().parent().eq(0);
			var td = tr.children();
			var price = td.eq(3).text();
			price *= 1;
			total = calcTotal(price,'add',total);
		} else {
			var check = $(this);
			var tr = check.parent().parent().eq(0);
			var td = tr.children();
			var price = td.eq(3).text();
			price *= 1;
			total = calcTotal(price,'subtract',total);
		}
		
		proStatus(deliveryCost, total);
	});

	/* 상품 리스트 테이블에 가격정보 보이기   가격 = 원가*수량 */
	$("[id^='price_']").each(function(){
		$(this).innerHTML = 30000

	});
	


	
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

/* 총 주문금액 계산 */
function calcTotal(productPrice,status,total){
	if(status=='add'){
		total = total + productPrice;	
	} else if(status=='subtract') {
		total = total - productPrice;
	}
// 	console.log(total)
	return total;
}

/* select 태그 변경 시 가격 변경 */
function changePrice(){
// 	var selected = document.getElementById("amount");

// 	var selectValue = selected.options[selected.selectedIndex].value;
// 	console.log(selectValue);
	
}

function proStatus(deliveryCost, total){
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
}
.priceContent>p {
	display: inline-block;
}
</style>

<!-- 총 주문금액 계산 -->
<c:set var="sum" value="0" />
<c:forEach items="${cartList }" var="i">
	<c:set var="sum" value="${sum + i.proPrice }" />
</c:forEach>
<input type="hidden" id="total" value="${sum }" />

<div class="cartContent">
	<div class="cartHead">
		<p>장바구니</p>
		<p>장바구니에 담긴 상품은 30일동안 보관됩니다.</p>
	</div>
	
	<div class="cartDetail">
		<table>
			<tr>
				<th><input type="checkbox" id="checkAllOrders" onclick="checkAll()" checked="checked" /></th>
				<th>상품사진</th>
				<th>상품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>배송비</th>
			</tr>
			
			<c:forEach items="${cartList }" var="i">
			<tr id="${i.cartNo }">
				<td><input type="checkbox" class="orderChk" name="orderChk" id="orderChk_${i.cartNo }" checked="checked" value="${i.cartNo }"/></td>
				<td>
				<c:if test="${i.imgNo eq 0 }">
					<img id="thumbnail" src="/image/default.png">	
				</c:if>
				</td>
				<td>${i.proName }</td>
				<td id="price_${i.proNo }">${i.proPrice }</td>
				<td>
					<select name="amount" id="amount_${i.cartNo }">
						<c:forEach begin="1" end="5" var="j">
						<option value="${j}" <c:if test="${i.cartAmount eq j }">selected</c:if>>${j}</option> 
					</c:forEach>
					</select>
				</td>
				<td id="delivery">2,500원</td>
			</tr>
			</c:forEach>	

		</table>
		<button id="deleteBtn">삭제</button>
		<p>50,000원 이상 결제 시 배송비 무료</p>
		<div class="priceContent">
			<p>총 주문금액&nbsp;&nbsp;</p><p id="proPrice"></p><p>원 + 총 배송비</p>
			<p id="deliveryCost"></p><p>원 = 총 주문금액&nbsp;&nbsp;</p><p id="totalPrice"></p><p>원</p>
		</div>
	</div>
	
	<div class="btnContent">
		<button id="shopBtn">계속 쇼핑하기</button>
		<button id="buyBtn">구매하기</button>
	</div>
	
</div>

</body>
</html>