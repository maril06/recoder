package com.project.recoder.room.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.project.recoder.common.MyFileRenamePolicy;
import com.project.recoder.room.model.service.RoomService;
import com.project.recoder.room.model.vo.RoomImg;

@WebServlet("/room/*")
public class RoomController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
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
/*	
				System.out.println("washing: " + washing);
				System.out.println("closet: " + closet);
				System.out.println("bed: " + bed);
				System.out.println("airCon: " + airCon);
				System.out.println("parking: " + parking);
				System.out.println("tv: " + tv);
				System.out.println("internet: " + internet);
				System.out.println("fridge: " + fridge);
				System.out.println("womanOnly: " + womanOnly);
				System.out.println("pet: " + pet);
				
*/
				// 파일
	        	int maxSize = 20 * 1024 * 1024; // 20MB == 20 * 1024KB == 20 * 1024 * 1024Byte
	        	String root = request.getSession().getServletContext().getRealPath("/");
	        	String filePath = root + "resources/images/rooms";
	        	
	        	MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
	        	//														요청		파일위치		크기						이름변경			
	        	List<RoomImg> fList = new ArrayList<RoomImg>();
	        	
	        	Enumeration<String> files = multiRequest.getFileNames();
	        	
	        	while (files.hasMoreElements()) { // 다음 요소가 있다면
	        		String name = files.nextElement(); // img0
	        		
	        		if(multiRequest.getFilesystemName(name) != null) {
	        			
	        			RoomImg temp = new RoomImg();
	        			temp.setRoomImgName(multiRequest.getFilesystemName(name));
	        			temp.setRoomImgPath(filePath);
	        			
	        			int fileLevel = 0;
	        			switch(name) {
		        			case "img0": fileLevel = 0; break;
		        			case "img1": fileLevel = 1;	break;
		        			case "img2": fileLevel = 2;	break;
		        			case "img3": fileLevel = 3;	break;
		        			case "img4": fileLevel = 4;	break;
		        			case "img5": fileLevel = 5;	break;
		        			case "img6": fileLevel = 6;	break;
		        			case "img7": fileLevel = 7;	break;
		        			case "img8": fileLevel = 8;	break;
		        			
	        			}
	        			
	        			temp.setRoomImgLevel(fileLevel);
	        			
	        			// fList에 추가
	        			fList.add(temp);
	        		}
				} // end while
	        	
	        	String roomTitle = multiRequest.getParameter("roomTitle");
				String roomInfo = multiRequest.getParameter("roomInfo");
				String[] options2 = multiRequest.getParameterValues("options2");
				String roomAddr = multiRequest.getParameter("roomAddr");
				String careFee = multiRequest.getParameter("careFee");
				String typeOfRent = multiRequest.getParameter("typeOfRent");
				String deposit = multiRequest.getParameter("deposit");
				String monthRent = multiRequest.getParameter("monthRent");
				String roomStruc = multiRequest.getParameter("roomStruc");
				String roomFloor = multiRequest.getParameter("roomFloor");
				String pubSize = multiRequest.getParameter("pubSize");
				String realSize = multiRequest.getParameter("realSize");
				String roomCount = multiRequest.getParameter("roomCount");
				String stationAddr = multiRequest.getParameter("stationAddr");
				
				String washing = multiRequest.getParameter("washing");
				String airCon = multiRequest.getParameter("airCon");
				String bed = multiRequest.getParameter("bed");
				String closet = multiRequest.getParameter("closet");
				String parking = multiRequest.getParameter("parking");
				String tv = multiRequest.getParameter("tv");
				String internet = multiRequest.getParameter("internet");
				String fridge = multiRequest.getParameter("fridge");
				String womanOnly = multiRequest.getParameter("womanOnly");
				String pet = multiRequest.getParameter("pet");
	        	
				
				//로그인 얻어오기
				/*
				 
				
				*/
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("roomTitle", roomTitle);
				map.put("roomInfo", roomInfo);
				map.put("roomAddr", roomAddr);
				map.put("careFee", careFee);
				map.put("typeOfRent", typeOfRent);
				map.put("deposit", deposit);
				map.put("monthRent", monthRent);
				map.put("roomStruc", roomStruc);
				map.put("roomFloor", roomFloor);
				map.put("pubSize", pubSize);
				map.put("realSize", realSize);
				map.put("roomCount", roomCount);
				map.put("stationAddr", stationAddr);
				
				map.put("washing", washing);
				map.put("airCon", airCon);
				map.put("bed", bed);
				map.put("closet", closet);
				map.put("parking", parking);
				map.put("tv", tv);
				map.put("internet", internet);
				map.put("fridge", fridge);
				map.put("womanOnly", womanOnly);
				map.put("pet", pet);
				
				

				// 서비스 실행 
				int result = service.roomInsert(map);
				
				
				
				// 2번재로 받아온 뒤
//				for (int i = 0; i < options2.length; i++) {
//					System.out.println(options2[i]);
//				}
//				
				
				
				
			
//				request.setAttribute("");
//				request.setAttribute("");

				
				path = "/WEB-INF/views/room/roomsInfo.jsp";
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
