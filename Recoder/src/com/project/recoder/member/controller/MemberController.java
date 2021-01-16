package com.project.recoder.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.recoder.member.model.service.MemberService;
import com.project.recoder.member.model.vo.Member;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); // 
		String contextPath = request.getContextPath(); // 
		String command = uri.substring((contextPath + "/member").length()); 
		
		String path = null;
		RequestDispatcher view = null;
		
		String errorMsg = null;
		
		// 현재 페이지를 얻어옴
		String cp = request.getParameter("cp");
		
		MemberService service = new MemberService();
		
		try {
			//일반회원 로그인 controller
			if (command.equals("/login.do")) {
				String memId = request.getParameter("userId"); //아이디
				String memPw = request.getParameter("userPw"); //비번
				String remember = request.getParameter("remember"); //아이디 저장
				
				Member member = new Member();
				member.setMemId(memId);
				member.setMemPw(memPw);
				
					Member loginMember = new MemberService().loginMember(member);
					
					HttpSession session = request.getSession();
					
					String url = null;
					
					if(loginMember != null) {
						session.setMaxInactiveInterval(60 * 30);
					
						session.setAttribute("loginMember", loginMember);
						
						
						Cookie cookie = new Cookie("saveId", memId);

						if(remember != null) {
							cookie.setMaxAge(60*60*24*7);
						}else {
							cookie.setMaxAge(0);
						}
						cookie.setPath(request.getContextPath());
			
						response.addCookie(cookie);
						url = (String)session.getAttribute("beforeUrl");
						
						
					}else {
						session.setAttribute("swalIcon", "error");
						session.setAttribute("swalTitle", "로그인 실패");
						session.setAttribute("swalText", "아이디 또는 비밀번호를 확인해주세요");
						
						
						url = request.getHeader("referer"); 
						
						String beforeUrl = (String)session.getAttribute("beforeUrl");
						session.setAttribute("beforeUrl",  beforeUrl);
					}
					
					response.sendRedirect(url);
					
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			path = "/WEB-INF/views/common/errorPage.jsp"; // 수정
			request.setAttribute("errorMsg", errorMsg);
			view = request.getRequestDispatcher(path);
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
