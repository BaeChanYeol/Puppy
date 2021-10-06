package com.spring.puppy.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.puppy.command.UserVO;

public class AuthLoginInterceptor extends  HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session =  request.getSession();
		
		UserVO vo = (UserVO) session.getAttribute("login");
		
		if(vo == null) {
			  response.setContentType("text/html; charset=utf-8");
		      PrintWriter out = response.getWriter();
		      out.print("<script> \r\n");
		      out.print("alert('권한이 없습니다.'); \r\n");
		      out.print("history.back()");
		      out.print("</script>");
		      
		      out.flush();
			return false;
		}else {
			
			return true;
		}
		
		
	}
}
