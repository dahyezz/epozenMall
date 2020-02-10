package com.epozen.epozenMall.service.face;

import java.util.List;
import java.util.Map;

import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopCommentVO;

public interface CommentService {

	void insertComment(ShopCommentVO shopCommentVO);

	List<ShopCommentVO> selectComments(Paging paging);

	Paging getCurPage(Map<String, Object> map);

	int getCommentCnt(int proNo);

}
