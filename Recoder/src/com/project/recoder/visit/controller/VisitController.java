package com.project.recoder.visit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.recoder.broker.model.vo.Broker;
import com.project.recoder.member.model.vo.Member;
import com.project.recoder.room.model.vo.Room;
import com.project.recoder.visit.model.service.VisitService;



@WebServlet("/visit/*")
public class VisitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI(); // 
		String contextPath = request.getContextPath(); // 
		String command = uri.substring((contextPath + "/visit").length()); 
		
		String path = null;
		RequestDispatcher view = null;
		
		String errorMsg = null;
		
		// 현재 페이지를 얻어옴
		String cp = request.getParameter("cp");
		
		try {
			
			VisitService service = new VisitService();
			
			if (command.equals("/visit.do")) {
				
				Broker loginMember = (Broker)request.getSession().getAttribute("loginMember");
				int brokerNo =  loginMember.getMemNo();
				System.out.println(brokerNo);
				
				List<Room> room = service.selectRoom(brokerNo);
				
				System.out.println(room);
				
				request.setAttribute("room", room);
				
				path = "/WEB-INF/views/broker/visitCheck.jsp";
			    view = request.getRequestDispatcher(path);
			    view.forward(request, response);
			
			}
			
			else if (command.equals("/visitSend.do")) {
				
				int result = 0;
				int roomNo = 61;
				Member loginMember = (Member)request.getSession().getAttribute("loginMember");
				int memNo = loginMember.getMemNo();
				int visitCd = Integer.parseInt(request.getParameter("result"));
				
				result = service.visitSend(roomNo, memNo, visitCd);
				
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
		doGet(request, response);
	}

}
