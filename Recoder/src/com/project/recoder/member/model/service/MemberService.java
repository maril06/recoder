package com.project.recoder.member.model.service;

import com.project.recoder.broker.model.vo.Broker;
import com.project.recoder.member.model.dao.MemberDAO;
import com.project.recoder.member.model.vo.Member;
import static com.project.recoder.common.JDBCTemplate.*;

import java.sql.Connection;

public class MemberService {

	private MemberDAO dao = new MemberDAO();

	/** 로그인 service
	 * @param member
	 * @return member
	 * @throws Exception
	 */
	public Member loginMember(Member member) throws Exception{
		Connection conn = getConnection();
		
		Member loginMember = dao.loginMember(member, conn);
		
		close(conn);
		
		return loginMember;
	}

	
	
	
	
}
