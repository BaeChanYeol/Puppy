package com.spring.puppy.freeboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.puppy.command.BoastBoardVO;
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
		
		//파일까지 수정
		void update2(FreeBoardVO vo);
		
		//삭제
		void delete(int bno);
		
		//조회수 올리기
		public int updateView_cnt(int bno);

		//내가 쓴글 리스트.
		List<FreeBoardVO> getMyList(@Param("id") String id, @Param("page")PageVO page);
		
		//내가 쓴글 개수
		int getMyTotal(@Param("id") String id,@Param("page") PageVO page);
	}

