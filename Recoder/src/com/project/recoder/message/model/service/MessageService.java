package com.project.recoder.message.model.service;

import static com.project.recoder.common.JDBCTemplate.*;

import java.sql.Connection;

import com.project.recoder.message.model.dao.MessageDAO;

public class MessageService {
	
	MessageDAO dao = new MessageDAO();
	

	/**
	 * @param msgContext
	 * @param brokerNo
	 * @param myNo
	 * @return result
	 * @throws Exception
	 */
	public int messageSend(String msgContext, int brokerNo, int myNo) throws Exception{
		Connection conn = getConnection();
		int result = 0;
		
		result = dao.messageSend(conn, msgContext, brokerNo, myNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	
}
