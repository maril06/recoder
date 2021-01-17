package com.project.recoder.common.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			
			else if(command.equals("/nickDupCheck.do")) {
				errorMsg = "닉네임 중복검사 과정에서 오류 발생";
				String nickname = request.getParameter("nickname");
				
				int result = service.nickDupCheck(nickname);
				//0이면 사용해도 되는거
				
				response.getWriter().print(result);
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
