package com.spring.puppy.qnaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.puppy.command.QnaBoardVO;
import com.spring.puppy.qnaboard.mapper.IQnaBoardMapper;
import com.spring.puppy.util.PageVO;

@Service
public class QnaBoardService implements IQnaBoardService{
	
	@Autowired
	private IQnaBoardMapper mapper;
	
	
	@Override
	public void qnaRegist(QnaBoardVO vo) {
		mapper.qnaRegist(vo);
		
	}
	
	
//	@Override
//	public List<QnaBoardVO> getList() {
//		
//		return mapper.getList();
//	}


	@Override
	public List<QnaBoardVO> getList(PageVO vo, String writer) {
		return mapper.getList(vo, writer);
	}


	@Override
	public int getTotal(PageVO vo, String writer) {
		return mapper.getTotal(vo, writer);
	}


	
	
	
	
}
