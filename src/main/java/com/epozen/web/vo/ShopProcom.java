package com.epozen.web.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ShopProcom {
	private int procomNo;
	private String userId;
	private int proNo;
	private String procomContents;
	private Date procomRegdate;
	private int imgNo;

	@Override
	public String toString() {
		return "ShopProcom [procomNo=" + procomNo + ", userId=" + userId + ", proNo=" + proNo + ", procomContents="
				+ procomContents + ", procomRegdate=" + procomRegdate + ", imgNo=" + imgNo + "]";
	}
	
	
	
}
