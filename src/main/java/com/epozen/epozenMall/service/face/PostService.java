package com.epozen.epozenMall.service.face;

import com.epozen.epozenMall.vo.ShopProcomVO;

public interface PostService {

	/**
	 * 상품평 작성
	 * 
	 * @param shopProcomVO
	 */
	void writeProductComment(ShopProcomVO shopProcomVO);


}
