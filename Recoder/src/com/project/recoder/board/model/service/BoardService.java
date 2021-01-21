package com.project.recoder.board.model.service;

import com.project.recoder.board.model.dao.BoardDAO;
import com.project.recoder.board.model.vo.Board;
import com.project.recoder.board.model.vo.BoardImg;
import com.project.recoder.board.model.vo.PageInfo;
import com.project.recoder.room.model.service.FileInsertFailedException;

import static com.project.recoder.common.JDBCTemplate.*;

import java.io.File;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

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

	
	

	/** 게시글 작성 service
	 * @param map
	 * @return result
	 * @throws Exception
	 */
	public int insertBoard(Map<String, Object> map) throws Exception {
		Connection conn = getConnection();
		
		int result = 0;
		
		int boardNo= dao.selectNextNo(conn);
		
		if(boardNo >0) {
			map.put("boardNo", boardNo);
			/*
			 * String boardTitle = (String)map.get("boardTitle"); String boardContent =
			 * (String)map.get("boardContent");
			 * 
			 * boardTitle = replaceParameter(boardTitle); boardContent =
			 * replaceParameter(boardContent);
			 * 
			 * boardContent = boardContent.replaceAll("\r\n", "<br>");
			 * 
			 * map.put("boardTitle",boardTitle ); map.put("boardContent",boardContent );
			 */
		}
		
		try {
			result = dao.insertBoard(conn, map); //게시글 부분만 삽입
			/*
			 * List<BoardImg> fList = (List<BoardImg>)map.get("fList");
			 * 
			 * System.out.println("나와라" +fList); if(result > 0 && !fList.isEmpty()) { result
			 * = 0;
			 * 
			 * for(BoardImg img : fList) {
			 * 
			 * img.setboardNo(boardNo);
			 * 
			 * 
			 * result = dao.insertImgs(conn, img); //삽입 성공시 1 반환
			 * 
			 * if(result == 0) { throw new FileInsertFailedException("파일 정보 삽입 실패"); } } }
			 */
		} catch (Exception e) {
			List<BoardImg> fList = (List<BoardImg>)map.get("fList");
			
			if(!fList.isEmpty()) {
				for(BoardImg img : fList) {
					String filePath = img.getboardImgPath();
					String fileName = img.getboardImgName();
					
					File deleteFile = new File(filePath + fileName);
					
					if(deleteFile.exists()) {
						deleteFile.delete();
					}
				}
			}
			
			throw e;
		}
		
		if(result > 0) {
			commit(conn);
			result = boardNo;
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/** 크로스 사이트 스크립팅 방지
	 * @param param
	 * @return
	 */
	private String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
			result = result.replaceAll(" ", "&nbsp");
		}
		
		return result;
		
	}

	/** 게시글 삭제
	 * @param boardNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteBoard(int boardNo) throws Exception{
		Connection conn = getConnection();
		
		int result = dao.deleteBoard(conn, boardNo);
		
		if(result > 0) commit(conn);
		else			rollback(conn);
		
		return result;
	}

	/** 게시글 수정 뷰 service
	 * @param boardNo
	 * @return board
	 * @throws Exception
	 */
	public Board updateView(int boardNo) throws Exception{
		Connection conn = getConnection();
		
		Board board = dao.updateView(conn, boardNo);
		
		close(conn);
		
		return board;
	}

	/** 게시글 수정 service
	 * @param map
	 * @return result
	 * @throws Exception
	 */
	public int updateBoard(Map<String, Object> map) throws Exception{
		Connection conn = getConnection();
		
		int result = dao.updateBoard(conn, map);
		
		if(result > 0) commit(conn);
		else			rollback(conn);
		
		return result;
	}
}
