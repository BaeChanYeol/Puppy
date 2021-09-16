package com.spring.puppy.qnaboard.service;

import java.util.List;

import com.spring.puppy.command.QnaBoardVO;

public interface IQnaBoardService {
	
	void qnaRegist(QnaBoardVO vo); //qna 등록
	List<QnaBoardVO> getList(); //목록 요청
}
