package com.epozen.epozenMall.vo;

import java.util.Date;

import lombok.Data;

//주문 목록 리스트 조회하는 VO
@Data
public class UserOrderVO {
	private Date orderDate;
	private String orderState;
	private int imgNo;
	private String proName;
	private int proPrice;
	private int cartNo;
	
}
