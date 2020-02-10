package com.epozen.epozenMall.dao;

import java.util.List;

import com.epozen.epozenMall.vo.ShopOrderVO;
import com.epozen.epozenMall.vo.ShopUserVO;
import com.epozen.epozenMall.vo.UserOrderVO;

public interface CartMapper {

	List<UserOrderVO> selectCartAllByUserId(ShopUserVO shopUserVO);

	void deleteCartByCartNo(int cartNo);
	
	void insertOrder(ShopOrderVO shopOrderVO);

}
