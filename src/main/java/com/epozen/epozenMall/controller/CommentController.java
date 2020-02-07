package com.epozen.epozenMall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.epozen.epozenMall.service.face.CommentService;
import com.epozen.epozenMall.vo.ShopCommentVO;

@RestController
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	@PostMapping("/comment")
	public void insert(@ModelAttribute ShopCommentVO shopCommentVO, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		shopCommentVO.setUserId(userId);
		commentService.insertComment(shopCommentVO);
		
	}
	
	@GetMapping("/comment")
	public List<ShopCommentVO> commentList(@RequestParam int proNo){
		List<ShopCommentVO> list = commentService.selectComments(proNo);
		
		return list;
	}

}
