package com.epozen.epozenMall.dao;

import java.util.List;

import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopCartVO;
import com.epozen.epozenMall.vo.ShopProductVO;

public interface ProductMapper {
	
	//상품 목록 페이지
	List<ShopProductVO> selectAll(Paging paging);
	
	//상품 목록 페이지 총 상품 수
	int selectCntAll();
	
	//상품 상세 페이지
	ShopProductVO selectProDetail(int proNo);
	
	//장바구니 담기
	static void insertInCart(ShopCartVO vO) {
		
	}
}