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

	@Override
	public String toString() {
		return "ShopOrder [orderNo=" + orderNo + ", userId=" + userId + ", orderDate=" + orderDate + ", orderState="
				+ orderState + ", orderPrice=" + orderPrice + "]";
	}
	
	

}
