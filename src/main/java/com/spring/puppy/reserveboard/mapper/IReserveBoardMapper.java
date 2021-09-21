package com.spring.puppy.reserveboard.mapper;

import java.util.List;

import com.spring.puppy.command.ReserveBoardVO;

public interface IReserveBoardMapper {
	
		//예약 등록
		void reserveRegist(ReserveBoardVO vo); 
		
		//목록 요청
		List<ReserveBoardVO> getList(); 
		
		//삭제 요청
		void delete(int resno);
		
		//수정 요청
		void update(ReserveBoardVO vo);
}
