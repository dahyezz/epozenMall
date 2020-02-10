package com.epozen.epozenMall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epozen.epozenMall.dao.CartMapper;
import com.epozen.epozenMall.service.face.CartService;
import com.epozen.epozenMall.vo.ShopOrderVO;
import com.epozen.epozenMall.vo.ShopUserVO;
import com.epozen.epozenMall.vo.UserOrderVO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired CartMapper cartMapper;
	
	@Override
	public List<UserOrderVO> getCartList(ShopUserVO shopUserVO) {
		return cartMapper.selectCartAllByUserId(shopUserVO);
	}

	@Override
	public void cartDelete(String names) {
		String[] nameList = names.split(",");
		int deleteList[] = new int[nameList.length];
		
		for(int i=0; i<nameList.length; i++) {
			deleteList[i] = Integer.parseInt(nameList[i]);
			cartMapper.deleteCartByCartNo(deleteList[i]);
		}
		
	}
	@Override
	public void insertOrder(ShopOrderVO shopOrderVO) {
		cartMapper.insertOrder(shopOrderVO);
	}
}
