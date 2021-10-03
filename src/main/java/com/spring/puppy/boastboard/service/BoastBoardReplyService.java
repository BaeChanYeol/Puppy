package com.spring.puppy.boastboard.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.puppy.command.BoastBoardReplyVO;
import com.spring.puppy.boastboard.mapper.IBoastBoardReplyMapper;
import com.spring.puppy.util.PageVO;

@Service
public class BoastBoardReplyService implements IBoastBoardReplyService {

	@Autowired
	private IBoastBoardReplyMapper mapper;
	
	@Override
	public void replyRegist(BoastBoardReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<BoastBoardReplyVO> getList(PageVO vo, int bbno) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("paging", vo);
		datas.put("bbno", bbno);
	
		return mapper.getList(datas);
	}

	@Override
	public int getTotal(int bbno) {
		return mapper.getTotal(bbno);
	}

	@Override
	public void update(BoastBoardReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int rno) {
		mapper.delete(rno);
	}

}



