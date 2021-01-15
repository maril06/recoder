package com.project.recoder.room.model.dao;

import static com.project.recoder.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;
import java.util.Properties;

public class RoomDAO {
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rset = null;
	
	private Properties prop = null;
	
	public RoomDAO() {
		String fileName = RoomDAO.class.getResource("/com/project/recoder/sql/room/room-query.xml").getPath();
		try {
			prop = new Properties();
			prop.loadFromXML(new FileInputStream(fileName)); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** 다음 게시글 번호 조회
	 * @param conn
	 * @return result
	 * @throws Exception
	 */
	public int selectNextNo(Connection conn) throws Exception{
		int result = 0;
		String query = prop.getProperty("selectNextRoom");
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
		
	}

	/** 
	 * @param conn
	 * @param map
	 * @return result
	 * @throws Exception
	 */
	public int roomInsert(Connection conn, Map<String, Object> map) throws Exception{
		int result = 0;
		String query = prop.getProperty("roomInsert");
		
		try {
			
		} finally{
			
		}
		return result;
	}
	
	
	
}
