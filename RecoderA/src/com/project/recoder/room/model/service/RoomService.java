package com.project.recoder.room.model.service;

import static com.project.recoder.common.JDBCTemplate.*;



import java.sql.Connection;
import java.util.List;

import com.project.recoder.room.model.dao.RoomDAO;
import com.project.recoder.room.model.vo.PageInfo;
import com.project.recoder.room.model.vo.Room;

public class RoomService {
	
	private RoomDAO dao = new RoomDAO();
	

	/** 페이징 처리를 위한 값 계산 Service
	 * @param cp
	 * @return PageInfo
	 * @throws Exception
	 */
	public PageInfo getPageInfo(String cp) throws Exception {
		Connection conn = getConnection();
		
		int currentPage = cp == null ? 1 : Integer.parseInt(cp);
		
		int listCount = dao.getListCount(conn);
		
		close(conn);
		return new PageInfo(currentPage, listCount);
	}

	
	
	
	/** 전체 room 목록 조회
	 * @param pInfo
	 * @return rList
	 * @throws Exception
	 */
	public List<Room> selectRoomList(PageInfo pInfo) throws Exception {
		Connection conn = getConnection();
		
		List<Room> rList = dao.selectRoomList(conn, pInfo);
		
		close(conn);
		
		return rList;
	}




	public List<Room> selectFakeList(PageInfo pInfo) throws Exception{
		// TODO Auto-generated method stub
		return null;
	}



	
	/** Room 삭제 Service
	 * @param numberList
	 * @return result
	 * @throws Exception
	 */
	public int updateRoomDelete(String numberList) throws Exception {
		Connection conn = getConnection();
		
		int result = dao.updateRoomDelete(conn, numberList);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}




	public int updateRoomRecover(String numberList) throws Exception {
		
		Connection conn = getConnection();
		
		int result = dao.updateRoomRecover(conn,numberList);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
