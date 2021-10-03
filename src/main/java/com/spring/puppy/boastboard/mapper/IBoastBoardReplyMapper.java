package com.spring.puppy.boastboard.mapper;

import java.util.List;
import java.util.Map;

import com.spring.puppy.command.BoastBoardReplyVO;

public interface IBoastBoardReplyMapper {
	
	void replyRegist(BoastBoardReplyVO vo); //댓글 등록
	//List<ReplyVO> getList(int bno); //목록 요청
	
	List<BoastBoardReplyVO> getList(Map<String, Object> datas);
	
	int getTotal(int bbno); //댓글 개수
	
	void update(BoastBoardReplyVO vo); //댓글 수정
	
	void delete(int rno); //댓글 삭제

}



