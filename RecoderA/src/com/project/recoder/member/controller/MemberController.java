package com.project.recoder.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.recoder.member.model.service.MemberService;
import com.project.recoder.room.model.vo.PageInfo;


@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = uri.substring((contextPath + "/member").length());

		String path = null;
		RequestDispatcher view = null;

		String swalIcon = null;
		String swalTitle = null;
		String swalText = null;

		String errorMsg = null;
		
		try {
			MemberService service = new MemberService();
			
			String cp = request.getParameter("cp");
			
			if(command.equals("/list.do")) {
				errorMsg = "회원 조회 과정에서 오류 발생";
				
				PageInfo pInfo = service.getPageInfo(cp);
				
				
				
				path = "/WEB-INF/views/member/memberManage.jsp";
				view=request.getRequestDispatcher(path);
				view.forward(request, response);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			path = "/WEB-INF/views/common/errorpage.jsp";
			request.setAttribute("errorMsg", errorMsg);
			view = request.getRequestDispatcher(path);
			view.forward(request, response);
		}
	
	
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
