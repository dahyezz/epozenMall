package com.epozen.epozenMall.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epozen.epozenMall.dao.ProductMapper;
import com.epozen.epozenMall.service.face.ProductService;
import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopCartVO;
import com.epozen.epozenMall.vo.ShopOrderVO;
import com.epozen.epozenMall.vo.ShopProcomVO;
import com.epozen.epozenMall.vo.ShopProductVO;
import com.epozen.epozenMall.vo.ShopUserVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired ProductMapper productMapper;
	
	@Override
	/*상품 전체 카운트 & 페이징*/
	public Paging getCurPage(Map<String, Object> map) {
		int totalCount = productMapper.selectCntAll(map);
		int curPage = Integer.parseInt(map.get("curPage").toString());
		
		int listCount = 10;
		Paging paging = new Paging(totalCount, curPage, listCount);
		
		paging.setListSelect((String)map.get("listSelect"));
		
		return paging;
	}
	
	@Override
	/*상품 리스트 페이지*/
	public List<ShopProductVO> selectAllPro(Paging paging) {
		
		return productMapper.selectAll(paging);
	}
	
	@Override
	/*상품 상세 페이지*/
	public ShopProductVO selectProDetail(int proNo) {
		return productMapper.selectProDetail(proNo);
	}
	
	@Override
	/*장바구니 담기 */
	public void insertInCart(ShopCartVO VO) {
		 productMapper.insertInCart(VO);
	}
	
	@Override
	/*구매하기*/
	public void insertOrder(ShopOrderVO shopOrderVO) {
		productMapper.insertOrder(shopOrderVO);
	}
	
	@Override
	public List<ShopProcomVO> selectProCom(Paging paging){
		return productMapper.selectProcom(paging);
	}

	@Override
	public Paging getProcomCurPage(Map<String, Object> map) {
		
		int curPage = Integer.parseInt(map.get("curPage").toString());
		int proNo = Integer.parseInt(map.get("proNo").toString());
		int totalCount = productMapper.selectProcomCnt(proNo);
		int listCount = 5;
		
		Paging paging = new Paging(totalCount, curPage, listCount, proNo);
		
		return paging;
	}
	@Override
	public int getProcomCnt(int proNo) {
		return productMapper.selectProcomCnt(proNo);
	}
	
	@Override
	public ShopUserVO selectUser(ShopUserVO shopUserVO) {
		return productMapper.selectUser(shopUserVO);
	}
}
