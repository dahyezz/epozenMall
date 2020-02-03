package com.epozen.epozenMall.vo;

import lombok.Data;

@Data
public class ShopProductVO {
	private int proNo;
	private String proCate;
	private String proName;
	private int proPrice;
	private String proDetail;
	private int imgNo;

	@Override
	public String toString() {
		return "ShopProduct [proNo=" + proNo + ", proCate=" + proCate + ", proName=" + proName + ", proPrice="
				+ proPrice + ", proDetail=" + proDetail + ", imgNo=" + imgNo + "]";
	}
	
	

}
