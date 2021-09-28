package com.spring.puppy.util.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.spring.puppy.command.UserVO;
import com.spring.puppy.user.service.IUserService;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	private IUserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			System.out.println("인터셉터 시작");
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		HttpSession session = request.getSession();
		
		if(loginCookie != null) {
			UserVO vo = service.getUserWithSessionId(loginCookie.getValue());
			
			if(vo != null ) {
				session.setAttribute("login", vo);
			}
		}
			System.out.println("인터셉터 종료");
		return true;
	}
	
	
}
