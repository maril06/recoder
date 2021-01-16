package com.project.recoder.member.model.dao;

import com.project.recoder.broker.model.vo.Broker;
import com.project.recoder.member.model.vo.Member;
import static com.project.recoder.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

public class MemberDAO {
	
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rset = null;

	private Properties prop = null;
	
	public MemberDAO() {
		//외부에 저장된 XML 파일로  부터 SQL을 얻어옴 (유지보수성 향상)
		try {
			String filePath = 
					MemberDAO.class.getResource("/com/project/recoder/sql/member/member-query.xml").getPath();
			
			prop = new Properties();
			
			prop.loadFromXML(new FileInputStream(filePath));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/** 로그인 dao
	 * @param member
	 * @return member
	 * @throws Exception
	 */
	public Member loginMember(Member member, Connection conn) throws Exception{
		Member loginMember = null;
		String query = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getMemId());
			pstmt.setString(2, member.getMemPw());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginMember = new Member(rset.getInt(1),
										 rset.getString(2), 
										 rset.getString(3),
										 rset.getString(4), 
										 rset.getString(5), 
										 rset.getString(6));
			}
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginMember;
	}

	/** 공인중개사 추가정보 조회 DAO
	 * @param memNo2
	 * @param conn
	 * @return broker
	 * @throws Exception
	 */
	public Broker loginBroker(int memNo2, Connection conn) throws Exception{
		Broker loginBroker = null;
		
		String query = prop.getProperty("loginBroker");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, memNo2);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginBroker = new Broker();
				loginBroker.setBrokderCreti(rset.getString(1));
				loginBroker.setBrokderAddr(rset.getString(2));
			}
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginBroker;
	}

}
