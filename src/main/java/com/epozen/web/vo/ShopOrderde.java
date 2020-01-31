package com.epozen.web.vo;

import lombok.Data;

@Data
public class ShopOrderde {
	private int orderdeNo;
	private int orderNo;
	private int proNo;
	private int orderdeAmount;
	private int orderdePrice;

	@Override
	public String toString() {
		return "ShopOrderde [orderdeNo=" + orderdeNo + ", orderNo=" + orderNo + ", proNo=" + proNo + ", orderdeAmount="
				+ orderdeAmount + ", orderdePrice=" + orderdePrice + "]";
	}
	
	

}
