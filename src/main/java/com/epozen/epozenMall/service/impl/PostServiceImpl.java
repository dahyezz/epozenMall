package com.epozen.epozenMall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epozen.epozenMall.dao.PostMapper;
import com.epozen.epozenMall.service.face.PostService;
import com.epozen.epozenMall.vo.ShopProcomVO;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired PostMapper postMapper;

	@Override
	public void writeProductComment(ShopProcomVO shopProcomVO) {
		postMapper.insertProComByVO(shopProcomVO);
	}
}
