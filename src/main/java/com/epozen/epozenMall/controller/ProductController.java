package com.epozen.epozenMall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.epozen.epozenMall.service.face.ProductService;
import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopProductVO;

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

}
