package com.epozen.epozenMall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epozen.epozenMall.dao.CommentMapper;
import com.epozen.epozenMall.service.face.CommentService;
import com.epozen.epozenMall.vo.ShopCommentVO;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentMapper commentMapper;
	
	@Override
	public List<ShopCommentVO> selectComments(int proNo){
		return commentMapper.selectComments(proNo);
	}
	
	@Override
	public void insertComment(ShopCommentVO shopCommentVO) {
		commentMapper.insertComment(shopCommentVO);
	}
}
