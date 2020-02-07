package com.epozen.epozenMall.service.face;

import java.util.List;

import com.epozen.epozenMall.vo.ShopCommentVO;

public interface CommentService {

	void insertComment(ShopCommentVO shopCommentVO);

	List<ShopCommentVO> selectComments(int proNo);

}
