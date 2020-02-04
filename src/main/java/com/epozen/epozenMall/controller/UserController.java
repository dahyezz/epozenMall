package com.epozen.epozenMall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.epozen.epozenMall.service.face.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@GetMapping("/")
	public String test() {
		
		return "mainaa";
	}
}
