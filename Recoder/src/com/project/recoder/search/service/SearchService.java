package com.project.recoder.search.service;
import static com.project.recoder.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import com.project.recoder.room.model.vo.PageInfo;
import com.project.recoder.room.model.vo.Room;
import com.project.recoder.room.model.vo.RoomImg;
import com.project.recoder.search.dao.searchDAO;



public class SearchService {
	private searchDAO dao = new searchDAO();

	public PageInfo getPageInfo(Map<String, Object> map) throws Exception{
		Connection conn = getConnection();
	      
	      // 얻어온 파라미터 cp가 null이면 1, 아니면 int 형으로 파싱
	      map.put("currentPage",  
	            (map.get("currentPage") == null) ? 1 
	                     : Integer.parseInt((String)map.get("currentPage")));
	      
	      // 검색 조건에 따른 SQL 조건문을 조합하는 메소드 호출
	      String condition = createCondition(map);
	      
	      // DB에서 조건을 만족하는 게시글의 수를 조회하기
	      int listCount = dao.getListCount(conn, condition);
	      
	      // 커넥션 반환
	      close(conn);
	      
	      // PageInfo 객체를 생성하여 반환
	      return new PageInfo((int)map.get("currentPage"), listCount);
	}

	
	
	private String createCondition(Map<String, Object> map) {

		String searchValue = (String)map.get("searchValue");
	      String condition = " ROOM_ADDR LIKE '%' || '" + searchValue + "' || '%' ";
	      return condition;
	}



	public List<Room> searchBoardList(Map<String, Object> map, PageInfo pInfo) throws Exception{
		Connection conn = getConnection();
	      
	      String condition = createCondition(map);
	      
	      List<Room> rList = dao.searchBoardList(conn, pInfo, condition);
	      
	      close(conn);
	      
	      return rList;
	}



	public List<RoomImg> searchThumbnailList(Map<String, Object> map, PageInfo pInfo) throws Exception{
		Connection conn = getConnection();
		
		//검색에 사용될 SQL 조건문 생성
		String condition = createCondition(map); 
		List<RoomImg> fList = dao.searchThumbnailList(conn,pInfo, condition);
		close(conn);
		
		return fList;
	}
	
	
	
	
	
	
	
}
