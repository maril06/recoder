package com.project.recoder.common.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import com.project.recoder.broker.model.dao.BrokerDAO;
import static com.project.recoder.common.JDBCTemplate.*;

public class commonDAO {

	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rset = null;

	private Properties prop = null;
	

	public commonDAO() {
		try {
			String filePath = 
					BrokerDAO.class.getResource("/com/project/recoder/sql/common/common-query.xml").getPath();
			
			prop = new Properties();
			
			prop.loadFromXML(new FileInputStream(filePath));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/** id 중복검사 dao
	 * @param conn
	 * @param id
	 * @return result
	 * @throws Exception
	 */
	public int idDupCheck(Connection conn, String id)throws Exception {
		int result = 0;
		
		String query = prop.getProperty("idDupCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	/** 닉네임 중복검사 dao
	 * @param conn
	 * @param nickname
	 * @return result
	 * @throws Exception
	 */
	public int nickDupCheck(Connection conn, String nickname) throws Exception{
		int result = 0;
		
		String query = prop.getProperty("nickDupCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nickname);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

}
