package com.epozen.epozenMall.vo;

import lombok.Data;

@Data
public class ShopCartVO {
	private int cartNo;
	private String userId;
	private int proNo;
	private int cartAmount;
	private int cartPrice;

	@Override
	public String toString() {
		return "ShopCart [cartNo=" + cartNo + ", userId=" + userId + ", proNo=" + proNo + ", cartAmount=" + cartAmount
				+ ", cartPrice=" + cartPrice + "]";
	}
	
	
	
}
