package com.epozen.epozenMall.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epozen.epozenMall.dao.ProductMapper;
import com.epozen.epozenMall.service.face.ProductService;
import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopProductVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired ProductMapper productMapper;
	
	@Override
	public Paging getCurPage(Map<String, Object> map) {
		int totalCount = productMapper.selectCntAll();
		int curPage = Integer.parseInt(map.get("curPage").toString());
		
		int listCount = 10;
		Paging paging = new Paging(totalCount, curPage, listCount);
		
		return paging;
	}
	
	@Override
	public List<ShopProductVO> selectAllPro(Paging paging) {
		return productMapper.selectAll(paging);
	}
}
