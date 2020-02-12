package com.epozen.epozenMall.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ShopOrderVO {
	private int orderNo;
	private String userId;
	private Date orderDate;
	private String orderState;
	private int orderPrice;


}
