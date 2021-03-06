package com.epozen.epozenMall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.epozen.epozenMall.service.face.CartService;
import com.epozen.epozenMall.vo.ShopOrderVO;
import com.epozen.epozenMall.vo.ShopUserVO;
import com.epozen.epozenMall.vo.UserOrderVO;

@Controller
public class CartController {

	@Autowired CartService cartService;
	
	//장바구니 페이지
	@GetMapping("/cart")
	public ModelAndView cart(ModelAndView mav, HttpSession session, ShopUserVO shopUserVO) {
		
		if(session == null || session.getAttribute("userId")==null) {
			mav.setViewName("redirect:/login");
		} else {
			shopUserVO.setUserId(session.getAttribute("userId").toString());
			List<UserOrderVO> cartList = cartService.getCartList(shopUserVO);
			
			mav.addObject("cartList", cartList);
			mav.setViewName("/cart/cart");
		}
		
		
		return mav;
	}  
	
	//장바구니 삭제
	@ResponseBody
	@PostMapping("/cartDelete")
	public void cartDelete(@RequestParam String names) {

		cartService.cartDelete(names);
		
	}
	// 구매하기버튼 클릭시 order db에 저장
	@PostMapping("/inorder")
	public String inorder(HttpSession session, ShopOrderVO shopOrderVO, ShopUserVO shopUserVO ) {
		
		shopUserVO.setUserId(session.getAttribute("userId").toString());
		cartService.insertOrder(shopOrderVO);
		
		return " redirect:/cart";
	}
}
                            