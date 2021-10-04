package com.spring.puppy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.puppy.command.BoastBoardReplyVO;
import com.spring.puppy.boastboard.service.IBoastBoardReplyService;
import com.spring.puppy.util.PageVO;

@RestController
@RequestMapping("/breply")
public class BoastBoardReplyController {
   
   @Autowired
   private IBoastBoardReplyService service;
   
   //댓글 등록
   @PostMapping("/replyRegist")
   @ResponseBody
   public String replyRegist(@RequestBody BoastBoardReplyVO vo) {
      System.out.println("댓글 등록 요청이 들어옴!");
      System.out.println(vo);
      service.replyRegist(vo);
      
      return "regSuccess";
   }
   
   /*
   //일반 댓글 목록 (페이징 x)
   @GetMapping("/getList/{bno}")
   public List<BoastBoardReplyVO> getList(@PathVariable int bno) {
      
      List<BoastBoardReplyVO> list = service.getList(bno);
      System.out.println("댓글 개수: " + list.size());
      
      return list;
   }
   */
   
   //페이징이 추가된 댓글 목록
   @GetMapping("/getList/{bbno}/{pageNum}")
   public Map<String, Object> getList(@PathVariable int bbno, @PathVariable int pageNum) {
      
      //1. 화면에 더보기 버튼 배치, 더보기 버튼 클릭 이벤트
      //2. getList 메서드가 (글번호, 페이지번호)를 매개값으로 받습니다.
      //3. Mapper 인터페이스에 각각 다른 값을 전달하기 위해 Map을 쓰던지 @Param 아노테이션 사용
      //4. sql문을 페이징 쿼리로 변경합니다.
      //5. 레스트 방식은 화면에 필요한 값을 여러 개 보낼 때, 리턴에 Map이나 VO형식으로 
      //필요한 데이터를 한번에 담아 처리.
      
      PageVO vo = new PageVO();
      vo.setPageNum(pageNum); //화면에서 전달되는 페이지 번호
      vo.setCountPerPage(10); //댓글은 한 화면에 10개씩
      
      List<BoastBoardReplyVO> list = service.getList(vo, bbno); //댓글 데이터
      int total = service.getTotal(bbno); //전체 댓글 개수.
      System.out.println("전체 댓글 개수(con): " + total);
      
      Map<String, Object> map = new HashMap<>();
      map.put("list", list);
      map.put("total", total);
      
      return map;
      
   }
   
   @PostMapping("/update")
   public String update(@RequestBody BoastBoardReplyVO vo) {
	  service.update(vo);
      
      return "";
      
   }
   
   @PostMapping("/delete")
   @ResponseBody
   public String delete(@RequestBody BoastBoardReplyVO vo) {
      service.delete(vo.getRno());
      return "delSuccess";
   }
   
   
   
   
}