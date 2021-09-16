package com.spring.puppy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.puppy.command.QnaBoardVO;
import com.spring.puppy.qnaboard.service.IQnaBoardService;

@Controller
@RequestMapping("/qnaBoard")
public class QnaBoardController {
	
	@Autowired
	private IQnaBoardService service;
	
	@GetMapping("/qna")
	public void qna() {
		System.out.println("/qnaboard/write: GET");
	}
	
//	@GetMapping("/myQna")
//	public void myQna() {
//		System.out.println("/qnaboard/list: GET");
//	}
	
	//글 DB 등록 요청
	@PostMapping("/registForm")
	public String registForm(QnaBoardVO vo, RedirectAttributes ra) {
		service.qnaRegist(vo);
			
		//등록 성공 여부를 1회용으로 전달하기 위한 ra객체의 메서드
		ra.addFlashAttribute("msg", "regSuccess");
		return "redirect:/qnaBoard/myQna";//등록 후에 글 목록 요청으로 리다이렉트
	}
	
	//목록 화면 (링크는 모두 겟맵핑)
	@GetMapping("/myQna")
	public String qnaList(Model model) {
			
		model.addAttribute("qnaList", service.getList());
		return "qnaBoard/myQna";
	}
	

	
	
}
