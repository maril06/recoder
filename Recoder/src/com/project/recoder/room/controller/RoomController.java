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
import com.project.recoder.member.model.vo.Member;
import com.project.recoder.room.model.service.RoomService;
import com.project.recoder.room.model.vo.Room;
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
			
			// 매물 등록 창 =================================================================================================
			if(command.equals("/roomInsertForm.do")) {

				System.out.println(1);
				path = "/WEB-INF/views/room/roomsInfoInsert.jsp";
			    view = request.getRequestDispatcher(path);
			    view.forward(request, response);
		    }
			
			
			// 매물 등록 시작 =================================================================================================
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
	        	
	        	List<RoomImg> mList = new ArrayList<RoomImg>();
	        	
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
	        			mList.add(temp);
	        		}
				} // end while
	        	
	        	
//				String[] options2 = multiRequest.getParameterValues("options2");
	        	
	        	String roomAddr = multiRequest.getParameter("roomAddr");
	        	String typeOfRent = multiRequest.getParameter("typeOfRent");
	        	int deposit = Integer.parseInt(multiRequest.getParameter("deposit"));
	        	int monthRent = Integer.parseInt(multiRequest.getParameter("monthRent"));
	        	int careFee = Integer.parseInt(multiRequest.getParameter("careFee"));
	        	int pubSize = Integer.parseInt(multiRequest.getParameter("pubSize"));
	        	int realSize = Integer.parseInt(multiRequest.getParameter("realSize"));
	        	String roomCount = multiRequest.getParameter("roomCount");
	        	String roomFloor = multiRequest.getParameter("roomFloor");
	        	String roomStruc = multiRequest.getParameter("roomStruc");
				
	        	String tv = multiRequest.getParameter("tv");
	        	String washing = multiRequest.getParameter("washing");
	        	String internet = multiRequest.getParameter("internet");
				String airCon = multiRequest.getParameter("airCon");
				String fridge = multiRequest.getParameter("fridge");
				String bed = multiRequest.getParameter("bed");
				String closet = multiRequest.getParameter("closet");
				String womanOnly = multiRequest.getParameter("womanOnly");
				String pet = multiRequest.getParameter("pet");
				String parking = multiRequest.getParameter("parking");
	        	
				String roomTitle = multiRequest.getParameter("roomTitle");
				String roomInfo = multiRequest.getParameter("roomInfo");
				String stationAddr = multiRequest.getParameter("stationAddr");
				
				// 로그인 얻어오기
				Member loginMember = (Member)request.getSession().getAttribute("loginMember");
				
//				int roomBroker = loginMember.getMemNo2();
				int roomBroker = loginMember.getMemNo();
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
				
				map.put("roomBroker", roomBroker);
				map.put("mList" ,mList);
				
				// 서비스 실행 
				int result = service.roomInsert(map);
				
				if(result > 0) { // DB 삽입 성공 시 result에는 삽입한 글 번홀가 저장되어있다. 
	        		path = "view.do?cp=1&no=" + result;
	        		System.out.println("성공");
	        	}else {
	        		path="list.do"; // 게시글 목록
	        		System.out.println("실패");
	        	}
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
			
			// 매물 수정 창 =================================================================================================
			else if(command.equals("/roomUpdateForm.do")) {
				
				// 매물 번호
				//int roomNo = Integer.parseInt(request.getParameter("no"));
				int roomNo = 3;
				
				Room room = service.updateView(roomNo);
				
				if(room !=null) {
					List<RoomImg> mList = service.selectRoomImg(roomNo);
					
					if(mList.isEmpty()) {
						request.setAttribute("mList", mList);
					}
					
					request.setAttribute("room", room);
	        		path = "/WEB-INF/views/room/roomsInfoUpdate.jsp";
				    view = request.getRequestDispatcher(path);
				    view.forward(request, response);
	        		
				}else {
	        		response.sendRedirect(request.getHeader("referer"));
	        	}
				
			}
			
			// 매물 수정 시작 =================================================================================================
			
			else if(command.equals("/roomUpdate.do")) {
				int maxSize = 20 * 1024 * 1024; // 20MB == 20 * 1024KB == 20 * 1024 * 1024Byte
	        	String root = request.getSession().getServletContext().getRealPath("/");
	        	String filePath = root + "resources/images/rooms";
	        	
	        	MultipartRequest mRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
	        	//														요청		파일위치		크기						이름변경			
	        	String roomAddr = mRequest.getParameter("roomAddr");
	        	String typeOfRent = mRequest.getParameter("typeOfRent");
	        	int deposit = Integer.parseInt(mRequest.getParameter("deposit"));
	        	int monthRent = Integer.parseInt(mRequest.getParameter("monthRent"));
	        	int careFee = Integer.parseInt(mRequest.getParameter("careFee"));
	        	int pubSize = Integer.parseInt(mRequest.getParameter("pubSize"));
	        	int realSize = Integer.parseInt(mRequest.getParameter("realSize"));
	        	int roomCount = Integer.parseInt(mRequest.getParameter("roomCount"));
	        	String roomFloor = mRequest.getParameter("roomFloor");
	        	String roomStruc = mRequest.getParameter("roomStruc");
	        	
	        	String tv = mRequest.getParameter("tv");
	        	String washing = mRequest.getParameter("washing");
	        	String internet = mRequest.getParameter("internet");
	        	String airCon = mRequest.getParameter("airCon");
	        	String fridge = mRequest.getParameter("fridge");
	        	String bed = mRequest.getParameter("bed");
	        	String closet = mRequest.getParameter("closet");
	        	String womanOnly = mRequest.getParameter("womanOnly");
	        	String pet = mRequest.getParameter("pet");
	        	String parking = mRequest.getParameter("parking");
	        	
	        	String roomTitle = mRequest.getParameter("roomTitle");
	        	String roomInfo = mRequest.getParameter("roomInfo");
	        	String stationAddr = mRequest.getParameter("stationAddr");
	        	
	        	// 매물 번호 받아오기
//	        	int roomNo = Integer.parseInt(mRequest.getParameter(""));
	        	int roomNo = 33;
	        	
	        	
	        	List<RoomImg> mList = new ArrayList<RoomImg>();
	        	
	        	Enumeration<String> files = mRequest.getFileNames();
	        	
	        	while (files.hasMoreElements()) { // 다음 요소가 있다면
	        		String name = files.nextElement(); // img0
	        		
	        		if(mRequest.getFilesystemName(name) != null) {
	        			
	        			RoomImg temp = new RoomImg();
	        			temp.setRoomImgName(mRequest.getFilesystemName(name));
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
	        			mList.add(temp);
	        		}
				} // end while
	        	
	        	int memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemNo();
	        	
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
				map.put("memNo", memNo);
				
				int result = service.roomUpdate(map);
				
				// 8. result 값에 따라 View 연결 처리 
	        	path = "view.do?cp=" + cp + "&no=" + roomNo ;
	        	
	        	String sk = mRequest.getParameter("sk");
	        	String sv = mRequest.getParameter("sv");
				
	        	if (sk != null && sv != null) {
	        		path += "&sk=" + sk + "&sv=" + sv;
	        	}
	        	
	        	if(result > 0){
	        		System.out.println("성공");
	        	}else {
	        		System.out.println("실패");
	        	}
	        	
	        	response.sendRedirect(path);
			}
			
			// 매물 삭제 =================================================================================================
			else if(command.equals("/delete.do")) {
				
//				int roomNo = Integer.parseInt(request.getParameter("no")); // 매물 번호 받아오기
				int roomNo = 1; // 매물 번호 임시
				
				int result = service.updateRoomStatus(roomNo);
				

	        	if (result > 0) {
	        		System.out.println("성공");
	        		path = "list.do?";
				} else {
					System.out.println("실패");
	        		path = request.getHeader("referer");
				}
	        	
	        	response.sendRedirect(path);
			}
			
			// 매물 상세 =================================================================================================
			else if(command.equals("/view.do")) {
				int roomNo = 3; // 임시
				

				Room room = service.selectRoom(roomNo);
				
//				Room option = new Room(
//					room.getTv(), room.getInternet(), room.getAirCon(), room.getWashing(), 
//					room.getFridge(), room.getBed(), room.getCloset(), room.getWomanOnly(), 
//					room.getPet(), room.getParking());
//				
				Map<String, String> a = new HashMap<String, String>();
				a.put("tv",room.getTv());
				a.put("인터넷",room.getInternet());
				a.put("에어컨",room.getAirCon());
				a.put("세탁기",room.getWashing());
				a.put("냉장고",room.getFridge());
				a.put("침대",room.getBed());
				a.put("옷장",room.getCloset());
				a.put("여성전용",room.getWomanOnly());
				a.put("반려동물",room.getPet());
				a.put("주차",room.getParking());
				
				Map<String, String> b = new HashMap<String, String>();
				b.put("tv", "fad fa-tv-retro");
				b.put("인터넷", "fas fa-wifi");
				b.put("에어컨", "fad fa-air-conditioner");
				b.put("세탁기", "fas fa-washer");
				b.put("냉장고", "fas fa-refrigerator");
				b.put("침대", "fad fa-bed-empty");
				b.put("옷장", "fas fa-tshirt");
				b.put("여성전용", "fas fa-female");
				b.put("반려동물", "fad fa-dog");
				b.put("주차", "fad fa-parking");
				
//				option.setTv(room.getTv());
//				option.setInternet(room.getInternet());
//				option.setAirCon(room.getAirCon());
//				option.setWashing(room.getWashing());
//				option.setFridge(room.getFridge());
//				option.setBed(room.getBed());
//				option.setCloset(room.getCloset());
//				option.setWomanOnly(room.getWomanOnly());
//				option.setPet(room.getPet());
//				option.setParking(room.getParking());
				
				
				if(room != null) {
					List<RoomImg> mList = service.selectRoomImg(roomNo);
					
					if(!mList.isEmpty()) {
						request.setAttribute("mList", mList);
					}
					
					System.out.println(room);
					
					path = "/WEB-INF/views/room/roomsInfo.jsp";
					request.setAttribute("room", room);
					request.setAttribute("options", a);
					request.setAttribute("font", b);
				    view = request.getRequestDispatcher(path);
				    view.forward(request, response);
					
				} else {
					response.sendRedirect(request.getHeader("referer"));	
				}
				
				
			}
			// 신고 =================================================================================================
			else if(command.equals("/viewReport.do")) {
				String  reportTitle = request.getParameter("reportTitle");
				System.out.println(3);
				System.out.println(reportTitle);
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
