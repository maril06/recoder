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
import javax.websocket.Session;

import com.project.recoder.member.model.service.MemberService;
import com.project.recoder.member.model.vo.Member;

@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. POST방식으로 전달된 데이터의 문자 인코딩 변경
		
		//2. 파라미터를 얻어와 변수에 저장
		String memId = request.getParameter("userId"); //아이디
		String memPw = request.getParameter("userPw"); //비번
		String remember = request.getParameter("remember"); //아이디 저장
		
		
		//JDBC 수행
				//아이디와 비밀번호를 하나의 vo에 담아서 service로 전달
				//3. 아이디와 비밀번호를 Member객체에 세팅
		Member member = new Member();
		member.setMemId(memId);
		member.setMemPw(memPw);
		
		// * try-catch를 이용하여 service, dao에서 발생한 예외를 처리
				// -> 응답 화면을 에러페이지로 연결
		
		try {
		//4. Member 객체를 Service로 전달하여 결과를 반환받기
		//(로그인이란? id/pw가 일치하는 회원정보를 DB에서 조회해 오는 것)
			Member loginMember = new MemberService().loginMember(member);
			
		// 6. Session 객체를 얻어와 로그인 정보를 추가함
			HttpSession session = request.getSession();
			
			String url = null;
			
		// 6-1. 로그인이 성공했을 때만 Session에 로그인 정보 추가하기. 
			if(loginMember != null) {
			//6-2. 30분 동안 동작이 없을 경우 Session을 만료시킴
				session.setMaxInactiveInterval(60 * 30);
			
			//6-3. Session에 로그인 정보 추가
				session.setAttribute("loginMember", loginMember);
			
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
			
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "로그인 과정에서 오류 발생");
			
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
			
			view.forward(request, response);
		
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
