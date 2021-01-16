package com.project.recoder.notice.model.service;


import static com.project.recoder.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.project.recoder.notice.model.dao.NoticeDAO;
import com.project.recoder.notice.model.vo.Notice;
import com.project.recoder.room.model.vo.PageInfo;

public class NoticeService {
	
	private NoticeDAO dao = new NoticeDAO();

	public PageInfo getPageInfo(String cp) throws Exception {
		
		Connection conn = getConnection();
		
		int currentPage = cp == null ? 1 : Integer.parseInt(cp);
		
		// DB에서 전체 게시글 수를 조회하여 반환 받기
		// DB에서 전체 게시글 수를 조회하여 반환 받기
		int listCount = dao.getListCount(conn);	
		
		close(conn);
		
		// 얻어온 현재 페이지와, DB에서 조회한 전체 게시글 수를 이용하여
		// PageInfo 객체를 생성함
		return new PageInfo(currentPage, listCount);
	}

	public List<Notice> selectNoticeList(PageInfo pInfo) throws Exception {
		
		Connection conn = getConnection();
		
		List<Notice> nList = dao.selectNoticeList(conn, pInfo);
		
		close(conn);
		
		return nList;
	}

}
