package com.epozen.epozenMall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epozen.epozenMall.dao.face.ProductDao;
import com.epozen.epozenMall.service.face.ProductService;
import com.epozen.epozenMall.vo.ShopProductVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired ProductDao productDao;
	
	@Override
	public List<ShopProductVO> selectAllPro() {
		return productDao.selectAll();
	}
}
