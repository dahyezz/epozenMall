package com.epozen.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.epozen.web.service.face.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;

}
