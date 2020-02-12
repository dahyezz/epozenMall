package com.epozen.epozenMall.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ShopProcomVO {
	private int procomNo;
	private String userId;
	private int proNo;
	private String procomContents;
	private Date procomRegdate;
	private int imgNo;

}
