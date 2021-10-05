package com.spring.puppy.qnaboard.service;

import java.util.List;

import com.spring.puppy.command.QnaBoardVO;
import com.spring.puppy.util.PageVO;

public interface IQnaBoardService {
	
	void qnaRegist(QnaBoardVO vo); //qna 등록
	//List<QnaBoardVO> getList(); //목록 요청
	
	//목록 요청
	List<QnaBoardVO> getList(PageVO vo, String writer); 
			
	//글 개수 카운트
	int getTotal(PageVO vo , String writer);

}
