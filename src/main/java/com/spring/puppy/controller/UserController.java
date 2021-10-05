package com.spring.puppy.controller;

import java.util.Date;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	
	@GetMapping("/idFind")
	public String idFind() {
		System.out.println("아이디 찾기로 이동하기 test");
		return "mypage/idFind";
	}
	
	@GetMapping("/pwFind")
	public String pwFind() {
		System.out.println("비밀번호 찾기로 이동하기 test");
		return "mypage/pwFind";
	}
	
	@PostMapping("/idFind")
	public String selectId(UserVO vo, RedirectAttributes ra, Model model) {
		System.out.println("요청들어옴!!!!!");
		System.out.println(vo);
		String id = service.selectId(vo);
		System.out.println(id);
		
		if(id == null) {
			ra.addFlashAttribute("msg", "fail");
			return "redirect:/user/idFind";
			
		}
		model.addAttribute("id", id);
		
		return "mypage/idFindSuccess";
		
	}
	
	
	@PostMapping("/pwFind")
	public String selectPw(UserVO vo, RedirectAttributes ra, Model model) {
		UserVO user = service.selectOne(vo.getId());
		
		
		if(user !=null &&vo.getId().equals(user.getId()) && vo.getName().equals(user.getName()) && vo.getEmail().equals(user.getEmail())) {
			model.addAttribute("user", user);
			model.addAttribute("msg", "인증성공");
			return "mypage/passwordChange";
		}else {
			ra.addFlashAttribute("msg", "pwFindFail");
			return "redirect:/user/pwFind";
		}
		
		
	}
	@PostMapping("/changePassword")
	public String changePassword(String id,String newPw, HttpSession session, RedirectAttributes ra) {
		
		service.changePassword(id, newPw);
		ra.addFlashAttribute("msg", "pwChangeSuccess");
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
	public String mypage() {		

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
		System.out.println(vo);
		service.updateUser(vo);
		session.removeAttribute("login");
		session.setAttribute("login", service.selectOne(vo.getId())); 
		ra.addFlashAttribute("msg", "updateSuccess");
		return "redirect:/user/mypage";
	}
	
	//회원탈퇴
	@GetMapping("/delete")
	public String delete() {
		return "mypage/withdraw";
	}
	
	@PostMapping("/delete")
	public ModelAndView deleteUser(HttpSession session, String pw, RedirectAttributes ra) {
		UserVO vo =  (UserVO) session.getAttribute("login");
		UserVO dbData = service.selectOne(vo.getId());
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		
		if(encoder.matches(pw, dbData.getPw())) {
			service.delete(vo.getId());
			session.removeAttribute("login");
			ra.addFlashAttribute("deleteMsg", "userDeleteSuccess");
			return new ModelAndView("redirect:/");

		}else {
			ra.addFlashAttribute("msg", "userDeleteFail");
			return new ModelAndView("redirect:/user/delete");			
		}
		
	}
	
	   /* 이메일 인증 */
	    @PostMapping("/mailCheck")
	    @ResponseBody
	    public String mailCheckGET(@RequestBody String email) throws Exception{
	        
//	        /* 뷰(View)로부터 넘어온 데이터 확인 */
//	        System.out.println("이메일 데이터 전송 확인");
//	        System.out.println("이메일주소 : " + email);
	        
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;       
//	        System.out.println("인증번호 : " + checkNum);
	        
	        /* 이메일 보내기 */
	        String setFrom = "ourhul@gmail.com";
	        String toMail = email;
	        String title = "똑독 유치원 회원가입 인증 이메일 입니다.";
	        String content = 
	                "똑독유치원을 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	       
	        
	        return Integer.toString(checkNum);
	    }
	   
	
	
	
}
