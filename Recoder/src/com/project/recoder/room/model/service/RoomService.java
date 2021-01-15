package com.project.recoder.room.model.service;

import static com.project.recoder.common.JDBCTemplate.*;

import java.io.File;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.project.recoder.room.model.dao.RoomDAO;
import com.project.recoder.room.model.vo.Room;
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
			System.out.println("roomNo받아옴");
			
			try {
				result = dao.roomInsert(conn, map);
				System.out.println("인ㅓ트"+result);
				List<RoomImg> mList = (List<RoomImg>)map.get("mList");
				
				if(result > 0 && !mList.isEmpty()) {
					 
					result = 0; 
					
					for(RoomImg img : mList) {
						
						img.setParentRoomNo(roomNo);
						result = dao.insertImg(conn, img);
						
						if(result == 0) { 
							throw new FileInsertFailedException("파일 정보 삽입 실패");
							
						}
					}
				}
			
			} catch (Exception e) {
				e.printStackTrace();
				List<RoomImg> mList = (List<RoomImg>)map.get("mList");
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
			
			if(result > 0) {
				commit(conn);
				
				result = roomNo;
				
			}else {
				rollback(conn);
			}
		
		}
		close(conn);
		
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

	public Room updateView(int roomNo) throws Exception {
		Connection conn = getConnection();
		
		return null;
	}


	public List<RoomImg> selectRoomImg(int roomNo) throws Exception {
		Connection conn = getConnection();
		
		return null;
	}


	public int roomUpdate(Map<String, Object> map) throws Exception {
		Connection conn = getConnection();
		int result = 0;
		
		
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}


	public int updateRoomStatus(int roomNo) throws Exception {
		Connection conn = getConnection();
		int result =0;
		
		result = dao.updateRoomStatus(conn, roomNo);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}




}
