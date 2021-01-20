package com.project.recoder.search.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.recoder.room.model.vo.PageInfo;
import com.project.recoder.room.model.vo.Room;
import com.project.recoder.room.model.vo.RoomImg;
import com.project.recoder.search.service.SearchService;


/**
 * Servlet implementation class SearchController
 */
@WebServlet("/searchKeyword.do")
public class SearchAreaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String searchKey = request.getParameter("sk");
		String searchValue = request.getParameter("keyword");
		String cp = request.getParameter("cp");
		  
		System.out.println(searchValue);
		System.out.println(cp);
		  
		request.setCharacterEncoding("UTF-8");
		
		
		String uri = request.getRequestURI(); // 
		String contextPath = request.getContextPath(); // 
		String command = uri.substring((contextPath + "/room").length()); 
		
		String path = null;
		RequestDispatcher view = null;
		
		String errorMsg = null;

	      
	      try {
	         SearchService service = new SearchService();
	         
	         
//	         if(command.equals("/searchKeyword.do")) {
	         Map<String, Object> map = new HashMap<String, Object>();
	         //map.put("searchKey", searchKey);
	         map.put("searchValue", searchValue);
	         map.put("currentPage", cp);
	         
	         // 페이징 처리를 위한 데이터를 계산하고 저장하는 객체 PageInfo 얻어오기
	         PageInfo pInfo = service.getPageInfo(map);
	         
	         // 검색 게시글 목록 조회
	         List<Room> rList = service.searchBoardList(map, pInfo);
	         
	         
	         // 결과 확인
	         /* System.out.println(pInfo);
	         for(Board b : bList) {
	            System.out.println(b);
	         } */ 
	         
	         if(rList != null) {
	             List<RoomImg> fList = service.searchThumbnailList(map, pInfo);
	             
	             if(!fList.isEmpty()) { // 조회된 썸네일 목록이 있다면
	                request.setAttribute("fList", fList);
	             }
	             
	          }
	         System.out.println(rList);
	         System.out.println();
	         
	         
	         List<Room> roomList = service.searchRoomList(map, pInfo);
	         
	         //System.out.println(searchValue.substring(0,1));
	         
	         if(searchValue.substring(0,1).equals("#")) {
	        	 System.out.println("지하철---");
	        	 searchValue = searchValue.substring(1);
	        	 
	        	 List<Room> subList = service.searchSubwayList(map, pInfo, searchValue);
	        	 
	        	 roomList = subList;
	         }
	         
	         
	         System.out.println("----------****----"+roomList);
	         System.out.println("----------****----"+roomList.size());
	         // 조회된 내용과 PageInfo 객체를 request객체에 담아서 요청 위임
	         path = "/WEB-INF/views/room/searchRoom.jsp";
	         
	         request.setAttribute("rList", rList);
	         request.setAttribute("pInfo", pInfo);
	         request.setAttribute("roomList", roomList);
	         
	         view = request.getRequestDispatcher(path);
	         view.forward(request, response);
	         
//	         }
	      }catch (Exception e) {
	         e.printStackTrace();
	         path = "/WEB-INF/views/common/errorPage.jsp";
	         request.setAttribute("errorMsg", "검색 과정에서 오류 발생");
	         view = request.getRequestDispatcher(path);
	         view.forward(request, response);
	      }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
