package com.project.recoder.broker.model.dao;

import static com.project.recoder.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import com.project.recoder.broker.model.vo.Broker;
import com.project.recoder.member.model.dao.MemberDAO;
import com.project.recoder.member.model.vo.Member;

public class BrokerDAO {

	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rset = null;

	private Properties prop = null;
	
	public BrokerDAO() {
		try {
			String filePath = 
					BrokerDAO.class.getResource("/com/project/recoder/sql/broker/broker-query.xml").getPath();
			
			prop = new Properties();
			
			prop.loadFromXML(new FileInputStream(filePath));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** 공인중개사 로그인 dao
	 * @param broker
	 * @param conn
	 * @return loginBroker
	 * @throws Exception
	 */
	public Broker loginBroker(Broker broker, Connection conn) throws Exception{
		Broker loginBroker = null;
		
		String query = prop.getProperty("loginBroker");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, broker.getMemId());
			pstmt.setString(2, broker.getMemPw());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				//MEM_NO, MEM_ID, MEM_NICK, MEM_TEL, MEM_EMAIL, MEM_GRADE,BROKER_CRETI, BROKER_ADDR, APPROVE_FL
				loginBroker = new Broker(
						rset.getInt("MEM_NO"),
						rset.getString("MEM_ID"), 
						rset.getString("MEM_NICK"), 
						rset.getString("MEM_TEL"), 
						rset.getString("MEM_EMAIL"),
						rset.getString("MEM_GRADE"),
						rset.getString("BROKER_CRETI"),
						rset.getString("BROKER_ADDR"), 
						rset.getString("APPROVE_FL"));
			}
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginBroker;
	}

}
