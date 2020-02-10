package com.epozen.epozenMall.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.epozen.epozenMall.service.face.CommentService;
import com.epozen.epozenMall.util.Paging;
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
	public ModelAndView commentList(ModelAndView mav, @RequestParam int proNo, @RequestParam int curPage, Map<String,Object> map){

		map.put("curPage", curPage);
		map.put("proNo", proNo);

		Paging paging = commentService.getCurPage(map);
		
		List<ShopCommentVO> commentList = commentService.selectComments(paging);
		mav.addObject("commentList", commentList);
		mav.addObject("paging", paging);
		
		int totalCnt = commentService.getCommentCnt(proNo);
		mav.addObject("commentCnt", totalCnt);
		
		mav.setViewName("/product/comment");
		
		return mav;
	}

}
