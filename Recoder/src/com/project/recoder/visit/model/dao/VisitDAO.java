package com.project.recoder.visit.model.dao;

import static com.project.recoder.common.JDBCTemplate.*;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;


import com.project.recoder.room.model.dao.RoomDAO;
import com.project.recoder.room.model.vo.Room;

public class VisitDAO {
	
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rset = null;
	
	private Properties prop = null;
	
	public VisitDAO() {
		String fileName = VisitDAO.class.getResource("/com/project/recoder/sql/visit/visit-query.xml").getPath();
		try {
			prop = new Properties();
			prop.loadFromXML(new FileInputStream(fileName)); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int visitSend(Connection conn, int roomNo, int memNo, int visitCd) throws Exception{
		int result = 0;
		String query = prop.getProperty("visitSend");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, roomNo);
			pstmt.setInt(3, visitCd);
			
			result = pstmt.executeUpdate();
			
			
		} finally {
			close(pstmt);
			
		}
		return result;
	}

	public List<Room> selectRoom(Connection conn, int brokerNo) throws Exception{
		List<Room> rList = null;
		String query = prop.getProperty("selectRoom");
		try {
			
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, brokerNo);

			rset = pstmt.executeQuery();

			rList = new ArrayList<Room>();

			while (rset.next()) {
				Room room = new Room(
					rset.getInt("ROOM_NO"), 
					rset.getString("ROOM_TITLE"),
					rset.getString("ROOM_INFO"),
					rset.getInt("GMEM_NO"));
				
				rList.add(room);
			}
			
			System.out.println(rList);
			
		} finally {
			close(rset);
			close(stmt);
		}
		
		return null;
	}


}
