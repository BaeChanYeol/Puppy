package com.spring.puppy.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.puppy.command.ReplyVO;
import com.spring.puppy.reply.mapper.IReplyMapper;
import com.spring.puppy.util.PageVO;

@Service
public class ReplyService implements IReplyService {

	@Autowired
	private IReplyMapper mapper;
	
	@Override
	public void replyRegist(ReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<ReplyVO> getList(PageVO vo, int bno) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("paging", vo);
		datas.put("bno", bno);
	
		return mapper.getList(datas);
	}

	@Override
	public int getTotal(int bno) {
		return mapper.getTotal(bno);
	}

	@Override
	public int pwCheck(ReplyVO vo) {
		return mapper.pwCheck(vo);
	}

	@Override
	public void update(ReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int rno) {
		mapper.delete(rno);
	}

}




