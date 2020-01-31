package com.epozen.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.epozen.web.service.face.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
}
