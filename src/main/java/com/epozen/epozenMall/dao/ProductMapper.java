package com.epozen.epozenMall.dao;

import java.util.List;

import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopProductVO;

public interface ProductMapper {

	List<ShopProductVO> selectAll(Paging paging);

	int selectCntAll();

}
