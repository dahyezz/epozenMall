package com.epozen.epozenMall.dao;

import java.util.List;

import com.epozen.epozenMall.vo.ShopCommentVO;

public interface CommentMapper {

	List<ShopCommentVO> selectComments(int proNo);

	void insertComment(ShopCommentVO shopCommentVO);

}
