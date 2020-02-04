package com.epozen.epozenMall.vo;

import java.util.Date;

//주문 목록 리스트 조회하는 VO
public class UserOrderVO {
	private Date orderDate;
	private String orderState;
	private int imgNo;
	private String proName;
	private int proPrice;

	
	@Override
	public String toString() {
		return "UserOrderVO [orderDate=" + orderDate + ", orderState=" + orderState + ", imgNo=" + imgNo + ", proName="
				+ proName + ", proPrice=" + proPrice + "]";
	}

}
