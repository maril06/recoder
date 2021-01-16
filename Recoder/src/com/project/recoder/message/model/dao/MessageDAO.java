package com.project.recoder.message.model.dao;

import static com.project.recoder.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import com.project.recoder.room.model.dao.RoomDAO;

public class MessageDAO {

	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rset = null;
	
	private Properties prop = null;
	
	public MessageDAO() {
		String fileName = RoomDAO.class.getResource("/com/project/recoder/sql/message/message-query.xml").getPath();
		try {
			prop = new Properties();
			prop.loadFromXML(new FileInputStream(fileName)); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/** 매물에서 메시지 전송 DAO
	 * @param conn
	 * @param msgContext
	 * @param brokerNo
	 * @param myNo
	 * @return
	 * @throws Exception
	 */
	public int messageSend(Connection conn, String msgContext, int brokerNo, int myNo) throws Exception{
		int result = 0;
		String query = prop.getProperty("messageSend");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, msgContext);
			pstmt.setInt(2, myNo);
			pstmt.setInt(3, brokerNo);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		
				
		
		return result;
	}
}
