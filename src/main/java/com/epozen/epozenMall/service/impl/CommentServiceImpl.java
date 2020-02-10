package com.epozen.epozenMall.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epozen.epozenMall.dao.CommentMapper;
import com.epozen.epozenMall.service.face.CommentService;
import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopCommentVO;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentMapper commentMapper;
	
	@Override
	public List<ShopCommentVO> selectComments(Paging paging){
		return commentMapper.selectComments(paging);
	}
	
	@Override
	public void insertComment(ShopCommentVO shopCommentVO) {
		commentMapper.insertComment(shopCommentVO);
	}
	
	@Override
	public Paging getCurPage(Map<String, Object> map) {
		
		int totalCount = commentMapper.selectCntAllComment((int) map.get("proNo"));
		int curPage = Integer.parseInt(map.get("curPage").toString());
		int listCount = 10;
		int proNo = Integer.parseInt(map.get("proNo").toString());
		
		Paging paging = new Paging(totalCount, curPage, listCount,proNo);

		return paging;		
	}
	
	@Override
	public int getCommentCnt(int proNo) {
		return commentMapper.selectCntAllComment(proNo);
	}
}
