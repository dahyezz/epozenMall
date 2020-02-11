package com.epozen.epozenMall.dao;

import java.util.List;

import com.epozen.epozenMall.vo.ShopUserVO;
import com.epozen.epozenMall.vo.UserOrderVO;

public interface UserMapper {

	/**
	 * 로그인 체크 
	 * id와 pw로 db조회하여 select count(*)
	 * 
	 * @param shopUserVO
	 * @return 1 - 로그인 성공, 0 - 로그인 실패
	 */
	int selectCntUserByUserId(ShopUserVO shopUserVO);

	/**
	 * 로그인 성공한 회원의 정보 가져옴
	 * 
	 * @param shopUserVO - userId 존재
	 * @return shopUserVO - user 모든 정보
	 */
	ShopUserVO selectUserByUserId(ShopUserVO shopUserVO);

	/**
	 * db에서 회원 삭제
	 * 
	 * @param shopUserVO - userId로 삭제
	 */
	void deleteUserByUserId(ShopUserVO shopUserVO);

	/**
	 * 회원 정보 수정 -> db update
	 * 
	 * @param shopUserVO
	 */
	void updateUserByUserId(ShopUserVO shopUserVO);

	/**
	 * 내 주문 갯수 확인
	 * 
	 * @param shopUserVO - userId
	 * @return int - count
	 */
	int selectCntOrderByUserId(ShopUserVO shopUserVO);

	/**
	 * 내 주문 목록 조회
	 * 
	 * @param shopUserVO
	 * @return
	 */
	List<UserOrderVO> selectOrderByUserId(ShopUserVO shopUserVO);

	void insertUser(ShopUserVO shopUserVO);

	int idCheck(ShopUserVO shopUserVO);


}
