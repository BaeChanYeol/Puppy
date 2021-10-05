package com.spring.puppy.admin.mapper;

import java.util.List;

import com.spring.puppy.command.UserVO;
import com.spring.puppy.util.PageVO;

public interface IAdminMapper {

	//회원목록가져오기
	List<UserVO> getmemberlist(PageVO vo);
	
	//회원탈퇴시키기
	void getmemberdel(String id);
	
	//총 게시물 수
	int getTotal(PageVO vo);
	
}
