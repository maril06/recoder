package com.project.recoder.common.service;

import static com.project.recoder.common.JDBCTemplate.*;

import java.sql.Connection;

import com.project.recoder.common.dao.commonDAO;

public class CommonService {

	commonDAO dao = new commonDAO();
	
	/** id 중복검사 service
	 * @param id
	 * @return result
	 * @throws Exception
	 */
	public int idDupCheck(String id) throws Exception{
		Connection conn = getConnection();
		
		int result = dao.idDupCheck(conn, id);
		
		close(conn);
		
		return result;
	}

	/** 닉네임 중복검사 service
	 * @param nickname
	 * @return result
	 * @throws Exception
	 */
	public int nickDupCheck(String nickname) throws Exception {
		Connection conn = getConnection();
		
		int result = dao.nickDupCheck(conn, nickname);
		
		close(conn);
		
		return result;
	}

}
