package com.spring.puppy.reserveboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.puppy.command.ReserveBoardVO;
import com.spring.puppy.reserveboard.mapper.IReserveBoardMapper;
import com.spring.puppy.util.PageVO;

@Service
public class ReserveBoardService implements IReserveBoardService{

	@Autowired
	IReserveBoardMapper mapper;
	
	@Override
	public void reserveRegist(ReserveBoardVO vo) {
		mapper.reserveRegist(vo);	
	}

	@Override
	public List<ReserveBoardVO> getList(PageVO vo, String writer) {

		return mapper.getList(vo, writer);
	}

	@Override
	public void delete(int resno) {
		mapper.delete(resno);
	}

	@Override
	public void update(ReserveBoardVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public int getTotal(PageVO vo, String writer) {
		return mapper.getTotal(vo, writer);
	}

	@Override
	public List<ReserveBoardVO> getAdminList(PageVO vo) {
		return mapper.getAdminList(vo);
	}

	@Override
	public int getAdminTotal(PageVO vo) {
		return mapper.getAdminTotal(vo);
	}

	 


}
