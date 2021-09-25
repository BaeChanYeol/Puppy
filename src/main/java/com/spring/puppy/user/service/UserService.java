package com.spring.puppy.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.puppy.command.UserVO;
import com.spring.puppy.user.mapper.IUserMapper;

@Service
public class UserService implements IUserService {

	@Autowired
	private IUserMapper mapper;
	
	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}

	@Override
	public void join(UserVO vo) {
		//회원 비밀번호를  암호화 인코딩
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		//비밀번호를 암호화 해서 user객체에 다시 저장하기.
		String securePW = encoder.encode(vo.getPw());		
		vo.setPw(securePW);		
		mapper.join(vo);
	}

	@Override
	public UserVO selectOne(String id) {
		return null;
	}

	@Override
	public UserVO getInfo(String id) {
		return null;
	}

	@Override
	public void updateUser(UserVO vo) {
		
	}

	
	
	
}
