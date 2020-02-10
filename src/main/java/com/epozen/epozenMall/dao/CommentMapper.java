package com.epozen.epozenMall.dao;

import java.util.List;

import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopCommentVO;

public interface CommentMapper {

	List<ShopCommentVO> selectComments(Paging paging);

	void insertComment(ShopCommentVO shopCommentVO);

	int selectCntAllComment(int proNo);

	
}
