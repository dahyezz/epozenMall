package com.epozen.epozenMall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.epozen.epozenMall.service.face.ProductService;
import com.epozen.epozenMall.vo.ShopProductVO;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mav) {
		
		List<ShopProductVO> productList = productService.selectAllPro();
		
		mav.addObject("proList", productList);
		mav.setViewName("/product/list");
		return mav;
		
	}

}
