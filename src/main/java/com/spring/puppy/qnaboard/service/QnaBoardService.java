package com.spring.puppy.qnaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.puppy.command.QnaBoardVO;
import com.spring.puppy.qnaboard.mapper.IQnaBoardMapper;

@Service
public class QnaBoardService implements IQnaBoardService{
	
	@Autowired
	private IQnaBoardMapper mapper;
	
	
	@Override
	public void qnaRegist(QnaBoardVO vo) {
		mapper.qnaRegist(vo);
		
	}
	
	
	@Override
	public List<QnaBoardVO> getList() {
		
		return mapper.getList();
	}
	
	
	
}
