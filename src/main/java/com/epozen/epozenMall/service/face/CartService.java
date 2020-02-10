package com.epozen.epozenMall.service.face;

import java.util.List;

import com.epozen.epozenMall.vo.ShopOrderVO;
import com.epozen.epozenMall.vo.ShopUserVO;
import com.epozen.epozenMall.vo.UserOrderVO;

public interface CartService {

	List<UserOrderVO> getCartList(ShopUserVO shopUserVO);

	void cartDelete(String names);

	void insertOrder(ShopOrderVO shopOrderVO);


}
