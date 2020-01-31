package com.epozen.web.vo;

import lombok.Data;

@Data
public class ShopUser {
	private String userId;
	private String userPassword;
	private String userName;
	private int userPhone;
	private String userAdd;

	@Override
	public String toString() {
		return "ShopUser [userId=" + userId + ", userPassword=" + userPassword + ", userName=" + userName
				+ ", userPhone=" + userPhone + ", userAdd=" + userAdd + "]";
	}
	
	

}
