package com.spring.puppy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.puppy.command.UserVO;
import com.spring.puppy.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService service;
	
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestBody String id) {
		
		int check = service.idCheck(id);
		
		if(check == 1) {
			return "duplication";
					
		}else {
			return "possibility";
		}
	
	}
	
	@PostMapping("/join")
	public String join(UserVO vo, RedirectAttributes ra) {
		System.out.println(vo);
		service.join(vo);
		ra.addFlashAttribute("msg", "joinSuccess");
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(@RequestBody UserVO inputData,
						HttpSession session) {
		
		System.out.println(inputData.getId() + inputData.getPw());

		String id = inputData.getId();
		String pw = inputData.getPw();
		
		int result = service.idCheck(id);
		
		if(result == 0) {
			return "idFail";
		}else {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			UserVO dbData = service.selectOne(id);
			if(en)
			
			
			
		}
		
		
		
		
		
		return "";
	}
	
	
}
