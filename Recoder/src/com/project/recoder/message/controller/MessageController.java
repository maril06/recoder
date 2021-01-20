package com.project.recoder.message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.recoder.message.model.service.MessageService;

@WebServlet("/message/*")
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI(); // 
		String contextPath = request.getContextPath(); // 
		String command = uri.substring((contextPath + "/message").length()); 
		
		String path = null;
		RequestDispatcher view = null;
		
		String errorMsg = null;
		
		// 현재 페이지를 얻어옴
		String cp = request.getParameter("cp");
		
		try {
			
			MessageService service = new MessageService();
			
			if(command.equals("/message.do")) {
				
				path = "/WEB-INF/views/message/message.jsp";
			    view = request.getRequestDispatcher(path);
			    view.forward(request, response);
			}
			
			// 쪽지 보내기 ======================================================================================
			else if (command.equals("/messageSend.do")) {
				
				String msgContext = request.getParameter("msgContext");
				int brokerNo = Integer.parseInt(request.getParameter("brokerNo"));
				int myNo = Integer.parseInt(request.getParameter("myNo"));
				
				int result = service.messageSend(msgContext, brokerNo, myNo);
				
				if(result > 0) {
					
					path = "/WEB-INF/views/message/message.jsp";
				    view = request.getRequestDispatcher(path);
				    view.forward(request, response);
				}

			}
			
			else if(command.equals("/messageSend")) {
				
				
				
				
				
				
				
				
			}
			
			
		}catch (Exception e) {
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
