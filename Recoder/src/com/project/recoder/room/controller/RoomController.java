package com.project.recoder.room.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.recoder.room.model.service.RoomService;

@WebServlet("/room/*")
public class RoomController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uri = request.getRequestURI(); // 
		String contextPath = request.getContextPath(); // 
		String command = uri.substring((contextPath + "/room").length()); 
		
		String path = null;
		RequestDispatcher view = null;
		
		String errorMsg = null;
		
		// 현재 페이지를 얻어옴
		String cp = request.getParameter("cp");
		
		try {
			RoomService service = new RoomService();
			if(command.equals("/roomInsertForm.do")) {
				
				path = "/WEB-INF/views/room/roomsInfoInsert.jsp";
			    view = request.getRequestDispatcher(path);
			    view.forward(request, response);
		        }
			
			else if(command.equals("/roomInsert.do")) {
				
				String roomTitle = request.getParameter("roomTitle");
				String roomInfo = request.getParameter("roomInfo");
				String[] options = request.getParameterValues("options");
				String roomAddr = request.getParameter("roomAddr");
				String careFee = request.getParameter("careFee");
				String typeOfRent = request.getParameter("typeOfRent");
				String deposit = request.getParameter("deposit");
				String monthRent = request.getParameter("monthRent");
				String roomStruc = request.getParameter("roomStruc");
				String roomFloor = request.getParameter("roomFloor");
				String pubSize = request.getParameter("pubSize");
				String realSize = request.getParameter("realSize");
				String roomCount = request.getParameter("roomCount");
				String stationAddr = request.getParameter("stationAddr");

				
				System.out.println(roomTitle);
				System.out.println(roomInfo);
				System.out.println(options);
				for (int i = 0; i < options.length; i++) {
					System.out.println(options[i]);
					
				}
				
				
				
				
			
//				request.setAttribute("");
//				request.setAttribute("");

				
				path = "/WEB-INF/views/room/roomsInfo.jsp";
				view = request.getRequestDispatcher(path);
				view.forward(request, response);
				
//				response.getWriter().print(result);
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
