package com.project.recoder.notice.model.dao;

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
import com.project.recoder.notice.model.vo.Notice;
import com.project.recoder.room.model.vo.PageInfo;

public class NoticeDAO {
	
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rset = null;

	private Properties prop = null;
	
	public NoticeDAO() {
		try {
			String filePath = AdminDAO.class.getResource("/com/project/recoder/sql/notice/notice-query.xml").getPath();

			prop = new Properties();

			prop.loadFromXML(new FileInputStream(filePath));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int getListCount(Connection conn) throws Exception {
		int listCount = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return listCount;
	}


	/** 공지글 목록 조회 DAO
	 * @param conn
	 * @param pInfo
	 * @return nList
	 * @throws Exception
	 */
	public List<Notice> selectNoticeList(Connection conn, PageInfo pInfo) throws Exception {
		
		List<Notice> nList = null;
		
		String query = prop.getProperty("selectNoticeList");
		
		try {
			int startRow = (pInfo.getCurrentPage() - 1) * pInfo.getLimit() + 1;
			
			int endRow = startRow + pInfo.getLimit() -1;
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			nList = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice notice = new Notice(rset.getInt("BOARD_NO"),
						rset.getTimestamp("CREATE_DT"),
						rset.getString("TITLE"),
						rset.getString("CONTENT"),
						rset.getInt("READ_COUNT"),
						rset.getString("DELETE_FL"));
	
				
				nList.add(notice);
			}
			
			
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return nList;
	}

}
