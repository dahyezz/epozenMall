package com.epozen.epozenMall.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.epozen.epozenMall.service.face.UserService;
import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopUserVO;
import com.epozen.epozenMall.vo.UserOrderVO;


@Controller
public class UserController {

	@Autowired
	UserService userService;

	// 회원 가입
	@GetMapping("/register")
	public String register() {
		return "user/register";
	}

	// 회원가입 API
	@PostMapping("/registerProc")
	public String postRegister(ShopUserVO shopUserVO) {

		int result = userService.idCheck(shopUserVO);
		try {
			if(result == 1) {
				return "/register";
			}else if(result == 0) {
				userService.register(shopUserVO);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
		//userService.register(shopUserVO);
		return "redirect:/login";
	}

	// 아이디 체크
	@RequestMapping("/idChk")
	@ResponseBody
	public int idCheck(ShopUserVO shopUserVO) {
		int result = userService.idCheck(shopUserVO);
		return result;
	}

	@GetMapping("/login")
	public String login() {
		return "user/login";
	}

	@PostMapping("/login")
	public String loginProc(ShopUserVO shopUserVO, HttpSession session) {

		String redirectUrl = "";

		if (userService.loginCheck(shopUserVO)) {

			shopUserVO = userService.getLoginUser(shopUserVO);

			// session에 로그인 정보 저장
			session.setAttribute("login", true);
			session.setAttribute("userId", shopUserVO.getUserId());

			redirectUrl = "/list";
		} else { // 로그인 실패시 로그인 페이지로 이동
			redirectUrl = "/login";
		}

		return "redirect:" + redirectUrl;
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 정보 삭제

		return "redirect:/login";

	}

	// 주문목록/배송조회 페이지
	@GetMapping("/orderdetail")
	public ModelAndView detail(ModelAndView mav, HttpSession session, ShopUserVO shopUserVO,
				@RequestParam(defaultValue="1") int curPage, Map<String, Object> map
			) {

		if(session == null || session.getAttribute("userId")==null) {
			mav.setViewName("redirect:/login");
		} else {
			shopUserVO.setUserId(session.getAttribute("userId").toString());
			
			map.put("curPage", curPage);
			map.put("userId", shopUserVO.getUserId());
			Paging paging = userService.getcurPage(map);
			
			// UserOrderVO : 주문목록
			List<UserOrderVO> orderList = userService.getOrderList(paging);
			mav.addObject("orderList", orderList);
			mav.addObject("paging", paging);
					
			mav.setViewName("/user/orderdetail");
		}
	

		return mav;
	}

	// 개인정보수정/확인 페이지
	@GetMapping("/information")
	public ModelAndView inform(ModelAndView mav, HttpSession session, ShopUserVO shopUserVO) {

		// 로그인되어있는 회원의 정보 DB 읽어서 불러옴
		shopUserVO.setUserId((String) session.getAttribute("userId"));
		shopUserVO = userService.getLoginUser(shopUserVO);

		mav.addObject("user", shopUserVO);
		mav.setViewName("/user/information");

		return mav;
	}

	// 개인정보 수정 시 process
	@PostMapping("/information")
	public String informProc(ModelAndView mav, ShopUserVO shopUserVO) {

		userService.updateUser(shopUserVO);

		return "redirect:/information";
	}

	// 회원 탈퇴 처리
	@PostMapping("/withdrawal")
	public String withdrawal(HttpSession session, ShopUserVO shopUserVO) {

		shopUserVO.setUserId(session.getAttribute("userId").toString());
		userService.withdrawalUser(shopUserVO);
		session.invalidate();

		return "redirect:/list";

	}
}
