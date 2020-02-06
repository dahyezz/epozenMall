package com.epozen.epozenMall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.epozen.epozenMall.service.face.CartService;
import com.epozen.epozenMall.vo.ShopUserVO;
import com.epozen.epozenMall.vo.UserOrderVO;

@Controller
public class CartController {

	@Autowired CartService cartService;
	
	//장바구니 페이지
	@GetMapping("/cart")
	public ModelAndView cart(ModelAndView mav, HttpSession session, ShopUserVO shopUserVO) {
		
		shopUserVO.setUserId(session.getAttribute("userId").toString());
		List<UserOrderVO> cartList = cartService.getCartList(shopUserVO);
		
		mav.addObject("cartList", cartList);
		mav.setViewName("/cart/cart");
		return mav;
	}
	
	//장바구니 삭제 _ 추후 수정
	@ResponseBody
	@RequestMapping(value="/cartDelete", method=RequestMethod.POST)
	public void cartDelete(@RequestParam String names) {
		
		cartService.cartDelete(names);
		
	}
	
}
