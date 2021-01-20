package com.project.recoder.search.dao;
import static com.project.recoder.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.project.recoder.room.model.vo.PageInfo;
import com.project.recoder.room.model.vo.Room;
import com.project.recoder.room.model.vo.RoomImg;

public class searchDAO {
	
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rset = null;
	
	

	public int getListCount(Connection conn, String condition) throws Exception{
		int listCount=0;
		String query="SELECT COUNT(*) FROM ROOM WHERE DELETE_FL='N' AND " + condition;
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount =  rset.getInt(1);
			}
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	
	
	public List<Room> searchBoardList(Connection conn, PageInfo pInfo, String condition) throws Exception{
		List<Room> rList= null;
		String query = 
	            "SELECT * FROM" + 
	            "    (SELECT ROWNUM RNUM , V.*" + 
	            "    FROM" + 
	            "        (SELECT * FROM ROOM " + 
	            "        WHERE " + condition +
	            "        AND DELETE_FL = 'N' ORDER BY ROOM_NO DESC) V )";
		try {
	         // SQL 구문 조건절에 대입할 변수 생성
	       //  int startRow = (pInfo.getCurrentPage() - 1) * pInfo.getLimit() + 1 ; // 1
	       //  int endRow = startRow + pInfo.getLimit() - 1 ; // 10 
	         
	         pstmt = conn.prepareStatement(query);
	         
	        // pstmt.setInt(1, startRow);
	       //  pstmt.setInt(2, endRow);
	         
	         rset = pstmt.executeQuery();
	         
	         rList = new ArrayList<Room>();
	         
	         while(rset.next()) {
	        	 Room room = new Room(rset.getInt("ROOM_NO"), rset.getString("TYPE_OF_RENT"+""), rset.getInt("DEPOSIT"), rset.getInt("MONTH_RENT"), rset.getString("ROOM_TITLE"));
	               rList.add(room);
	            }
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
		return rList;
	}

	
	
	public List<RoomImg> searchThumbnailList(Connection conn, PageInfo pInfo, String condition) throws Exception{
		List<RoomImg> fList = null;
		String query = 
	            "SELECT ROOM_IMG_NAME, ROOM_NO FROM ROOM_IMG " + 
	                    "WHERE ROOM_NO IN (" + 
	                    "    SELECT ROOM_NO FROM " + 
	                    "    (SELECT ROWNUM RNUM, V.* FROM " + 
	                    "            (SELECT ROOM_NO  FROM ROOM " + 
	                    "            WHERE DELETE_FL='N' " + 
	                    "            AND " + condition + 
	                    "            ORDER BY ROOM_NO DESC ) V) " + 
	                    ") " + 
	                    "AND ROOM_IMG_LEVEL = 0";
		
		try {
			// int startRow = (pInfo.getCurrentPage() -1) * pInfo.getLimit() + 1;
	        // int endRow = startRow + pInfo.getLimit() - 1 ;
	        
	        pstmt = conn.prepareStatement(query);
	        // pstmt.setInt(1, startRow);
	        // pstmt.setInt(2, endRow);
	         
	         rset = pstmt.executeQuery();
	         
	         // 조회 결과를 저장할 List 생성
	         fList = new ArrayList<RoomImg>();
	         
	         while(rset.next()) {
	            
	        	 RoomImg at = new RoomImg();
	            at.setRoomImgName(rset.getString("ROOM_IMG_NAME"));
	            at.setParentRoomNo(rset.getInt("ROOM_NO"));
	            
	            fList.add(at);
	         }
		}finally {
			close(rset);
			close(pstmt);
		}
		return fList;
	}


	public List<Room> searchRoomList(Connection conn, PageInfo pInfo, String condition) throws Exception{
		List<Room> roomList = null;
		String query = ""
				+ " SELECT ROOM_ADDR, ROOM_TITLE, ROOM_NO, ROOM_IMG_NAME, ROOM_IMG_PATH " + 
				" FROM ROOM " + 
				" JOIN ROOM_IMG USING(ROOM_NO) " + 
				" WHERE ROOM_IMG_LEVEL = 0 ";
	            
		
		try {
			// int startRow = (pInfo.getCurrentPage() -1) * pInfo.getLimit() + 1;
	        // int endRow = startRow + pInfo.getLimit() - 1 ;
	        
	         pstmt = conn.prepareStatement(query);
	        // pstmt.setInt(1, startRow);
	        // pstmt.setInt(2, endRow);
	         
	         rset = pstmt.executeQuery();
	         
	         // 조회 결과를 저장할 List 생성
	         roomList = new ArrayList<Room>();
	         
	         while(rset.next()) {
	            
	        	 Room at = new Room();
	        	 at.setRoomAddr(rset.getString("ROOM_ADDR"));
	        	 at.setRoomTitle(rset.getString("ROOM_TITLE"));
	             at.setRoomNo(rset.getInt("ROOM_NO"));
	             at.setPet(rset.getString("ROOM_IMG_NAME"));
	             at.setBed(rset.getString("ROOM_IMG_PATH"));
	            
	            roomList.add(at);
	         }
	         System.out.println(roomList);
		}finally {
			close(rset);
			close(pstmt);
		}
		return roomList;
	}



	public List<Room> searchSubwayList(Connection conn, PageInfo pInfo, String searchValue) throws Exception{
		List<Room> subList = null;
		
		System.out.println(searchValue);
		String query = 
	            " SELECT ROOM_ADDR, ROOM_TITLE FROM ROOM  " + 
	            "    WHERE ROOM_NO IN (" + 
	            "        SELECT ROOM_NO FROM " + 
	            "        (SELECT ROWNUM RNUM, V.* FROM " + 
	            "                (SELECT ROOM_NO  FROM ROOM " + 
	            "                WHERE DELETE_FL='N' " + 
	            "                AND STATION_ADDR LIKE '%' || '" + searchValue + "' || '%' " + 
	            "                ORDER BY ROOM_NO DESC ) V) " + 
	            "       WHERE RNUM BETWEEN ? AND ? " + 
	            "    ) ";
		
		try {
			int startRow = (pInfo.getCurrentPage() -1) * pInfo.getLimit() + 1;
	        int endRow = startRow + pInfo.getLimit() - 1 ;
	        
	        pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, startRow);
	         pstmt.setInt(2, endRow);
	         
	         rset = pstmt.executeQuery();
	         
	         // 조회 결과를 저장할 List 생성
	         subList = new ArrayList<Room>();
	         
	         while(rset.next()) {
	            
	        	 Room at = new Room();
	        	 at.setRoomTitle(rset.getString("ROOM_TITLE"));
	             at.setRoomAddr(rset.getString("ROOM_ADDR"));
	            
	             subList.add(at);
	         }
	         System.out.println(subList);
		}finally {
			close(rset);
			close(pstmt);
		}
		return subList;
		
	}
	
}
