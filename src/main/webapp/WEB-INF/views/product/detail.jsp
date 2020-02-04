<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<c:import url="/WEB-INF/views/main.jsp" />

<div class="container">

	  <div class="form-group">
	  <table id="table">
	  	<tr>
	  		<td>
	  		<img id="thumbnail" src="/image/default.png" width="300px" height="300px"> </td>
	  		<td align="center">
	  	</tr>	
	  	<tr>
	  		<td >상품명 </td>
	  		<td >${detail.proName}</td>
		</tr>	  
		<tr>
			<td colspan="2">가격</td>
	  		<td colspan="3">${detail.proPrice}</td>
		</tr>
		<tr>
			<td colspan="2">
			<form name="incart" method="post" action="${path}/incart">
				<input type="hidden" name="proNo" value="${VO.proNo}">
				<select name="amount">
					<c:forEach begin="1" end="5" var="i">
						<option value="${i}">${i}</option> 
					</c:forEach>
				</select>
				&nbsp;개<input type="submit" value="장바구니 담기">
		  	</form>
		  	</td>
		  	<td> <button type="submit" class="btn btn">바로 구매</button> </td>  		
			
		</tr>
		
	  </table>
	  	
     
     <!-- Nav tabs -->
     <div>
		<ul class="nav nav-tabs" role="tablist">
		  <li role="presentation" class="active"><a href="#tab1" role="tab" data-toggle="tab">상품 상세</a></li>
		  <li role="presentation"><a href="#tab2" role="tab" data-toggle="tab">상품 평</a></li>
		  <li role="presentation"><a href="#tab3" role="tab" data-toggle="tab">댓글</a></li>
		</ul>
 	</div>
 
	<!-- Tab panes -->
	<div class="tab-content">
	  	<div role="tabpanel" class="tab-pane active" id="tab1">
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
		<div role="tabpanel" class="tab-pane" id="tab2">
			<p>상품평 입니다.상품평 입니다.상품평 입니다.상품평 입니다.상품평 입니다.
			상품평 입니다.상품평 입니다.상품평 입니다.상품평 입니다.상품평 입니다.</p>
		</div>
		<div role="tabpanel" class="tab-pane" id="tab3">
			<p>댓글</p>
		</div>
	</div>
</div>
</div>

<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="/SRC2/sctab/jquery.scrolling-tabs.js"></script>


<script>
	$('.nav-tabs').scrollingTabs();
</script>
		

</body>
</html>