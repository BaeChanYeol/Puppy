package com.spring.puppy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.puppy.command.CartVO;
import com.spring.puppy.command.OrderVO;
import com.spring.puppy.command.ProductVO;
import com.spring.puppy.product.service.IProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private IProductService service;
	
	
	//상품 목록 화면 (링크는 모두 겟맵핑)
	@GetMapping("/item")
	public String itemList(Model model) {
				
		model.addAttribute("itemList", service.productList());
		return "product/items";
	}
	
	//상세보기 화면
	@GetMapping("/detail")
	public void getContent(@RequestParam int pno, Model model) {
	      model.addAttribute("item", service.getContent(pno));
	}
	
	//장바구니 상품 등록 화면
	@PostMapping("/registForm")
	public String registForm(CartVO vo, RedirectAttributes ra) {
		int pno = vo.getPno();
		
		if(service.cartCheck(vo) == 0) {
			service.regist(vo);
		} else {
			ra.addFlashAttribute("msg", "이미 장바구니에 들어있는 상품입니다!");
			return "redirect:/product/detail?pno="+pno;
		}
	
			
		//등록 성공 여부를 1회용으로 전달하기 위한 ra객체의 메서드
		//ra.addFlashAttribute("msg", "regSuccess");
		return "redirect:/product/basket";//등록 후에 글 목록 요청으로 리다이렉트
	}
	
	//장바구니 목록 화면
	@GetMapping("/basket")
	public String cartList(Model model) {
			
		model.addAttribute("cartList", service.cartList());
		return "product/basket";
	}
	
	//장바구니 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session,
	     @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
	 
		int result = 0;
		int cartNum = 0;
		for(String i : chArr) {   //상품 번호 이용
			cartNum = Integer.parseInt(i);
			cart.setPno(cartNum);
//			System.out.println(cartNum);
			service.delete(cart);
		}   
		result = 1; 
	  	return result;  
	}
	
		//선택 상품 가지고 주문 페이지로 이동
		@RequestMapping("/orderpage")
		public String orderForm(Model model, HttpSession session, 
				@RequestParam("buy") int[] pnum,
				@RequestParam("amount") int[] amount) {
			

			//주문한 상품정보를 DB에서 가져오기 
			List<ProductVO> orderList = new ArrayList<>();
			if(pnum != null && amount != null) {
				for (int i = 0; i < pnum.length; i++) {
					int pno = pnum[i];
					ProductVO prod = this.service.selectByPnum(pno);
					//ProductVO에는 수량을 주문수량으로 변경
					prod.setAmount(amount[i]);
					orderList.add(prod);//주문목록에 상품 추가
				}
			}
			
			model.addAttribute("orderList",orderList);
			//세션에도 저장
			session.setAttribute("orderList", orderList);
			return "product/orderpage";
		}
	

}
