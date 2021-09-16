package com.spring.puppy.qnaboard.mapper;

import java.util.List;

import com.spring.puppy.command.QnaBoardVO;

public interface IQnaBoardMapper {
	
	void qnaRegist(QnaBoardVO vo); //qna 등록
	List<QnaBoardVO> getList(); //목록 요청
}
