package com.project.recoder.board.model.service;

import static com.project.recoder.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.project.recoder.board.model.dao.BoardDAO;
import com.project.recoder.board.model.vo.Board;
import com.project.recoder.room.model.vo.PageInfo;

public class BoardService {
	
	private BoardDAO dao = new BoardDAO();

	
	
	/** 전체 게시글 수 반환 Service
	 * @param cp
	 * @return
	 * @throws Exception
	 */
	public PageInfo getPageInfo(String cp) throws Exception {
		
		Connection conn = getConnection();
		
		int currentPage = cp == null ? 1 : Integer.parseInt(cp);
		
		int listCount = dao.getListCount(conn);	
		
		close(conn);
		
		return new PageInfo(currentPage, listCount);
	}

	public List<Board> selectBoardList(PageInfo pInfo) throws Exception{
		
		Connection conn = getConnection();
		
		List<Board> bList = dao.selectBoardList(conn, pInfo);
		
		close(conn);
		
		return bList;
	}

}
