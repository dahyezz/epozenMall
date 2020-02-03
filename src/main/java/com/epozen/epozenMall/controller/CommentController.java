package com.epozen.epozenMall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.epozen.epozenMall.service.face.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;

}
