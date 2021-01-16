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

	/** 회원가입 service
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public int signUp(Member member) throws Exception{
		Connection conn = getConnection();
		
		int result = dao.signUp(member, conn);
		
		close(conn);
		
		return result;
	}

	public int chkPwd(Member loginMember, String chkPw) throws Exception{
		Connection conn = getConnection();	 
		int result = dao.chkPwd(loginMember, chkPw, conn);
		close(conn);
		return result;
	}

	public int updateStatus(Member loginMember, String chkPw) throws Exception{
		Connection conn = getConnection();
		int result = dao.chkPwd(loginMember, chkPw, conn);
		
		if(result > 0) {
			result = dao.updateStatus(conn, loginMember);
			
			if(result > 0) commit(conn);
			else			rollback(conn);
			
		}else {
			result = -1;
			System.out.println(result);
		}
		
		return result;
	}

	public int updateMember(Member member, String memberPw) throws Exception{
		Connection conn = getConnection();
		if(memberPw == "") {
			memberPw = dao.currentPW(conn, member);
		}
		member.setMemPw(memberPw);

		int result = dao.updateMember(conn, member);
		//3) 트랜잭션 처리
		if(result >0) {commit(conn);}
		else {rollback(conn);}
		//4) connection 반환
		close(conn);
		//5) retrun
		return result;
	}

	
	
	
	
}
