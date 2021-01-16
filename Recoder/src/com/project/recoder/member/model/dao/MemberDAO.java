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


	/** 회원가입 dao
	 * @param member
	 * @param conn
	 * @return result
	 * @throws Exception
	 */
	public int signUp(Member member, Connection conn) throws Exception{
		int result = 0;
		String query = prop.getProperty("signUp");
		
		try {
			// 3) PreparedStatement 객체를 얻어와 SQL구문을 세팅
			pstmt = conn.prepareStatement(query);
			
			// 4)위치홀더(?)에 알맞은 값 세팅
			pstmt.setString(1, member.getMemId());
			pstmt.setString(2, member.getMemPw());
			pstmt.setString(3, member.getMemNick());
			pstmt.setString(4, member.getMemTel());
			pstmt.setString(5, member.getMemEmail());
			
			// 5) SQL 구문 수행 후 반환값 저장
			result = pstmt.executeUpdate();
			
		} finally {
			// 6) 사용한 JDBC 자원 반환
			close(pstmt);
		}
		
		// 7) 결과 반환
		return result;
	}

}
