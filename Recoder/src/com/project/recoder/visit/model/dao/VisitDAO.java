package com.project.recoder.visit.model.dao;

import static com.project.recoder.common.JDBCTemplate.*;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import com.project.recoder.room.model.dao.RoomDAO;

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

}
