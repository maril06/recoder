package com.project.recoder.board.model.service;

import com.project.recoder.board.model.dao.BoardDAO;
import com.project.recoder.board.model.vo.Board;
import com.project.recoder.board.model.vo.BoardImg;
import com.project.recoder.board.model.vo.PageInfo;
import static com.project.recoder.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

public class BoardService {

	private BoardDAO dao = new BoardDAO();
	
	/** 페이징 처리를 위한 값 계산 Service
	 * @param cp
	 * @return pInfo
	 * @throws Exception
	 */
	public PageInfo getPageInfo(String cp) throws Exception{
		Connection conn = getConnection();
		
		int currentPage  = cp == null ? 1 : Integer.parseInt(cp);
		//System.out.println("currentPage : "+currentPage);
		int listCount = dao.getListCount(conn);
		
		close(conn);
		
		return new PageInfo(currentPage, listCount);
	}

	/** 게시글 목록 조회 service
	 * @param pInfo
	 * @return bList
	 * @throws Exception
	 */
	public List<Board> selectBoardList(PageInfo pInfo) throws Exception{
		Connection conn = getConnection();
		
		List<Board> bList = dao.selectBoardList(conn, pInfo);
		
		close(conn);
		
		return bList;
	}

	/** 게시글 상세조회 service
	 * @param boardNo
	 * @return board
	 * @throws Exception
	 */
	public Board selectBoard(int boardNo) throws Exception{
		Connection conn = getConnection();
		
		Board board = dao.selectBoard(conn, boardNo);
		
		if(board != null) { //DB에서 조회 성공 시
			
			//조회수 증가
			int result = dao.increaseReadCount(conn, boardNo);
			
			if(result > 0) {
				commit(conn);
				
				//반환되는 Board 데이터에는 조회수가 증가되어있지 않기 때문에
				// 조회수 1 증가 시켜주기
				board.setReadCount(board.getReadCount()+1);
			}
			else {
				rollback(conn);
			}
				
			
		}
		
		close(conn);
		
		return board;
	}

	
	/**게시글에 포함된 이미지 목록 조회 Service
	 * @param boardNo
	 * @return fList
	 * @throws Exception
	 */
	public List<BoardImg> selectBoardFiles(int boardNo) throws Exception{
		Connection conn = getConnection();
		
		List<BoardImg> fList = dao.selectBoardFiles(conn, boardNo);
		
		close(conn);
		
		return fList;
	}

}
