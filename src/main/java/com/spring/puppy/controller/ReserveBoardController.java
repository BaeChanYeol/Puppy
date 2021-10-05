package com.spring.puppy.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.puppy.command.ReserveBoardVO;
import com.spring.puppy.command.UserVO;
import com.spring.puppy.reserveboard.service.IReserveBoardService;
import com.spring.puppy.util.PageCreator;
import com.spring.puppy.util.PageVO;

@Controller
@RequestMapping("/reserveBoard")
public class ReserveBoardController {
	
	@Autowired
	private IReserveBoardService service;
	
	@GetMapping("/reserve")
	public void reserve(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("login");	
		System.out.println("/reserveboard/write: GET");
	}
	
	
	//예약 DB 등록 요청
	@PostMapping("/registForm")
	public String registForm(HttpSession session, ReserveBoardVO vo, RedirectAttributes ra) {
		UserVO user = (UserVO) session.getAttribute("login");	
		
		service.reserveRegist(vo);
			
		//등록 성공 여부를 1회용으로 전달하기 위한 ra객체의 메서드
		ra.addFlashAttribute("msg", "regSuccess");
		return "redirect:/reserveBoard/reserveList";//등록 후에 글 목록 요청으로 리다이렉트
	}
	
	//예약 목록 화면 (링크는 모두 겟맵핑)
		@GetMapping("/reserveList")
		public String reserveList(HttpSession session, PageVO vo, Model model) {
			UserVO user = (UserVO) session.getAttribute("login");	
			
			PageCreator pc = new PageCreator();
			pc.setPaging(vo);
			pc.setArticleTotalCount(service.getTotal(vo, user.getId()));
			
			
			List<ReserveBoardVO> list = service.getList(vo, user.getId());
			String[] chkList = new String[list.size()];
			int i=0;
			for(ReserveBoardVO rvo : list) {
				
				String checkIn = rvo.getChkIn().replace("-", "");						
				int temp = Integer.parseInt(checkIn);
				temp = temp - 1;		
				checkIn = Integer.toString(temp);
				checkIn = checkIn.substring(0,4) + "-" + checkIn.substring(4,6) + "-" + checkIn.substring(6,8);			
				
				chkList[i] = checkIn;
				i++;
//				System.out.println(Arrays.toString(chkList));
				
			}

			model.addAttribute("reserveList", service.getList(vo, user.getId()));
			model.addAttribute("chkList", chkList);
			
			model.addAttribute("pc", pc);
			
			return "reserveBoard/reserveList";
		}
	
	//예약 목록 화면 (링크는 모두 겟맵핑)
//	@GetMapping("/reserveList")
//	public String reserveList(Model model) {
//		List<ReserveBoardVO> list = service.getList();
//		String[] chkList = new String[list.size()];
//		int i=0;
//		for(ReserveBoardVO vo :list) {
//			String checkIn = vo.getChkIn().replace("-", "");						
//			int temp = Integer.parseInt(checkIn);
//			temp = temp - 1;		
//			checkIn = Integer.toString(temp);
//			checkIn = checkIn.substring(0,4) + "-" + checkIn.substring(4,6) + "-" + checkIn.substring(6,8);			
//			
//			chkList[i] = checkIn;
//			i++;
//			
//		}
//
//		model.addAttribute("reserveList", list);
//		model.addAttribute("chkList", chkList);
//		
//		return "reserveBoard/reserveList";
//	}
	
		//예약 삭제 처리
//		@PostMapping("/reserveDelete")
//		public String reserveDelete(ReserveBoardVO vo, RedirectAttributes ra) {
//			System.out.println(vo.getResNo());
//			service.delete(vo.getResNo());
//			ra.addFlashAttribute("msg", "해당 예약이 정상 삭제되었습니다.");
//			return "redirect:/reserveBoard/reserveList";
//		}
		
		//예약 삭제 처리
		@RequestMapping(value="/reserveDelete/{resno}", method=RequestMethod.GET)
		public String reserveDelete(HttpSession session, @PathVariable int resno, RedirectAttributes ra) {
//			System.out.println(resno);
			UserVO user = (UserVO) session.getAttribute("login");
			//vo.setWriter(user.getId());
			service.delete(resno);
			ra.addFlashAttribute("msg", "해당 예약이 정상 삭제되었습니다.");
			return "redirect:/reserveBoard/reserveList";
		}
		
		
	

	
	
}
