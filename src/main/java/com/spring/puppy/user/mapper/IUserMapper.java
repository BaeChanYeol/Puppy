package com.spring.puppy.user.mapper;

import com.spring.puppy.command.UserVO;


public interface IUserMapper {

		//아이디 중복 확인
		int idCheck(String id);
		
		//회원 가입
		void join(UserVO vo);
		
		//회원정보 조회
		UserVO selectOne(String id);	
		
		//회원 정보 얻어오기
		UserVO getInfo(String id);
		
		//회원 정보 수정
		void updateUser(UserVO vo);
	
}
