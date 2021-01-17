package com.project.recoder.common.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.recoder.common.service.CommonService;
import com.project.recoder.member.model.service.MemberService;


@WebServlet("/common/*")
public class CommonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); // 
		String contextPath = request.getContextPath(); // 
		String command = uri.substring((contextPath + "/common").length()); 
		
		String path = null;
		RequestDispatcher view = null;
		
		String errorMsg = null;
		HttpSession session = request.getSession();
		// 현재 페이지를 얻어옴
		String cp = request.getParameter("cp");
		
		CommonService service = new CommonService();
		
		
		try {
			
			//헤더에서 로그인 버튼 눌렀을 때 로그인 폼으로 이동 Controller------------------------------------------------
			if (command.equals("/loginForm.do")) {
				
				path = "/WEB-INF/views/common/loginForm.jsp";
				
				if(request.getSession().getAttribute("beforeUrl") == null) {
					request.getSession().setAttribute("beforeUrl", request.getHeader("referer"));
				}
				
				view = request.getRequestDispatcher(path);
				
				view.forward(request, response);
			}
			
			//헤더 로그아웃 눌렀을 때 Controller --------------------------------------------------------------------
			else if(command.equals("/logout.do")) {
				request.getSession().invalidate();
				
				response.sendRedirect(request.getContextPath()); //메인으로
				
			}
			
			//회원가입 버튼 눌렀을 때 회원가입 폼으로 이동 Controller------------------------------------------------
			else if(command.equals("/signUpForm.do")) {

				path = "/WEB-INF/views/common/signUpForm.jsp";
				
				view = request.getRequestDispatcher(path);
				
				view.forward(request, response);
			}
			

			//회원가입 id 중복검사 controller-----------------------------
			else if(command.equals("/idDupCheck.do")) {
				errorMsg = "id 중복검사 과정에서 오류 발생";
				String id = request.getParameter("userid");
				
				int result = service.idDupCheck(id);
				//0이면 사용해도 되는거
				
				response.getWriter().print(result);
				
				
			}
			//회원가입 닉네임 중복검사 controller-----------------------------
			else if(command.equals("/nickDupCheck.do")) {
				errorMsg = "닉네임 중복검사 과정에서 오류 발생";
				String nickname = request.getParameter("nickname");
				
				int result = service.nickDupCheck(nickname);
				//0이면 사용해도 되는거
				
				response.getWriter().print(result);
			}
			
			//아이디 찾기 폼 연결 controller -=--------------------
			else if(command.equals("/searchIdForm.do")) {

				path = "/WEB-INF/views/common/searchId.jsp";
				
				view = request.getRequestDispatcher(path);
				
				view.forward(request, response);
			}
			
			
			//아이디 찾기 controller----------------
			else if(command.equals("/searchId.do")) {
				errorMsg = "아이디 찾기 과정 중 오류 발생";
				
				String nickname = request.getParameter("username");
				String email = request.getParameter("email");
				String code = request.getParameter("code");
				
				//인증 코드가 보낸 코드랑 같을때 service 진행
				//if문 쓰기
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("nickname", nickname);
				map.put("email", email);
				
				String memId = service.searchId(map);
				
				if(memId != null) { //아이디 있을 경우
					session.setAttribute("memId", memId);
					response.sendRedirect(request.getHeader("referer"));
					
				}else { //아이디 없을 경우
					session.setAttribute("swalIcon", "error");
					session.setAttribute("swalTitle", "아이디 찾기 실패");
					session.setAttribute("swalText", "닉네임 또는 이메일을 확인해주세요."); 
					
					response.sendRedirect(request.getHeader("referer"));
					
				}
				
				/*
				 * //인증코드 틀릴 때 다시 돌려보내기
				 *  else { 
				 * session.setAttribute("swalIcon", "error");
				 * session.setAttribute("swalTitle", "아이디 찾기 실패");
				 * session.setAttribute("swalText", "아이디 또는 비밀번호를 확인해주세요"); 
				 * }
				 */
				
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
