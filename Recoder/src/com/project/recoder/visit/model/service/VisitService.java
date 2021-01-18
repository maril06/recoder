package com.project.recoder.visit.model.service;

import static com.project.recoder.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.project.recoder.member.model.vo.Member;
import com.project.recoder.room.model.vo.Room;
import com.project.recoder.visit.model.dao.VisitDAO;


public class VisitService {
	
	private VisitDAO dao = new VisitDAO();

	/**
	 * @param visitCd 
	 * @param visitCd2 
	 * @param memNo 
	 * @return
	 * @throws Exception
	 */
	public int visitSend(int roomNo, int memNo, int visitCd) throws Exception{
		
		Connection conn = getConnection();
		int result = 0;
		result = dao.visitSend(conn, roomNo, memNo, visitCd);
		
		if (result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<Room> selectRoom(int brokerNo) throws Exception{
		Connection conn = getConnection();
		List<Room> room = null;
		
		room = dao.selectRoom(conn, brokerNo);
		close(conn);
		return room;
	}

}
