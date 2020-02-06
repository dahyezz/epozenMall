package com.epozen.epozenMall.vo;

import java.util.Date;

import lombok.Data;

//주문목록, 장바구니 리스트 조회하는 VO
@Data
public class UserOrderVO {
	private Date orderDate;
	private String orderState;
	private int imgNo;
	private String proName;
	private int proPrice;
	private int cartNo;
	private int proNo;
	private int cartAmount;
	
}
