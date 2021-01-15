package com.project.recoder.room.model.service;

import static com.project.recoder.common.JDBCTemplate.*;

import java.io.File;
import java.net.ConnectException;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.project.recoder.room.model.dao.RoomDAO;
import com.project.recoder.room.model.vo.RoomImg;

public class RoomService {
	
	private RoomDAO dao = new RoomDAO();

	/** 매물 삽입
	 * @param map
	 * @return result
	 * @throws Exception
	 */
	public int roomInsert(Map<String, Object> map) throws Exception{
		Connection conn = getConnection();
		
		int result = 0;
		
		int roomNo = dao.selectNextNo(conn);
		
		if(roomNo > 0) {
			
			map.put("roomNo", roomNo);
			
			map.put("roomTitle", replaceParameter((String)map.get("roomTitle")));
			map.put("roomInfo", replaceParameter((String)map.get("roomInfo")));
			
			
			try {
				// 4. 게시글 부분 (제목, 내용, 카테고리)만 BOARD 테이블에 삽입하는 DAO 호출
				result = dao.roomInsert(conn, map);
				// autoCommit(false) : Connection 반환하거나 사용자가 commit 지정할때만 commit 한다 
				
				// 5. 파일 정보 부분만 ATTACHMENT 테이블에 삽입하는  DAO 호툴
				List<RoomImg> mList = (List<RoomImg>)map.get("fList");
				
				// 게시글 부분 삽입 성공 && 파일 정보가 있을 경우
				if(result > 0 && !mList.isEmpty()) {
					
					result = 0; // result 재활용 하기 위해 0으로 초기화
					
					// fList의 요소를 하나씩 반복 접근하여 
					// DAO 메소드를 반복 호출해 정보를 삽입한다.
					for(RoomImg img : mList) {
						
						// 파일 정보가 저장된 Attachment 객체에
						// 해당 파일이 작성된 게시글 번호 추가 세팅
						img.setParentRoomNo(roomNo);
						result = dao.insertImg(conn, img);
						
						if(result == 0) { // 파일 정보 삽입 실패
							// break; // 보류
							
							// 강제로 예외를 발생
							throw new FileInsertFailedException("파일 정보 삽입 실패");
							
						}
					}
				}
			
			} catch (Exception e) {
				// 4, 5 번에 대한 추가 작업
				// 게시글 또는 파일 정보 삽입 중 에러 발생 시
				// 서버에 저장된 파일을 삭제하는 방법이 필요.
				
				List<RoomImg> mList = (List<RoomImg>)map.get("fList");
				
				if (!mList.isEmpty()) {
					for(RoomImg img : mList) {
						String filePath = img.getRoomImgPath();
						String fileName = img.getRoomImgName();
						
						File deleteFile = new File(filePath + fileName);
						
						if (deleteFile.exists()) {
							deleteFile.delete(); 
							
						}
					}
				}
				
				throw e;
			} 
			
			
			
			
			
			
		}
		
		
		return result;
	}

	
	private String replaceParameter(String param) {
		
		String result = param;

		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		return result;
	}
}
