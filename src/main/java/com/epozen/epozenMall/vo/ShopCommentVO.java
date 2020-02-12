package com.epozen.epozenMall.vo;

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

}
