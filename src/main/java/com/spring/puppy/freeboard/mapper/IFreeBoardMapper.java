package com.spring.puppy.freeboard.mapper;

import java.util.List;

import com.spring.puppy.command.FreeBoardVO;
import com.spring.puppy.util.PageVO;


public interface IFreeBoardMapper {
	
		//글 등록
		void regist(FreeBoardVO vo);
		
		//글 목록
		List<FreeBoardVO> getList(PageVO vo);
		
		//총 게시물 수
		int getTotal(PageVO vo);
		
		//상세보기
		FreeBoardVO getContent(int bno);
		
		//수정
		void update(FreeBoardVO vo);
		
		//삭제
		void delete(int bno);
		
		//조회수 올리기
		public int updateView_cnt(int bno);

	}

