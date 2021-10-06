package com.spring.puppy.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.puppy.command.UserVO;

public class BoardAuthLoginHandler extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		   
	     
	      String writer = request.getParameter("writer");
	      HttpSession session = request.getSession();
	      UserVO vo = (UserVO) session.getAttribute("login");
	      
	      System.out.println("화면에서 넘어오는 값: " + writer);
	      System.out.println("세션에 저장된 값: " + vo);
	      
	      if(vo != null) {
	         if(writer.equals(vo.getId())) {
	            return true; //컨트롤러로 요청의 진입을 허용.
	         }
	      } 
	      
	      response.setContentType("text/html; charset=utf-8");
	      PrintWriter out = response.getWriter();
	      out.print("<script> \r\n");
	      out.print("alert('권한이 없습니다.'); \r\n");
	      out.print("history.back()");
	      out.print("</script>");
	      
	      out.flush();
		return false;
	}
}
