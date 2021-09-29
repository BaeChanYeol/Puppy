package com.spring.puppy.qnaboard.mapper;

import java.util.List;

import com.spring.puppy.command.QnaBoardVO;
import com.spring.puppy.command.ReserveBoardVO;
import com.spring.puppy.util.PageVO;

public interface IQnaBoardMapper {
	
	//qna 등록
	void qnaRegist(QnaBoardVO vo); 
	
	//목록 요청
	//List<QnaBoardVO> getList(); 
	
	//목록 요청
	List<QnaBoardVO> getList(PageVO vo); 
			
	//글 개수 카운트
	int getTotal(PageVO vo);
	
}
