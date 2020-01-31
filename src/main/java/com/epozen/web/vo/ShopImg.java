package com.epozen.web.vo;

import lombok.Data;

@Data
public class ShopImg {
	private int imgNo;
	private int proNo;
	private int procomNo;
	private String originName;
	private String storedName;

	@Override
	public String toString() {
		return "ShopImg [imgNo=" + imgNo + ", proNo=" + proNo + ", procomNo=" + procomNo + ", originName=" + originName
				+ ", storedName=" + storedName + "]";
	}
	
	
}
