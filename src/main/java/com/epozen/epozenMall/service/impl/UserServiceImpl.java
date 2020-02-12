package com.epozen.epozenMall.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epozen.epozenMall.dao.UserMapper;
import com.epozen.epozenMall.service.face.UserService;
import com.epozen.epozenMall.util.Paging;
import com.epozen.epozenMall.vo.ShopUserVO;
import com.epozen.epozenMall.vo.UserOrderVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired UserMapper userMapper;
	
	@Override
	public boolean loginCheck(ShopUserVO shopUserVO) {
		if(userMapper.selectCntUserByUserId(shopUserVO) > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public ShopUserVO getLoginUser(ShopUserVO shopUserVO) {
		return userMapper.selectUserByUserId(shopUserVO);
	}
	
	@Override
	public void withdrawalUser(ShopUserVO shopUserVO) {
		userMapper.deleteUserByUserId(shopUserVO);
	}
	
	@Override
	public void updateUser(ShopUserVO shopUserVO) {
		userMapper.updateUserByUserId(shopUserVO);
	}
	
	@Override
	public List<UserOrderVO> getOrderList(Paging paging) {
		return userMapper.selectOrderByUserId(paging);
	}
	
	@Override
	public void register(ShopUserVO shopUserVO) {
		userMapper.insertUser(shopUserVO);
	}
	
	@Override
	public int idCheck(ShopUserVO shopUserVO) {
		return userMapper.idCheck(shopUserVO);
	}
	
	@Override
	public Paging getcurPage(Map<String, Object> map) {
		int totalCount = userMapper.selectCntOrderByUserId(map);
		int curPage = Integer.parseInt(map.get("curPage").toString());
		int listCount = 5;
		
		Paging paging = new Paging(totalCount, curPage, listCount);
		paging.setUserId(map.get("userId").toString());
		return paging;
	}
	
}
