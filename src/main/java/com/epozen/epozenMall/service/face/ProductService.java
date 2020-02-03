package com.epozen.epozenMall.service.face;

import java.util.List;

import com.epozen.epozenMall.vo.ShopProductVO;

public interface ProductService {

	/**
	 * 상품 전체 리스트 조회
	 * 
	 * @return Priduct List
	 */
	List<ShopProductVO> selectAllPro();

}
