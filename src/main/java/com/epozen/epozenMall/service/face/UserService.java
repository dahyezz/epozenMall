package com.epozen.epozenMall.service.face;

import java.util.List;

import com.epozen.epozenMall.vo.ShopUserVO;
import com.epozen.epozenMall.vo.UserOrderVO;

public interface UserService {
	/**
	 * 로그인 성공 여부 체크
	 * 
	 * @param user - userid, userpw
	 * @return True/False
	 */
	boolean loginCheck(ShopUserVO shopUserVO);

	/**
	 * 로그인 성공한 회원의 유저 정보 가져옴
	 * 
	 * @param user - userid
	 * @return user - 모든 정보 포함
	 */
	ShopUserVO getLoginUser(ShopUserVO shopUserVO);

	/**
	 * 회원 탈퇴
	 * 
	 * @param shopUserVO - userId
	 */
	void withdrawalUser(ShopUserVO shopUserVO);

	/**
	 * 회원 정보 수정
	 * 
	 * @param shopUserVO
	 */
	void updateUser(ShopUserVO shopUserVO);

	/**
	 * 내 주문목록 불러오기
	 * 
	 * @param shopUserVO
	 * @return UserOrderVO -내 주문목록 
	 */
	List<UserOrderVO> getOrderList(ShopUserVO shopUserVO);


}
