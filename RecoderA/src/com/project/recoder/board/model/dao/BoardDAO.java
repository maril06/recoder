package com.project.recoder.board.model.dao;

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
import com.project.recoder.board.model.vo.Board;
import com.project.recoder.room.model.vo.PageInfo;

public class BoardDAO {

	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rset = null;
	
	private Properties prop = null;
	
	public BoardDAO() {
		try {
			String filePath = AdminDAO.class.getResource("/com/project/recoder/sql/board/board-query.xml").getPath();

			prop = new Properties();

			prop.loadFromXML(new FileInputStream(filePath));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	/** 전체 게시글 수 조회 DAO
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




	/** 게시글 목록 조회 DAO
	 * @param conn
	 * @param pInfo
	 * @return bList
	 * @throws Exception
	 */
	public List<Board> selectBoardList(Connection conn, PageInfo pInfo) throws Exception{
		
		List<Board> bList = null;
		
		String query = prop.getProperty("selectBoardList");
		
		try {
			int startRow = (pInfo.getCurrentPage() - 1) * pInfo.getLimit() + 1;

			int endRow = startRow + pInfo.getLimit() - 1;

			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			
			bList = new ArrayList<Board>();
			
			while(rset.next()) {
				Board board = new Board(
										rset.getInt("BOARD_NO"),
										rset.getTimestamp("CREATE_DT"),
										rset.getString("TITLE"),
										rset.getString("CONTENT"),
										rset.getInt("READ_COUNT"),
										rset.getString("DELETE_FL"),
										rset.getInt("BOARD_CD"),
										rset.getInt("MEM_NO"),
										rset.getString("MEM_NICK"));
				
				bList.add(board);
						
			}
			
			
		}finally {
			close(rset);
			close(pstmt);
		}
		return bList;
	}

}
