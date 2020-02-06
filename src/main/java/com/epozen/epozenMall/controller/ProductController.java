
package com.epozen.epozenMall.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.epozen.epozenMall.service.face.ProductService;
import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopCartVO;
import com.epozen.epozenMall.vo.ShopOrderVO;
import com.epozen.epozenMall.vo.ShopProcomVO;
import com.epozen.epozenMall.vo.ShopProductVO;
import com.epozen.epozenMall.vo.ShopUserVO;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mav, @RequestParam(defaultValue="1") int curPage, Map<String, Object> map) {
		
		map.put("curPage", curPage);
		Paging paging = productService.getCurPage(map);
		
		List<ShopProductVO> productList = productService.selectAllPro(paging);
		
		mav.addObject("proList", productList);
		mav.addObject("paging", paging);
		mav.setViewName("/product/list");
		return mav;
		
	}
	//상품 상세 페이지
	@GetMapping("/prodetail")
	public String proDetail(@RequestParam int proNo, Model model) {
		
		ShopProductVO detail = productService.selectProDetail(proNo);
		
		model.addAttribute("detail", detail);
		return "/product/detail";
	}
	
	//장바구니 담기
	@GetMapping("/incart")
	public String cartIn(@ModelAttribute ShopCartVO VO, HttpSession session) {
		
		//로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인
		String userId = (String)session.getAttribute("userId");
		if(userId==null) {
			//로그인 하지 않은 상태이면 로그인 화면으로 이동
			return "redirect:/login";
		}
		VO.setUserId(userId);
		productService.insertInCart(VO); // 장바구니 테이블에 저장
		return "redirect:/"; //하고 어디로 이동 ??
	}
	
	@GetMapping("/order")
	public String orderProduct( ShopOrderVO shopOrderVO) {
		
		productService.insertOrder(shopOrderVO);
		
		return "/order/order";
		
	}
	//	ShopUserVO user = (ShopUserVO)session.getAttribute("user");
	//	String userId = user.getUserId();
	// 상품평
	/*@GetMapping("/prodetail")
	public ModelAndView procom(ModelAndView mav) {
		
		List<ShopProcomVO> procomList = productService.selectProCom();
		
		mav.addObject("procomList", procomList);
		mav.setViewName("/product/detail");
		return mav;
	}*/
}

