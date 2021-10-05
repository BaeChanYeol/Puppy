package com.spring.puppy.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.puppy.admin.service.IAdminService;
import com.spring.puppy.command.CartVO;
import com.spring.puppy.command.ProductQnaVO;
import com.spring.puppy.command.UserVO;
import com.spring.puppy.product.service.IProductService;
import com.spring.puppy.reserveboard.service.IReserveBoardService;
import com.spring.puppy.util.PageCreator;
import com.spring.puppy.util.PageVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private IAdminService service;
	
	@Autowired
	private IReserveBoardService reserveService;
	
	@Autowired
	private IProductService productService;
	
	 //관리자페이지	
    @GetMapping("/membertable")
	public String getmemberlist(PageVO vo, Model model) {
    	
    	PageCreator pc = new PageCreator();
    	pc.setPaging(vo);
    	pc.setArticleTotalCount(service.getTotal(vo));
		
    	System.out.println(vo);
    	System.out.println("아진짜:" + service.getmemberlist(vo));
    	System.out.println("아진짜2:" + service.getTotal(vo));
    	model.addAttribute("user", service.getmemberlist(vo));
    	model.addAttribute("pc", pc);
    	System.out.println(pc);
    	System.out.println(model);
		
		
		return "admin/membertable";
	}

    @PostMapping("/memberDelete")
    @ResponseBody
	public String memberDel(@RequestBody UserVO vo) {
    	String id = vo.getId();
    	System.out.println(id);
		service.getmemberdel(id);
				
		return "memberdeleteok";
	}
    
    @GetMapping("/reservequestion")
    public String reservequestion(PageVO vo, Model model) {
    	
    	PageCreator pc = new PageCreator();
    	pc.setPaging(vo);
    	pc.setArticleTotalCount(reserveService.getAdminTotal(vo));
    	model.addAttribute("pc", pc);
    	model.addAttribute("reserveList", reserveService.getAdminList(vo));
    	
    	return "admin/reservequestion";
    }
    
    @GetMapping("/productquestion")
    public String productquestion(PageVO vo, Model model) {
    	
    	PageCreator pc = new PageCreator();
    	pc.setPaging(vo);
    	pc.setArticleTotalCount(productService.getAdminTotal(vo));
    	model.addAttribute("pc", pc);
    	model.addAttribute("qnaList", productService.adminPQna(vo));
    	
    	return "admin/productquestion";
    }
    
    @GetMapping("/questionanswer")
    public void questionanswer(@RequestParam int pno, PageVO vo, Model model) {
    	
    	model.addAttribute("item", productService.getAdminPqna(pno));
      	System.out.println("pno: "+pno);
    	
    }
    
    @PostMapping("/registForm")
	public String registForm(ProductQnaVO vo, RedirectAttributes ra) {
		int pno = vo.getPno();
		String answer =vo.getAnswer();
		productService.registAnswer(pno, answer);

		return "redirect:/admin/productquestion";
	}
    
	
	

}
