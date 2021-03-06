
package com.epozen.epozenMall.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mav, @RequestParam(defaultValue="1") int curPage, String listSelect, Map<String, Object> map) {

		map.put("curPage", curPage);
		map.put("listSelect", listSelect);
		Paging paging = productService.getCurPage(map);
		
		List<ShopProductVO> productList = productService.selectAllPro(paging);
		
		mav.addObject("proList", productList);
		mav.addObject("lisel",listSelect);
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
	@PostMapping("/incart")
	public String cartIn(ShopCartVO VO, HttpSession session) {
		
		VO.setUserId(session.getAttribute("userId").toString());
//		System.out.println(VO.toString());
		productService.insertInCart(VO); // 장바구니 테이블에 저장


		return "redirect:/prodetail?proNo="+VO.getProNo();

	}
	
	//구매 페이지
	@GetMapping("/order")
	public ModelAndView orderProduct(ShopUserVO shopUserVO,  ModelAndView mav, HttpSession session,String products, String price) {
		
		
		shopUserVO.setUserId(session.getAttribute("userId").toString());
		ShopUserVO user = productService.selectUser(shopUserVO);
		
		mav.addObject("user", user);
		mav.addObject("products", products);
		mav.addObject("price", price);
		mav.setViewName("/order/order");
		
		return mav;
		
	} 
//	public static class CardOrder{
//		private List<Order> productList;
//		private String receiveName;
//		private String receiveAddr;
//		private String receivePhoneNo;
//		private String etc;
//		private Integer deliveryCost;
//		private Payment payment;
//	}
//	public static class SessionInfo{
//		private Boolean isAdmin;
//		private String userId;
//		private List<Product> recentlyV
//	}
//	public static class Payment{
//		private Long couponId;
//		private Long totalCost;
//		
//	}
//	public static class Order{
//		private Long prodductId;
//		private Integer amounts;
//	}
	//구매 하기
	@PostMapping("/order")
//	public String orderProductProc(ShopOrderVO shopOrderVO, HttpSession session,String products, String price, CardOrder map) {
		
	public String orderProductProc(ShopOrderVO shopOrderVO, HttpSession session,String products, String price, Map<String,Object> map) {
		map.put("products", products);
		map.put("price", price);
		map.put("userId", session.getAttribute("userId").toString());
		
		shopOrderVO.setUserId(session.getAttribute("userId").toString());
		
		productService.insertOrder(shopOrderVO);
		productService.buyOrderde(map);
		
		return "redirect:/orderdetail";
	}

	// 상품평

	@ResponseBody
	@GetMapping("/deprocom")
	public ModelAndView procom(ModelAndView mav,@RequestParam int proNo, @RequestParam int curPage, Map<String,Object> map) {

		map.put("curPage", curPage);
		map.put("proNo", proNo);
		
		Paging paging = productService.getProcomCurPage(map);

		
		List<ShopProcomVO> procomList = productService.selectProCom(paging);
		mav.addObject("procomList", procomList);
		mav.addObject("paging",paging);
		
		int totalCnt = productService.getProcomCnt(proNo);
		mav.addObject("procomCnt", totalCnt);
		
		mav.setViewName("/product/deprocom");
		return mav;
	}

}

