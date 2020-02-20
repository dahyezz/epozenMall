package com.epozen.epozenMall.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ShopCartVO {
	private int cartNo;
	private String userId;
	private int proNo;
	private int cartAmount;
	private int cartPrice;
	private Date cartDate;

}
