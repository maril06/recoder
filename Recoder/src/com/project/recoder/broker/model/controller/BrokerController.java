package com.project.recoder.broker.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.recoder.broker.model.service.BrokerService;
import com.project.recoder.broker.model.vo.Broker;
import com.project.recoder.member.model.service.MemberService;
import com.project.recoder.member.model.vo.Member;

@WebServlet("/broker/*")
public class BrokerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); // 
		String contextPath = request.getContextPath(); // 
		String command = uri.substring((contextPath + "/broker").length()); 
		
		BrokerService service = new BrokerService();
		
		String path = null;
		RequestDispatcher view = null;
		
		String errorMsg = null;
		
		// 현재 페이지를 얻어옴
		String cp = request.getParameter("cp");
		
		try {
			
			if (command.equals("/brokerInfo.do")) {
				
				path = "/WEB-INF/views/broker/brokerInfo.jsp";
			    view = request.getRequestDispatcher(path);
			    view.forward(request, response);
			}
			
			//브로커 로그인 controller
			else if(command.equals("/login.do")) {
				
				String memId = request.getParameter("userId"); //아이디
				String memPw = request.getParameter("userPw"); //비번
				String remember = request.getParameter("remember"); //아이디 저장
				
				Broker broker = new Broker();
				broker.setMemId(memId);
				broker.setMemPw(memPw);
				
				
					Broker loginMember = service.loginBroker(broker);
					
					
				// 6. Session 객체를 얻어와 로그인 정보를 추가함
					HttpSession session = request.getSession();
					
					String url = null;
					
				// 6-1. 로그인이 성공했을 때만 Session에 로그인 정보 추가하기. 
					if(loginMember != null) {
					//6-2. 30분 동안 동작이 없을 경우 Session을 만료시킴
						session.setMaxInactiveInterval(60 * 30);
					
					//6-3. Session에 로그인 정보 추가
						session.setAttribute("loginMember", loginMember);
						//System.out.println(loginMember);
						
					
					//6-4 아이디를 Cookie에 저장하기
					
						//1) 쿠키 객체 생성
						Cookie cookie = new Cookie("saveId", memId);
					
						//2) 아이디 저장 checkbox가 체크 되었을 때 쿠키 저장
						if(remember != null) {
							// 3) 일주일동안 쿠키가 유효하도록 설정( 쿠키생명주기설정)
							cookie.setMaxAge(60*60*24*7);
						}else {
							// 4) 아이디 저장이 체크가 안된 경우 기존에 있던 쿠키 파일 삭제
							cookie.setMaxAge(0);
						}
						//5) 쿠키 유효 디렉토리 지정
						cookie.setPath(request.getContextPath());
			
					// 6) 생성된 쿠키를 클라이언트로 전달(응답)
						response.addCookie(cookie);
						//System.out.println("성공"+session.getAttribute("beforeUrl"));
						url = (String)session.getAttribute("beforeUrl");
						
						
					//7. 로그인이 실패했을 때 "아이디 또는 비밀번호를 확인해주세요."라고 경고창 띄우기
					}else {
						session.setAttribute("swalIcon", "error");
						session.setAttribute("swalTitle", "로그인 실패");
						session.setAttribute("swalText", "아이디 또는 비밀번호를 확인해주세요");
						
						//System.out.println("실패 before Url : "+session.getAttribute("beforeUrl"));
						//System.out.println("실패 referer : "+ request.getHeader("referer"));
						
						url = request.getHeader("referer"); 
						
						String beforeUrl = (String)session.getAttribute("beforeUrl");
						//System.out.println("before url :"+beforeUrl);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
