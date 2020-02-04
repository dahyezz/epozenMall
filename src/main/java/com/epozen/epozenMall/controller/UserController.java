package com.epozen.epozenMall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.epozen.epozenMall.service.face.UserService;
import com.epozen.epozenMall.vo.ShopUserVO;
import com.epozen.epozenMall.vo.UserOrderVO;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@GetMapping("/")
	public String test() {
		return "maingaa";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";  
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginProc(ShopUserVO shopUserVO, HttpSession session) {
		
		String redirectUrl = "";
		
		if(userService.loginCheck(shopUserVO)) {
			
			shopUserVO = userService.getLoginUser(shopUserVO);
			
			//session에 로그인 정보 저장
			session.setAttribute("login", true);
			session.setAttribute("userId", shopUserVO.getUserId());
			
			redirectUrl = "/list";
		} else { //로그인 실패시 로그인 페이지로 이동
			redirectUrl = "/login";
		}
		
		return "redirect:"+redirectUrl;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate(); //세션 정보 삭제
		
		return "redirect:/login";
		
	}
	
	//주문목록/배송조회 페이지
	@RequestMapping(value="/orderdetail", method=RequestMethod.GET)
	public ModelAndView detail(ModelAndView mav, HttpSession session, ShopUserVO shopUserVO, UserOrderVO userOrderVO) {
		
		shopUserVO.setUserId(session.getAttribute("userId").toString());
		//UserOrderVO : 주문목록
		List<UserOrderVO> orderList = userService.getOrderList(shopUserVO);
		
		mav.addObject("orderList", orderList);
		mav.setViewName("/user/orderdetail");
		
		return mav;
	}
	
	//개인정보수정/확인 페이지
	@RequestMapping(value="/information", method=RequestMethod.GET)
	public ModelAndView inform(ModelAndView mav, HttpSession session, ShopUserVO shopUserVO) {

		//로그인되어있는 회원의 정보 DB 읽어서 불러옴
		shopUserVO.setUserId((String) session.getAttribute("userId"));
		shopUserVO = userService.getLoginUser(shopUserVO);
		
		mav.addObject("user", shopUserVO);	
		mav.setViewName("/user/information");
		
		return mav;
	}
	
	//개인정보 수정 시 process
	@RequestMapping(value="/information", method=RequestMethod.POST)
	public String informProc(ModelAndView mav, ShopUserVO shopUserVO) {
		
		userService.updateUser(shopUserVO);
	
		return "redirect:/information";
	}
	
	//회원 탈퇴 처리
	@RequestMapping(value="/withdrawal", method=RequestMethod.POST)
	public String withdrawal(HttpSession session, ShopUserVO shopUserVO) {
		
		shopUserVO.setUserId(session.getAttribute("userId").toString());
		userService.withdrawalUser(shopUserVO);
		session.invalidate();

		return "redirect:/list";
	}
}
