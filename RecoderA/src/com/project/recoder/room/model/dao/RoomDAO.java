package com.project.recoder.room.model.dao;

import static com.project.recoder.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.project.recoder.admin.model.dao.AdminDAO;
import com.project.recoder.room.model.vo.PageInfo;
import com.project.recoder.room.model.vo.Room;

public class RoomDAO {

	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rset = null;

	private Properties prop = null;

	public RoomDAO() {
		try {
			String filePath = AdminDAO.class.getResource("/com/project/recoder/sql/room/room-query.xml").getPath();

			prop = new Properties();

			prop.loadFromXML(new FileInputStream(filePath));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 전체 등록된(삭제/등록 모든) ROOM의 개수 반환 DAO
	 * 
	 * @param conn
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(Connection conn) throws Exception {

		int listCount = 0;

		String query = prop.getProperty("getListCount");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {

				listCount = rset.getInt(1);
			}

		} finally {
			close(rset);
			close(stmt);

		}
		return listCount;
	}

	/**
	 * 전체 room 목록 조회 DAO
	 * 
	 * @param conn
	 * @param pInfo
	 * @return rList
	 * @throws Exception
	 */
	public List<Room> selectRoomList(Connection conn, PageInfo pInfo) throws Exception {

		List<Room> rList = null;

		String query = prop.getProperty("selectRoomList");

		try {
			int startRow = (pInfo.getCurrentPage() - 1) * pInfo.getLimit() + 1;

			int endRow = startRow + pInfo.getLimit() - 1;

			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			rList = new ArrayList<Room>();

			while (rset.next()) {
				Room room = new Room(
						rset.getInt("ROOM_NO"), 
						rset.getString("DELETE_FL"),
						rset.getString("ROOM_TITLE"),
						rset.getString("MEM_NICK"));

				
				rList.add(room);
			}

		} finally {
			close(rset);
			close(pstmt);
		}
		return rList;

	}

	/** Room 삭제 Service
	 * @param conn
	 * @param numberList
	 * @return result
	 * @throws Exception
	 */
	public int updateRoomDelete(Connection conn, String numberList) throws Exception{
		
		int result = 0;
		
		
		String query = "UPDATE ROOM SET "
				 + " DELETE_FL = 'Y' "
				 + " WHERE ROOM_NO IN( " + numberList + ")";
		
		try {
			stmt = conn.createStatement();
			
			result = stmt.executeUpdate(query);
			
		}finally {
			
			close(stmt);
		}
		
		return result;
	}

	public int updateRoomRecover(Connection conn, String numberList) throws Exception {
		
		int result = 0;
		
		String query = "UPDATE ROOM SET "
				 + " DELETE_FL = 'N' "
				 + " WHERE ROOM_NO IN( " + numberList + ")";
		
		try {
			stmt = conn.createStatement();
			
			result = stmt.executeUpdate(query);
			
		}finally {
			
			close(stmt);
		}
		
		
		return result;
	}

}
