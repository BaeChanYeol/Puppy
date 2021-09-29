package com.spring.puppy.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

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
	@ResponseBody
	public String login(@RequestBody UserVO inputData,
						HttpSession session, HttpServletResponse response) {
		
		System.out.println(inputData.getId() + inputData.getPw());

		String id = inputData.getId();
		String pw = inputData.getPw();
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		UserVO dbData = service.selectOne(id);
		
		if(dbData != null) {
			if(encoder.matches(pw, dbData.getPw())){
				
				session.setAttribute("login", dbData);
				
				long limitTime = 60 * 60 * 24 * 90;
				
				//아이디 기억하기 체크시 처리
				if(inputData.isIdRemember()) {
					Cookie idCookie = new Cookie("idCookie", inputData.getId());
					idCookie.setPath("/");
					idCookie.setMaxAge((int) (limitTime));
					response.addCookie(idCookie);
				}else {
					Cookie idCookie = new Cookie("idCookie", "");
					idCookie.setPath("/");
					idCookie.setMaxAge(0);
					response.addCookie(idCookie);
				}
				
				//자동 로그인 .
				if(inputData.isAutoLogin()) { //자동 로그인을 희망.
					
					//세션 아이디를 가지고 와서 쿠키에 저장.
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					loginCookie.setPath("/"); //쿠키가 동작할 수 있는 유효한 url
					loginCookie.setMaxAge((int) limitTime); //초로 시간을 받음.
					response.addCookie(loginCookie);
					
					//자동 로그인 유지 시간을 날짜 객체로 변환.(DB에 삽입하기 위해, 밀리초)
					long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
					//Date 객체의 생성자에 매개값으로 밀리초의 시간을 전달하면 날짜 형태로 변경해 줍니다.
					Date limitDate = new Date(expiredDate);
					
					service.keepLogin(session.getId(), limitDate, inputData.getId());
					
				}
				System.out.println("컨트롤러 작업종료");
				return "loginSuccess";
			} else {
				System.out.println("컨트롤러 작업종료");
				return "pwFail";
			}
		}else {
			System.out.println("컨트롤러 작업종료");
			return "idFail";	
		}			
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session, RedirectAttributes ra,
			   HttpServletRequest request,
			   HttpServletResponse response) {

			UserVO user = (UserVO) session.getAttribute("login");
		
			if(user != null) {
	//			session.invalidate();
				session.removeAttribute("login");
				
				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
				if(loginCookie != null) {
					loginCookie.setMaxAge(0);
					loginCookie.setValue(null);
					loginCookie.setPath("/"); //쿠키 생성 시 유효 url을 지정한 경우, 삭제할 때도 명시해 줍니다.
					response.addCookie(loginCookie);
					service.keepLogin("none", new Date(), user.getId());
					
				}
			
			ra.addFlashAttribute("msg", "logout");
			}
			return new ModelAndView("redirect:/");
	}
		
	
	
	
	
	
	
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {		
		
		UserVO vo = (UserVO) session.getAttribute("login");
		model.addAttribute("user", vo);
		
		return "mypage/mypage";		
	}
	@GetMapping("/passwordCheck")
	public String prevMyinfo() {
		
		return "mypage/myinfomodify1";
	}
	
	@PostMapping("/myinfo")
	public String myinfo(HttpSession session, String pw, RedirectAttributes ra, Model model) {
		
		UserVO vo =  (UserVO) session.getAttribute("login");
		UserVO dbData = service.selectOne(vo.getId());
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		
		if(encoder.matches(pw, dbData.getPw())) {
			model.addAttribute("user", vo);
			model.addAttribute("msg", "success");
			return "/mypage/myinfomodify2";
		}else {
			ra.addFlashAttribute("msg", "pwFail");
			return "redirect:/user/passwordCheck";			
		}
		
	}
	
	@PostMapping("/update")
	public String update(UserVO vo, HttpSession session, RedirectAttributes ra) {
		service.updateUser(vo);
		session.removeAttribute("login");
		session.setAttribute("login", service.selectOne(vo.getId())); 
		ra.addFlashAttribute("msg", "updateSuccess");
		return "redirect:/user/mypage";
	}
	
}
