package com.spring.puppy.reply.service;

import java.util.List;

import com.spring.puppy.command.ReplyVO;
import com.spring.puppy.util.PageVO;

public interface IReplyService {

	void replyRegist(ReplyVO vo); //댓글 등록
//	List<ReplyVO> getList(int bno); //목록 요청
	List<ReplyVO> getList(PageVO vo, int bno); //페이징 추가
	int getTotal(int bno); //댓글 개수
	
	int pwCheck(ReplyVO vo); //비밀번호 확인
	void update(ReplyVO vo); //댓글 수정
	void delete(int rno); //댓글 삭제

	
}