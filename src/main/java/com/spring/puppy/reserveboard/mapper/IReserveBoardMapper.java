package com.spring.puppy.reserveboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.puppy.command.ReserveBoardVO;
import com.spring.puppy.util.PageVO;

public interface IReserveBoardMapper {
	
		//예약 등록
		void reserveRegist(ReserveBoardVO vo); 
		
		//목록 요청
		List<ReserveBoardVO> getList(@Param("vo") PageVO vo, @Param("writer") String writer); 
		
		//예약 건 수 카운트
		int getTotal(@Param("vo") PageVO vo, @Param("writer") String writer);
		
		//삭제 요청
		void delete(int resno);
		
		//수정 요청
		void update(ReserveBoardVO vo);
		
		//관리자 
		List<ReserveBoardVO> getAdminList(PageVO vo);
		//관리자
		int getAdminTotal(PageVO vo);
}
