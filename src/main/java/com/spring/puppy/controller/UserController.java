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

import com.spring.puppy.boastboard.service.BoastBoardService;
import com.spring.puppy.command.UserVO;
import com.spring.puppy.freeboard.service.FreeBoardService;
import com.spring.puppy.user.service.UserService;
import com.spring.puppy.util.PageCreator;
import com.spring.puppy.util.PageVO;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService service;
	@Autowired
	private FreeBoardService boardService;
	@Autowired
	private BoastBoardService  boastService;
	
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
		System.out.println("????????? ????????? ???????????? test");
		return "mypage/idFind";
	}
	
	@GetMapping("/pwFind")
	public String pwFind() {
		System.out.println("???????????? ????????? ???????????? test");
		return "mypage/pwFind";
	}
	
	@PostMapping("/idFind")
	public String selectId(UserVO vo, RedirectAttributes ra, Model model) {
		System.out.println("???????????????!!!!!");
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
			model.addAttribute("msg", "????????????");
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
				
				//????????? ???????????? ????????? ??????
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
				
				//?????? ????????? .
				if(inputData.isAutoLogin()) { //?????? ???????????? ??????.
					
					//?????? ???????????? ????????? ?????? ????????? ??????.
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					loginCookie.setPath("/"); //????????? ????????? ??? ?????? ????????? url
					loginCookie.setMaxAge((int) limitTime); //?????? ????????? ??????.
					response.addCookie(loginCookie);
					
					//?????? ????????? ?????? ????????? ?????? ????????? ??????.(DB??? ???????????? ??????, ?????????)
					long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
					//Date ????????? ???????????? ??????????????? ???????????? ????????? ???????????? ?????? ????????? ????????? ?????????.
					Date limitDate = new Date(expiredDate);
					
					service.keepLogin(session.getId(), limitDate, inputData.getId());
					
				}
				System.out.println("???????????? ????????????");
				return "loginSuccess";
			} else {
				System.out.println("???????????? ????????????");
				return "pwFail";
			}
		}else {
			System.out.println("???????????? ????????????");
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
					loginCookie.setPath("/"); //?????? ?????? ??? ?????? url??? ????????? ??????, ????????? ?????? ????????? ?????????.
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
	
	//????????????
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
	
	   /* ????????? ?????? */
	    @PostMapping("/mailCheck")
	    @ResponseBody
	    public String mailCheckGET(@RequestBody String email) throws Exception{
	        
//	        /* ???(View)????????? ????????? ????????? ?????? */
//	        System.out.println("????????? ????????? ?????? ??????");
//	        System.out.println("??????????????? : " + email);
	        
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;       
//	        System.out.println("???????????? : " + checkNum);
	        
	        /* ????????? ????????? */
	        String setFrom = "ourhul@gmail.com";
	        String toMail = email;
	        String title = "?????? ????????? ???????????? ?????? ????????? ?????????.";
	        String content = 
	                "?????????????????? ?????????????????? ???????????????." +
	                "<br><br>" + 
	                "?????? ????????? " + checkNum + "?????????." + 
	                "<br>" + 
	                "?????? ??????????????? ???????????? ???????????? ???????????? ?????????.";
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
	   
	    @GetMapping("/myBoard")
	    public String myBoard(Model model, PageVO page, HttpSession session) {
	    	
	    	UserVO vo = (UserVO) session.getAttribute("login");
	    	String id = vo.getId();
	    	PageCreator freePc = new PageCreator();
	    	page.setPageNum(page.getPageNum());
	    	page.setCountPerPage(5);
	    	freePc.setPaging(page);
	    	freePc.setArticleTotalCount(boardService.getMyTotal(id, page));
	    	model.addAttribute("freeList", boardService.getMyList(id, page));
	    	
	    	
	    	PageCreator boastPc = new PageCreator();
	    	page.setPageNum(page.getPageNum());
	    	page.setCountPerPage(6);
	    	boastPc.setPaging(page);
	    	boastPc.setArticleTotalCount(boastService.getMyTotal(id, page));
	    	model.addAttribute("freePc", freePc);
	    	model.addAttribute("boastPc", boastPc);
	    	model.addAttribute("boastList", boastService.getMyList(id, page));
	    	
	    	return "mypage/myBoard";
	    }
	
	
	
}
