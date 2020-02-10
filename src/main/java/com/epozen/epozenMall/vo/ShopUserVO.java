package com.epozen.epozenMall.vo;

import lombok.Data;
import lombok.Setter;

@Data
@Setter
public class ShopUserVO {
	private String userId;
	private String userPassword;
	private String userName;
	private String userPhone;
	private String userAdd;

	@Override
	public String toString() {
		return "ShopUser [userId=" + userId + ", userPassword=" + userPassword + ", userName=" + userName
				+ ", userPhone=" + userPhone + ", userAdd=" + userAdd + "]";
	}
	
	

}
