package com.spring.puppy.boastboard.service;

import java.util.List;

import com.spring.puppy.command.BoastBoardReplyVO;
import com.spring.puppy.util.PageVO;

public interface IBoastBoardReplyService {

	void replyRegist(BoastBoardReplyVO vo); //댓글 등록
//	List<ReplyVO> getList(int bno); //목록 요청
	List<BoastBoardReplyVO> getList(PageVO vo, int bbno); //페이징 추가
	int getTotal(int bbno); //댓글 개수
	
	void update(BoastBoardReplyVO vo); //댓글 수정
	void delete(int rno); //댓글 삭제

	
}
