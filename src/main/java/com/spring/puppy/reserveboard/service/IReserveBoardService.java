package com.spring.puppy.reserveboard.service;

import java.util.List;

import com.spring.puppy.command.ReserveBoardVO;
import com.spring.puppy.util.PageVO;

public interface IReserveBoardService {
	
	//예약 등록
	void reserveRegist(ReserveBoardVO vo); 
	
	//목록 요청
	List<ReserveBoardVO> getList(PageVO vo, String writer); 
	
	int getTotal(PageVO vo, String writer);
	
	
	
	//삭제 요청
	void delete(int resno);
	
	//수정 요청
	void update(ReserveBoardVO vo);
	
	List<ReserveBoardVO> getAdminList(PageVO vo);
	
	//관리자
	int getAdminTotal(PageVO vo);
}
