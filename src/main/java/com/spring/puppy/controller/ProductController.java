package com.spring.puppy.controller;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.puppy.command.CartVO;
import com.spring.puppy.command.FreeBoardVO;
import com.spring.puppy.command.OrderDetailVO;
import com.spring.puppy.command.OrderVO;
import com.spring.puppy.command.ProductQnaVO;
import com.spring.puppy.command.ProductVO;
import com.spring.puppy.command.ReviewVO;
import com.spring.puppy.command.UserVO;
import com.spring.puppy.command.ZzimVO;
import com.spring.puppy.product.service.IProductService;
import com.spring.puppy.util.PageCreator;
import com.spring.puppy.util.PageVO;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private IProductService service;
	
	
	//상품 목록 화면 (링크는 모두 겟맵핑)
//	@GetMapping("/item")
//	public String itemList(Model model) {
//				
//		model.addAttribute("itemList", service.productList());
//		return "product/items";
//	}
	// 강아지 용품 목록 화면
	@GetMapping("/items")
	public String itemList(PageVO vo, String type, Model model) {
		
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		
		pc.setArticleTotalCount(service.getpTotal(vo, type));
//		System.out.println("완료");
//		model.addAttribute("itemList", service.productList(vo, type));
		model.addAttribute("itemList", service.productList(vo, type));
//		System.out.println("완료2");
		model.addAttribute("pc", pc);
		
		if(type.equals("i")) {
			return "product/items";			
		}else if(type.equals("s")) {
			return "product/snack";
		}else {
			return "product/medicalDevice";
		}
		

		//model.addAttribute("itemList", service.productList(vo));
		
	}
	
	@PostMapping("/productRegist")
	public String productRegist(@RequestParam("file")MultipartFile file, ProductVO vo, RedirectAttributes ra) {
		
		System.out.println(vo);
		System.out.println("파일 첨부 여부: " + file.getOriginalFilename());
		if(file.getOriginalFilename().equals("")) {
			ra.addFlashAttribute("msg", "fileFail");
			return "redirect:/admin/productadd";
			
		}
		try {
				
				//날짜별로 폴더를 생성해서 파일을 관리.
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				Date date = new Date();
				String fileLoca = sdf.format(date);
				//저장할 폴더 경로
				String uploadPath = "C:\\upload\\product\\" + fileLoca;


				File folder = new File(uploadPath);
				if(!folder.exists()) {
					folder.mkdir(); //폴더가 존재하지 않는다면 생성해라.
				}
				
				//업로드되는 파일의 진짜 이름
				String fileRealName = file.getOriginalFilename();
				//파일의 크기
				long size = file.getSize();
				
				//중복된 파일 이름이 있을 수 있기 때문에 고유한 랜덤 문자열을 생성해서 파일명으로 지정할 것.
				UUID uuid = UUID.randomUUID();
				String uuids = uuid.toString().replaceAll("-", "");
				
				//확장자 뽑아내기.
				String fileExtention = fileRealName.substring(fileRealName.indexOf("."), fileRealName.length());
				
				System.out.println("저장할 폴더 이름: " + uploadPath);
				System.out.println("실제 파일명: " + fileRealName);
				System.out.println("크기: " + size);
				System.out.println("고유한 랜덤 문자: " + uuids);
				System.out.println("확장자: " + fileExtention);
				
				String fileName = uuids + fileExtention;
				System.out.println("변경해서 저장할 파일명: " + fileName);
				
				File saveFile = new File(uploadPath + "\\" + fileName);
				file.transferTo(saveFile);

				//DB에 insert 작업을 진행.

				ProductVO pvo = new ProductVO();
				pvo.setType(vo.getType());
				pvo.setPname(vo.getPname());
				pvo.setCate(vo.getCate());
				pvo.setPrice(vo.getPrice());	
				pvo.setOpt(vo.getOpt());
				pvo.setUploadPath(uploadPath);
				pvo.setPhotoSize(size);
				pvo.setFileRealName(fileName);         
				pvo.setFileLoca(fileLoca);
				pvo.setFileExtension(fileExtention);

				service.productRegist(pvo);
				
				return "redirect:/admin/productadd";

			
		}catch (Exception e) {
			System.out.println("업로드 중 에러 발생: " + e.getMessage());
			return "redirect:/admin/productadd"; //에러가 났을 시에는 실패 키워드를 반환.
		}
	}
		
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(@RequestParam("fileLoca") String fileLoca,
			@RequestParam("fileName") String fileName) {
		System.out.println("fileName: " + fileName);
		System.out.println("fileLoca: " + fileLoca);
		File file = new File("C:\\upload\\freeboard\\" + fileLoca + "\\" + fileName + "\\");
		System.out.println(file);
			ResponseEntity<byte[]> result = null;
			if(!fileLoca.equals("")) {
			try {
				HttpHeaders headers = new HttpHeaders();
				//probeContentType: 파라미터로 전달받은 파일의 타입을 문자열로 반환해 주는 메서드.
				//사용자에게 보여주고자 하는 데이터가 어떤 파일인지를 검사해서 응답 상태 코드를 다르게 리턴할 수도 있습니다.
				headers.add("Content-Type", Files.probeContentType(file.toPath()));
				//ResponseEntity<>(바디에 담을 내용, 헤더에 담을 내용, 상태 메세지)
				//FileCopyUtils: 파일 및 스트림 복사를 위한 간단한 유틸리티 메서드의 집합체.
				//file 객체 안에 있는 내용을 복사해서 byte배열 형태로 바디에 담아서 전달.
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
			
			return result;		
	}	
	
	
	
	
	
	@GetMapping("/paySuccess")
	public String paySuccess(Model model) {	
		
		return "product/paySuccess";
	}
	
	//의료기기 화면
	@GetMapping("/medicalDevice")
	public String medicalDevice(){
		return "product/medicalDevice";
	}
	
	//간식 화면
	@GetMapping("/snack")
	public String snack() {
		return "product/snack";
	}
	//상세보기 화면
	@GetMapping("/detail")
	public void getContent(@RequestParam int pno, HttpSession session, PageVO vo, PageVO vo2, Model model) {
      	
		model.addAttribute("item", service.getContent(pno));
      	System.out.println("pno: "+pno);
      	
      	PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo, pno));
		System.out.println("글개수: "+service.getTotal(vo, pno));
		
		model.addAttribute("reviewList", service.getList(vo, pno));
		model.addAttribute("pc", pc);
		
		
		PageCreator pc2 = new PageCreator();
		pc2.setPaging(vo2);
		pc2.setArticleTotalCount(service.getpqTotal(vo2, pno));
		System.out.println("qna개수: "+service.getpqTotal(vo2, pno));

		
		model.addAttribute("qnaList", service.pqnaList(vo2, pno));
		model.addAttribute("pc2", pc2);
			
	
			
	}
	
	//찜 목록
	@GetMapping("/zzim")
	public String zzimList(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("login");	
		model.addAttribute("zzimList", service.zzimList(user.getId()));
		return "product/zzim";
	}
	
	//찜 DB 등록 요청
	@PostMapping("/zzimRegistForm")
	public String zzimRegistForm(HttpSession session, ZzimVO vo, ProductVO provo, PageVO pvo, Model model, RedirectAttributes ra) {
		UserVO user = (UserVO) session.getAttribute("login");
		
		int pno = vo.getPno();
		vo.setWriter(user.getId());
		
		if(service.zzimCheck(vo) == 0) { //찜이 안된 상태일 때 찜하기 
			service.zzimRegist(vo);
			service.zzimModify(provo);
			
			//System.out.println("vo: "+vo.getPname());
		} else { //찜 취소하기
			//ra.addFlashAttribute("msg", "이미 찜한 상품입니다!");
			service.zzimModify(provo);
			
			service.zzimdelete(vo);
			return "redirect:/product/detail?pno="+pno;
		}
	

		//등록 성공 여부를 1회용으로 전달하기 위한 ra객체의 메서드
		//ra.addFlashAttribute("msg", "regSuccess");
		//return "redirect:/product/zzim";//등록 후에 글 목록 요청으로 리다이렉트
		return "redirect:/product/detail?pno="+pno;
	}
	
	//찜 상품 삭제 처리
	@RequestMapping(value="/zzimDelete/{pno}", method=RequestMethod.GET)
	public String zzimDelete(HttpSession session, @PathVariable int pno, ZzimVO vo, RedirectAttributes ra) {
		UserVO user = (UserVO) session.getAttribute("login");
		vo.setPno(pno);
		vo.setWriter(user.getId());
		service.zzimdelete(vo);
		//ra.addFlashAttribute("msg", "해당 상품이 정상 삭제되었습니다.");
		return "redirect:/product/zzim";
	}
	
	
	//리뷰 DB 등록 요청
	@PostMapping("/reviewRegistForm")
	public String reviewRegistForm(ReviewVO vo, PageVO pvo, Model model, RedirectAttributes ra) {
		int pno = vo.getPno();
		service.reviewRegist(vo);
		
		
		//등록 성공 여부를 1회용으로 전달하기 위한 ra객체의 메서드
		//ra.addFlashAttribute("msg", "regSuccess");
		return "redirect:/product/detail?pno="+pno+"#reviews";//등록 후에 글 목록 요청으로 리다이렉트
	}
	
	//상품 qna DB 등록 요청
	@PostMapping("/qnaRegistForm")
	public String qnaRegistForm(ProductQnaVO vo, PageVO pvo, Model model, RedirectAttributes ra) {
		int pno = vo.getPno();
		service.pqnaRegist(vo);
		
		
		//등록 성공 여부를 1회용으로 전달하기 위한 ra객체의 메서드
		//ra.addFlashAttribute("msg", "regSuccess");
		return "redirect:/product/detail?pno="+pno+"#qna";//등록 후에 글 목록 요청으로 리다이렉트
	}
	
	
	

	
	//상품 장바구니 담기 처리
	@PostMapping("/registForm")
	public String registForm(CartVO vo, RedirectAttributes ra) {
		int pno = vo.getPno();
		
		if(service.cartCheck(vo) == 0) {
			service.regist(vo);
			//System.out.println("vo: "+vo.getPname());
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
	public String cartList(HttpSession session, Model model) {
			
		UserVO user = (UserVO) session.getAttribute("login");
		
		model.addAttribute("cartList", service.cartList(user.getId()));
		return "product/basket";
	}
	
	
	//선택한 상품들 장바구니 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session,
	     @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
		UserVO user = (UserVO) session.getAttribute("login");
		int result = 0;
		int cartNum = 0;
		for(String i : chArr) {   //상품 번호 이용
			cartNum = Integer.parseInt(i);
			cart.setPno(cartNum);
//			System.out.println(cartNum);
			cart.setWriter(user.getId());
			service.delete(cart);
		}   
		result = 1; 
	  	return result;  
	}
	
	//단일 상품 삭제 처리
	@RequestMapping(value="/itemDelete/{pno}", method=RequestMethod.GET)
	public String singleDelete(HttpSession session, @PathVariable int pno, CartVO cart, RedirectAttributes ra) {
		UserVO user = (UserVO) session.getAttribute("login");
		cart.setPno(pno);
		cart.setWriter(user.getId());
//		service.delete(cart, user.getId());
		service.delete(cart);
		//ra.addFlashAttribute("msg", "해당 상품이 정상 삭제되었습니다.");
		return "redirect:/product/basket";
	}

	int pCount = 0;

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
				pCount++;
			}
		}
		
		model.addAttribute("orderList",orderList);
		
		UserVO vo = (UserVO) session.getAttribute("login");
		//model.addAttribute("users", vo);
		
		//세션에도 저장
		session.setAttribute("orderList", orderList);
		System.out.println(session.getAttribute("orderList"));
		//System.out.println(session.getAttribute("orderList").equals(obj));
		return "product/orderpage";
	}
	
	@GetMapping("/pay")
	public String pay(Model model, HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("login");
		model.addAttribute("users", vo);		
		
		return "product/pay";
	}
	
	//
	@PostMapping("/orderRegistForm")
	public String orderRegistForm(Model model, HttpSession session, CartVO cvo, OrderVO ovo, OrderDetailVO detailvo) {
		
		// 주문 번호는 하나만 생성하기
		service.orderRegist(ovo);
		
		//OrderVO OVO = (OrderVO) model.addAttribute(ovo);
		//System.out.println("ono: "+ service.getOrderno(ovo) );
		
		@SuppressWarnings("unchecked")
		List<ProductVO> list = (List<ProductVO>) session.getAttribute("orderList");
		
		// 주문 번호에 상품 내역 등록하기
		for (int i = 0; i < list.size(); i++) {
			
			//System.out.println(list.get(i).getAmount());
			detailvo.setAmount(list.get(i).getAmount());
			detailvo.setPno(list.get(i).getPno());
			detailvo.setPrice(list.get(i).getPrice());
			detailvo.setPname(list.get(i).getPname());
			detailvo.setOno(service.getOrderno(ovo));
			
			service.orderDetailRegist(detailvo);
			//System.out.println("pno: "+  );
			service.cartReset(cvo);
		}
		

		return "redirect:/product/buylist";
	

	}
	
	
	//구매 내역 보여주는 화면
	@GetMapping("/buylist")
	public String buylist(PageVO vo, Model model) {
		
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
//		pc.setArticleTotalCount(service.getOrderTotal(vo));
		
		List<OrderVO> list = service.orderDateList(vo);
		List<Long> list2 = new ArrayList<>();
		 
		for(OrderVO ovo : list) {
			list2.add(ovo.getRegdate().getTime());
		}
		
		
		model.addAttribute("dateList", list2);
		model.addAttribute("buyList", service.orderDetailList(vo));
		model.addAttribute("buyList2", service.orderDateList(vo));
		model.addAttribute("pc", pc);
		
		return "product/buylist";
	}
	
}
