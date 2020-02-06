package com.epozen.epozenMall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epozen.epozenMall.service.face.PostService;
import com.epozen.epozenMall.vo.ShopProcomVO;
import com.epozen.epozenMall.vo.UserOrderVO;

@Controller
public class PostController {
	
	@Autowired
	PostService postService;

	@GetMapping("/procom")
	public ModelAndView writeProCom(ModelAndView mav,UserOrderVO userOrderVO) {

		mav.addObject("product", userOrderVO);
		mav.setViewName("/product/procom");
		return mav;
	}
	
	@PostMapping("/procom")
	public String writeProComProc(ShopProcomVO shopProcomVO, HttpSession session) {
		
		shopProcomVO.setUserId(session.getAttribute("userId").toString());
		
		postService.writeProductComment(shopProcomVO);
		
		return "redirect:/orderdetail";
	}
	
}
