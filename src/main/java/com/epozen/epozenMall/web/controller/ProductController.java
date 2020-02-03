package com.epozen.epozenMall.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epozen.epozenMall.web.service.face.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService prodoctService;
	
	@RequestMapping("/list")
	public String list() {
		return "list";
	}

}
