package com.spring.puppy.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.puppy.admin.mapper.IAdminMapper;
import com.spring.puppy.command.UserVO;
import com.spring.puppy.util.PageVO;

@Service
public class AdminService implements IAdminService {
	
	@Autowired
	private IAdminMapper mapper;
	

	@Override
	public List<UserVO> getmemberlist(PageVO vo) {
		return mapper.getmemberlist(vo);
	}

	@Override
	public void getmemberdel(String id) {
		mapper.getmemberdel(id);
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}
	
	

}
