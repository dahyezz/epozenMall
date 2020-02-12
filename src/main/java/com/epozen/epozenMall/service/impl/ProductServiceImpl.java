package com.epozen.epozenMall.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epozen.epozenMall.dao.CartMapper;
import com.epozen.epozenMall.dao.ProductMapper;
import com.epozen.epozenMall.service.face.ProductService;
import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopCartVO;
import com.epozen.epozenMall.vo.ShopOrderVO;
import com.epozen.epozenMall.vo.ShopOrderdeVO;
import com.epozen.epozenMall.vo.ShopProcomVO;
import com.epozen.epozenMall.vo.ShopProductVO;
import com.epozen.epozenMall.vo.ShopUserVO;
import com.epozen.epozenMall.vo.UserOrderVO;

@Service
public class ProductServiceImpl implements ProductService {

	private static final ShopOrderVO ShopOrderdeVO = null;
	@Autowired
	ProductMapper productMapper;
	@Autowired
	CartMapper cartMapper;

	@Override
	/* 상품 전체 카운트 & 페이징 */
	public Paging getCurPage(Map<String, Object> map) {
		int totalCount = productMapper.selectCntAll(map);
		int curPage = Integer.parseInt(map.get("curPage").toString());

		int listCount = 10;
		Paging paging = new Paging(totalCount, curPage, listCount);

		paging.setListSelect((String) map.get("listSelect"));

		return paging;
	}

	@Override
	/* 상품 리스트 페이지 */
	public List<ShopProductVO> selectAllPro(Paging paging) {

		return productMapper.selectAll(paging);
	}

	@Override
	/* 상품 상세 페이지 */
	public ShopProductVO selectProDetail(int proNo) {
		return productMapper.selectProDetail(proNo);
	}

	@Override
	/* 장바구니 담기 */
	public void insertInCart(ShopCartVO VO) {
		productMapper.insertInCart(VO);
	}

	@Override
	/* 구매하기 */
	public void insertOrder(ShopOrderVO shopOrderVO) {
		// ShopOrderdeVO shopOrderdeVO = new ShopOrderdeVO();

		productMapper.insertOrder(shopOrderVO);

		// int orderNo = productMapper.selectOrderNo(shopOrderVO);
		// shopOrderdeVO.setOrderNo(orderNo);
		// productMapper.insertOrderde(shopOrderdeVO);
		// cartMapper.deleteCartByCartNo(shopOrderdeVO));
	}

	@Override
	public void buyOrderde(Map<String, Object> map) {

		// 마지막으로 생성된 orderNo 조회
		int orderNo = productMapper.selectTopOrderNo();

		ShopOrderdeVO shopOrderdeVO = new ShopOrderdeVO();
		shopOrderdeVO.setOrderNo(orderNo);

		String productStr = (String) map.get("products");
		String[] productList = productStr.split(",");
		int[] proList = new int[productList.length];

		String priceStr = (String) map.get("price");
		String[] priceList = priceStr.split(",");
		int[] priList = new int[priceList.length];

		// 장바구니에서 삭제하기 위한 vo
		UserOrderVO userOrderVO = new UserOrderVO();
		userOrderVO.setUserId(map.get("userId").toString());

		// ------------------------------------------------------
		// shop_orderde 테이블에 insert, shop_cart delete 부분
		for (int i = 0; i < proList.length; i++) {
			proList[i] = Integer.parseInt(productList[i].toString());
			priList[i] = Integer.parseInt(priceList[i].toString());

			shopOrderdeVO.setOrderdeAmount(1);
			shopOrderdeVO.setOrderdePrice(priList[i]);
			shopOrderdeVO.setProNo(proList[i]);
			productMapper.insertOrderde(shopOrderdeVO);

			// ------------------------------------------------------
			// shop_cart에서 구매완료된 상품 삭제하는 부분

			// 파라미터 : userOrderVO 이용 (userId, proNo)
			// userId - map 활용
			// proNo - 구매완료한 상품들의 proNo를 setting 해줌
			userOrderVO.setProNo(proList[i]);

			// cartNo - 장바구니 삭제 시 필요한 파라미터를 조회해옴
			int cartNo = productMapper.selectCartNoByUserInfo(userOrderVO);

			cartMapper.deleteCartByCartNo(cartNo);
			// ------------------------------------------------------
		}
		// ------------------------------------------------------

	}

	@Override
	public List<ShopProcomVO> selectProCom(Paging paging) {
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
