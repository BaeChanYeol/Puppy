package com.spring.puppy.controller;  //������//

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.apache.ibatis.javassist.bytecode.LineNumberAttribute.Pc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.web.server.authentication.RedirectServerAuthenticationEntryPoint;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.spring.puppy.boastboard.service.BoastBoardService;
import com.spring.puppy.boastboard.service.IBoastBoardService;
import com.spring.puppy.command.BoastBoardVO;
import com.spring.puppy.command.FileVO;
import com.spring.puppy.command.UserVO;
import com.spring.puppy.util.PageCreator;
import com.spring.puppy.util.PageVO;


@Controller
@RequestMapping("/boast")
public class BoastBoardController {

	@Autowired
	private IBoastBoardService service;

	//글쓰기
	@GetMapping("/boastboardWrite")
	public String boastWrite(Model model) {
		System.out.println("BoastBoardController.boardRegist()");
		model.addAttribute("boast", "ddd");
		return "boast/boardWrite";
	}

	//뽐내기 글 DB 등록 요청
	@PostMapping("/registForm")

	public String boastRegist(@RequestParam("file") List<MultipartFile> file,
			@RequestParam("title") String title,
			@RequestParam("content") String content, RedirectAttributes ra, HttpSession session) {
		try {
			UserVO user = (UserVO) session.getAttribute("login");
			String writer = user.getId();
			

			//날짜별로 폴더를 생성해서 파일을 관리.
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();
			String fileLoca = sdf.format(date);

			//저장할 폴더 경로
			//String uploadPath = "C:\\Users\\custom\\Desktop\\upload\\" + fileLoca;
			String uploadPath = "C:\\upload\\boastboard\\" + fileLoca;

			
			File folder = new File(uploadPath);
			if(!folder.exists()) {
				folder.mkdirs(); //폴더가 존재하지 않는다면 생성해라.
			}

			String dbFileName="";
			String dbFileExtension="";
			String boastfileName="";
			String boastExtension = "";
			long boastSize = 0;
			int cnt = 0 ;

			for(MultipartFile f: file) {

				//서버에서 저장할 파일 이름
				String fileRealName = f.getOriginalFilename();
				long size = f.getSize();

				//파일명을 고유한 랜덤 문자로 작성.
				UUID uuid = UUID.randomUUID();
				String uuids = uuid.toString().replaceAll("-", "");

				//확장자
				String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

				System.out.println("파일 제외 내용:" + title + content + writer);
				System.out.println("저장할 폴더: " + uploadPath);
				System.out.println("실제 파일명: " + fileRealName);
				System.out.println("사이즈: " + size);
				System.out.println("폴더명: " + fileLoca);
				System.out.println("확장자: " + fileExtension);
				System.out.println("uuid: " + uuids);

				String fileName = uuids + fileExtension;
				System.out.println("변경해서 저장할 파일명: " + fileName);

				//업로드한 파일을 서버 컴퓨터의 지정한 경로 내에 실제로 저장
				File saveFile = new File(uploadPath + "\\" + fileName);
				f.transferTo(saveFile);

				if(cnt == 0 ) {
					boastfileName = fileName;
					boastExtension = fileExtension;
					boastSize = size;
				}
				dbFileName += fileName + " ";
				dbFileExtension += fileExtension + " ";
				cnt ++;			

			}

			//DB에 insert 작업을 진행.
			BoastBoardVO vo = new BoastBoardVO();
			vo.setBbno(0);
			vo.setWriter(writer);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setRegdate(null);
			vo.setUpdatedate(null);
			vo.setView_cnt(0);
			vo.setLike_cnt(0);
			vo.setUploadPath(uploadPath);
			vo.setPhotoSize(boastSize);
			vo.setFileRealName(boastfileName);			
			vo.setFileLoca(fileLoca);
			vo.setFileExtension(boastExtension);
			service.boastRegist(vo);

			FileVO fvo = new FileVO();			
			fvo.setBbno(service.getBbno());
			fvo.setFileRealName(dbFileName);
			fvo.setFileLoca(fileLoca);
			fvo.setFileExtension(dbFileExtension);
			fvo.setUploadPath(uploadPath);
			service.fileRegist(fvo);
			ra.addFlashAttribute("msg", "boastRegistSuccess");
			return "redirect:/boast/boastboard";
		}catch (Exception e) {
			System.out.println("업로드 중 에러 발생: " + e.getMessage());
			ra.addFlashAttribute("msg", "boastRegistFail");
			return "/boast/boastboard" ; //에러가 났을 시에는 실패 키워드를 반환.
		}
	}



	//뽐내기 글 목록 화면
	@GetMapping("/boastboard")
	public String boastList(PageVO vo, Model model) {

		vo.setCountPerPage(9);
		System.out.println(vo);
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));

		model.addAttribute("boastList",service.getList(vo));
		model.addAttribute("pc", pc);
		//	      model.addAttribute("fileList", fileList);
		System.out.println(pc);   
		return "boast/boastboard";
	}

	//글 상세
	@GetMapping("/boastDetail")
	@ResponseBody
	public Map<String, Object> getContent(@RequestParam int bbno, Model model, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(bbno);
		String bbnoNum = Integer.toString(bbno);
		//쿠키를 받아올거야 크키가 있는지 확인해서 조회수 조작을 못하게 막을거거든.
		Cookie userCookie = WebUtils.getCookie(request, "viewCookie");
		System.out.println(userCookie);//이건 쿠키를 받아오는거야
        if(userCookie == null) { //쿠키가 없을 때
        	Cookie cookie = new Cookie("viewCookie", bbnoNum+"/");//없어서 생성하는거야
        	cookie.setMaxAge(60 * 60);  //쿠키 최대 유효시간 1시간
        	cookie.setHttpOnly(false); 
        	cookie.setPath("/puppy/boast");
            System.out.println(cookie);
        	response.addCookie(cookie);  //응답헤더에 쿠키를 추가하는거.
            
            service.updateView_cnt(bbno);
        } else {                  //쿠키가 있을 때
        	if(!userCookie.getValue().contains(bbnoNum+"/")) {   //bbno를 포함하고 있는지.
        		userCookie.setValue(userCookie.getValue()+ bbnoNum + "/"); 
        		userCookie.setMaxAge(60 * 60);
        		response.addCookie(userCookie);  //응답헤더에 쿠키를 추가하는거.
        		service.updateView_cnt(bbno);
        	}
        	
        }
		
		FileVO vo = service.getFile(bbno);
		List<FileVO> list = new ArrayList<>();
		BoastBoardVO boastVO = service.getContent(bbno);
		
		String[] fileExtension = vo.getFileExtension().split(" ");
		String[] fileName = vo.getFileRealName().split(" ");

		for(int i=0; i<fileName.length; i++) {
			FileVO f = new FileVO();
			f.setBbno(vo.getBbno());
			f.setFileExtension(fileExtension[i]);
			f.setFileRealName(fileName[i]);
			f.setFileLoca(boastVO.getFileLoca());
			list.add(f);
		}
		Map<String, Object> data = new HashMap<>();

		data.put("fileList", list);
		data.put("boastContent", boastVO);

		return data;
	}


	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(@RequestParam("fileLoca") String fileLoca,
			@RequestParam("fileName") String fileName) {

		System.out.println("fileName: " + fileName);
		System.out.println("fileLoca: " + fileLoca);


		File file = new File("C:\\upload\\boastboard\\" + fileLoca + "\\" + fileName);
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
	
	//글삭제
	@PostMapping("/delete")
	@ResponseBody
	public String delete(@RequestBody BoastBoardVO vo, HttpSession session) {
		
		service.delete(vo.getBbno());
		service.likeDelete2(vo.getBbno());
		return "delSuccess";			
	
	}
	@GetMapping("/update")
	public String update(@RequestParam int bbno,Model model) {
		model.addAttribute("boast", service.getContent(bbno));
		
		return "board/boardModify";
	}
	@PostMapping("/update")
	public String update(BoastBoardVO vo, RedirectAttributes ra) {
		System.out.println("글 수정 요청!!!!!!!!"+vo);
		service.update(vo);
		ra.addFlashAttribute("msg", "boastUpdateSucess");
		
		return "redirect:/boast/boastboard";
	}


	@GetMapping()
	public void getCount(@RequestParam int bbno, Model model) {
		model.addAttribute(service.getContent(bbno)); 
	}

	@PostMapping("/like")
	@ResponseBody
	public int likeup(@RequestBody Map<String, String> info) {
		String id = info.get("id");
		int bbno = Integer.parseInt(info.get("bbno"));
		System.out.println(id);
		System.out.println(bbno);
		int check = service.likeCheck(id, bbno);
		if(check == 1) {
			service.likedown(bbno);
			service.likeDelete(id, bbno);
		}else {
			service.likeup(bbno);	
			service.likeSave(id, bbno);
		}

		BoastBoardVO vo = service.getContent(bbno);
		int likeCnt = vo.getLike_cnt();
		return likeCnt;
	}


	@PostMapping("/likeCheck")
	@ResponseBody
	public int likeCheck(@RequestBody Map<String, String> info) {
		String id = info.get("id");
		int bbno = Integer.parseInt(info.get("bbno"));
		return service.likeCheck(id, bbno);

	}
	
	@GetMapping("/likeList")
	public String likeList(PageVO vo, HttpSession session, Model model, RedirectAttributes ra) {
		UserVO user = (UserVO) session.getAttribute("login");
		System.out.println(service.likeList(user.getId()));
		List<Integer> bbnoList = service.likeList(user.getId());
		List<BoastBoardVO> list = new ArrayList<>();
		
		if(bbnoList.size() != 0) {
			for(int num : bbnoList) {	
				list.add(service.getContent(num));
			}
			
			System.out.println(service.getContent(5));
			PageCreator pc = new PageCreator();
			
			pc.setPaging(vo);
			pc.getPaging().setCountPerPage(6);;
			pc.setArticleTotalCount(list.size());
			
			model.addAttribute("pc", pc);
			model.addAttribute("likeList", list);
			return "mypage/joayo";
		}
		ra.addFlashAttribute("msg", "likeNoCount");
		return "redirect:/user/mypage";
		
	}

}
