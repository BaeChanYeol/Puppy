package com.spring.puppy.controller;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.spring.puppy.command.FileVO;
import com.spring.puppy.command.FreeBoardVO;
import com.spring.puppy.freeboard.service.IFreeBoardService;
import com.spring.puppy.util.PageCreator;
import com.spring.puppy.util.PageVO;

@Controller
@RequestMapping("/board")
public class FreeBoardController {

	@Autowired
	private IFreeBoardService service;

	//자유게시판으로 들어가기 위한 겟 매핑	

	@GetMapping("/freeboard")
	public String freeList(PageVO vo, Model model) {

		System.out.println(vo);

		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		List<FreeBoardVO> list = service.getList(vo);
		List<FileVO> fileList = new ArrayList<>();
		System.out.println(list.size());
		System.out.println(list);
		model.addAttribute("boardList",list);
		model.addAttribute("pc", pc);
		System.out.println(pc);	



		/*
		 * for(FreeBoardVO b : list) {
		 * 
		 * if(b.getFileRealName() != null) { String[] fileRealName =
		 * b.getFileRealName().split(" "); String[] fileExtension =
		 * b.getFileExtension().split(" "); for(int i=0; i<fileRealName.length ; i++) {
		 * FileVO file = new FileVO();
		 * 
		 * file.setUserId(b.getWriter()); file.setFileRealName(fileRealName[i]);
		 * file.setFileExtension(fileExtension[i]); fileList.add(file); } }
		 * 
		 * }
		 */

		System.out.println(fileList);

		return "board/freeboard";
	}

	//글쓰기 화면 처리
	@GetMapping("/boardWrite")
	public void boardWrite() {}


	
	@PostMapping("/registForm")
	public String freeRegist(@RequestParam("file") MultipartFile file, FreeBoardVO vo) {
		System.out.println(vo);
		System.out.println("파일 첨부 여부: " + file.getOriginalFilename());
		try {
				
			if(!file.getOriginalFilename().equals("")) {
				//날짜별로 폴더를 생성해서 파일을 관리.
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				Date date = new Date();
				String fileLoca = sdf.format(date);
				//저장할 폴더 경로
				String uploadPath = "C:\\upload\\freeboard" + fileLoca;


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

				FreeBoardVO fbvo = new FreeBoardVO();
				fbvo.setBno(0);
				fbvo.setWriter(vo.getWriter());
				fbvo.setTitle(vo.getTitle());
				fbvo.setContent(vo.getContent());
				fbvo.setRegdate(null);
				fbvo.setUpdatedate(null);
				fbvo.setViewCnt(0);
				fbvo.setUploadPath(uploadPath);
				fbvo.setPhotoSize(size);
				fbvo.setFileRealName(fileName);         
				fbvo.setFileLoca(fileLoca);
				fbvo.setFileExtension(fileExtention);

				service.regist(fbvo);
				System.out.println(fbvo);
				return "redirect:/board/freeboard";
			} else {
				FreeBoardVO freeVO = new FreeBoardVO();
				freeVO.setWriter(vo.getWriter());
				freeVO.setTitle(vo.getTitle());
				freeVO.setContent(vo.getContent());
				System.out.println("파일 미첨부 시: " + freeVO);
				service.regist(freeVO);
				return "redirect:/board/freeboard";
			}

			
		}catch (Exception e) {
			System.out.println("업로드 중 에러 발생: " + e.getMessage());
			return "redirect:/board/freeboard"; //에러가 났을 시에는 실패 키워드를 반환.
		}
	}



	//	//글 상세보기 처리
	@GetMapping("/boardDetail")
	public String getContent(@RequestParam int bno, Model model, HttpServletRequest request, HttpServletResponse response,
							@ModelAttribute("p") PageVO vo) {
	      String bnoNum = Integer.toString(bno);
	      //쿠키를 받아올거야 크키가 있는지 확인해서 조회수 조작을 못하게 막을거거든.
	      Cookie userCookie = WebUtils.getCookie(request, "viewCookie");
	      System.out.println(userCookie);//이건 쿠키를 받아오는거야
	        if(userCookie == null) { //쿠키가 없을 때
	           Cookie cookie = new Cookie("viewCookie", bnoNum+"/");//없어서 생성하는거야
	           cookie.setMaxAge(60 * 60);  //쿠키 최대 유효시간 1시간
	           cookie.setHttpOnly(false); 
	           cookie.setPath("/puppy/board");
	            System.out.println(cookie);
	           response.addCookie(cookie);  //응답헤더에 쿠키를 추가하는거.
	            
	            service.updateView_cnt(bno);
	        } else {                  //쿠키가 있을 때
	           if(!userCookie.getValue().contains(bnoNum+"/")) {   //bno를 포함하고 있는지.
	              userCookie.setValue(userCookie.getValue()+ bnoNum + "/"); 
	              userCookie.setMaxAge(60 * 60);
	              response.addCookie(userCookie);  //응답헤더에 쿠키를 추가하는거.
	              service.updateView_cnt(bno);
	           }
	           
	        }
		
			model.addAttribute("article", service.getContent(bno));
			return "board/boardDetail";
	}




	//글 수정 페이지 이동
	@GetMapping("/boardModify")
	public void modify(@RequestParam int bno, Model model) {
		model.addAttribute("article", service.getContent(bno));
	}

	//글 수정 처리
	@PostMapping("/freeUpdate")
	public String freeUpdate(FreeBoardVO vo, RedirectAttributes ra) {
		System.out.println(vo);
		service.update(vo);
		ra.addFlashAttribute("msg", "updateSuccess");

		return "redirect:/board/freeboard";
	}

	@PostMapping("/freeDelete")
	public String freeDelete(int bno, RedirectAttributes ra) {
		System.out.println("동민: "+bno);
		service.delete(bno);

		ra.addFlashAttribute("msg", "게시글이 정상 삭제되었습니다.");

		return "redirect:/board/freeboard";
	}

	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(@RequestParam("fileLoca") String fileLoca,
			@RequestParam("fileName") String fileName) {
		System.out.println("fileName: " + fileName);
		System.out.println("fileLoca: " + fileLoca);
		File file = new File("C:\\upload\\freeboard" + fileLoca + "\\" + fileName + "\\");
		System.out.println(file);

		ResponseEntity<byte[]> result = null;
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

		return result;
	}



}
