package com.epozen.epozenMall.dao;

import java.util.List;
import java.util.Map;

import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopCartVO;
import com.epozen.epozenMall.vo.ShopOrderVO;
import com.epozen.epozenMall.vo.ShopOrderdeVO;
import com.epozen.epozenMall.vo.ShopProcomVO;
import com.epozen.epozenMall.vo.ShopProductVO;
import com.epozen.epozenMall.vo.ShopUserVO;

public interface ProductMapper {
	
	//상품 목록 페이지
	List<ShopProductVO> selectAll(Paging paging);
	
	//상품 목록 페이지 총 상품 수
	int selectCntAll(Map<String, Object> map);
	
	
	//상품 상세 페이지
	ShopProductVO selectProDetail(int proNo);
	
	//장바구니 담기
	void insertInCart(ShopCartVO vO);
	
	//구매
	void insertOrder(ShopOrderVO shopOrderVO);

	//void inserOrderDe(ShopOrderVO orderdeVO);
	//상품평
	List<ShopProcomVO> selectProcom(Paging paging);
	
	//상품평 총 갯수
	int selectProcomCnt(int proNo);

	ShopUserVO selectUser(ShopUserVO shopUserVO);

	int selectOrderNo(ShopOrderVO shopOrderVO);

	void insertOrderde(ShopOrderdeVO shopOrderdeVO);

	int selectTopOrderNo();



	
}