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
		
		HttpSession session = request.getSession();
		// 현재 페이지를 얻어옴
		String cp = request.getParameter("cp");
		
		MemberService service = new MemberService();
		
		try {
			//일반회원 로그인 controller
			if (command.equals("/login.do")) {
				errorMsg = "로그인 과정에서 오류 발생";
				String memId = request.getParameter("userId"); //아이디
				String memPw = request.getParameter("userPw"); //비번
				String remember = request.getParameter("remember"); //아이디 저장
				
				Member member = new Member();
				member.setMemId(memId);
				member.setMemPw(memPw);
				
					Member loginMember = service.loginMember(member);
					
					session = request.getSession();
					
					String url = null;
					
					if(loginMember != null) {
						session.setMaxInactiveInterval(60 * 30);
					
						session.setAttribute("loginMember", loginMember);
						
						
						Cookie cookie = new Cookie("saveIdG", memId);

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
			
			
			//회원가입 contolloer -------------------------------------------------------------------------------
			else if(command.equals("/signUp.do")) {
				errorMsg = "회원가입 과정에서 오류 발생";
				
				//전달받은 파라미터를 모두 변수에 저장
				String memId = request.getParameter("userid");
				String memPw = request.getParameter("password");
				String confirmpassword = request.getParameter("confirmpassword");
				String memEmail = request.getParameter("email");
				String memNick = request.getParameter("nickname");
				String memTel = request.getParameter("usertel");
				
				String url = null;
				
				//Member객체를 생성하여 파라미터를 모두 저장
				Member member = new Member(memId, memPw, memNick, memTel, memEmail);
				
					int result = service.signUp(member);

					String swalIcon = null;
					String swalTitle = null;
					String swalText = null;
					
					if(result>0) { //성공
						swalIcon = "success";
						swalTitle = "회원가입 성공!";
						swalText = memNick + "님의 회원가입을 환영합니다.";
						url = (String)session.getAttribute("beforeUrl");
					}else { //실패
						swalIcon = "error";
						swalTitle = "회원가입 실패!";
						swalText = "문제가 지속될 경우 고객센터로 문의 바랍니다.";
						url = request.getHeader("referer"); 
						
						String Burl = (String)session.getAttribute("Burl");
						session.setAttribute("Burl",  Burl);
					}
					
					session = request.getSession();
					
					session.setAttribute("swalIcon", swalIcon);
					session.setAttribute("swalTitle", swalTitle);
					session.setAttribute("swalText", swalText);
					
					//회원가입 진행 후 메인 페이지로 이동(메인 화면 재요청)
					response.sendRedirect(request.getContextPath());
					
					
			}
			
			else if(command.equals("/memberMyPage.do")) {
	    		path = "/WEB-INF/views/member/memberMyPage.jsp";
	    		view = request.getRequestDispatcher(path);
	    		view.forward(request, response);
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
