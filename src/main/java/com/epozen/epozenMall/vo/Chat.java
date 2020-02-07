package com.epozen.epozenMall.vo;

import lombok.Data;

@Data
public class Chat {
	private String name;
	private String message;
	
	public Chat() {
	}
	
	public Chat(String name, String message) {
		this.name = name;
		this.message = message;
	}
}
