package com.epozen.epozenMall.service.face;

import java.util.List;
import java.util.Map;

import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopCartVO;
import com.epozen.epozenMall.vo.ShopOrderVO;
import com.epozen.epozenMall.vo.ShopProcomVO;
import com.epozen.epozenMall.vo.ShopProductVO;
import com.epozen.epozenMall.vo.ShopUserVO;

public interface ProductService {

	/**
	 * 상품 전체 리스트 조회
	 * 
	 * @param Paging  현재 페이지 정보
	 * @return Priduct List
	 */
	List<ShopProductVO> selectAllPro(Paging paging);

	Paging getCurPage(Map<String, Object> map);
	
	/**
	 * 상품 상세 페이지 조회
	@return detail
	*/
	ShopProductVO selectProDetail(int proNo);
	
	/**
	 * 장바구니 담기
	@return detail
	*/
	void insertInCart(ShopCartVO VO);
	
	/**
	 * 구매하기
	*/
	void insertOrder(ShopOrderVO shopOrderVO);

	/**
	 * 상품평 조회
	*/

	List<ShopProcomVO> selectProCom(int proNo);

	ShopUserVO selectUser(ShopUserVO shopUserVO);




}
