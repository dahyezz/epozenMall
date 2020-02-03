package com.epozen.epozenMall.web.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ShopCommentVO {
	private int comNo;
	private String userId;
	private int proNo;
	private String comContents;
	private Date comRegdate;
	private int comDepth;
	private int comSeq;

	@Override
	public String toString() {
		return "ShopComment [comNo=" + comNo + ", userId=" + userId + ", proNo=" + proNo + ", comContents="
				+ comContents + ", comRegdate=" + comRegdate + ", comDepth=" + comDepth + ", comSeq=" + comSeq + "]";
	}
	
	

}
