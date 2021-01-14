package com.project.recoder.room.model.vo;

public class RoomImg {
	private int roomImgNo;
	private String roomImgName;
	private String roomImgPath;
	private int roomImgLevel;
	private int parentRoomNo;
	
	public RoomImg() {
		// TODO Auto-generated constructor stub
	}

	public RoomImg(int roomImgNo, String roomImgName, String roomImgPath, int roomImgLevel, int parentRoomNo) {
		super();
		this.roomImgNo = roomImgNo;
		this.roomImgName = roomImgName;
		this.roomImgPath = roomImgPath;
		this.roomImgLevel = roomImgLevel;
		this.parentRoomNo = parentRoomNo;
	}

	public int getRoomImgNo() {
		return roomImgNo;
	}

	public void setRoomImgNo(int roomImgNo) {
		this.roomImgNo = roomImgNo;
	}

	public String getRoomImgName() {
		return roomImgName;
	}

	public void setRoomImgName(String roomImgName) {
		this.roomImgName = roomImgName;
	}

	public String getRoomImgPath() {
		return roomImgPath;
	}

	public void setRoomImgPath(String roomImgPath) {
		this.roomImgPath = roomImgPath;
	}

	public int getRoomImgLevel() {
		return roomImgLevel;
	}

	public void setRoomImgLevel(int roomImgLevel) {
		this.roomImgLevel = roomImgLevel;
	}

	public int getParentRoomNo() {
		return parentRoomNo;
	}

	public void setParentRoomNo(int parentRoomNo) {
		this.parentRoomNo = parentRoomNo;
	}

	@Override
	public String toString() {
		return "RoomImg [roomImgNo=" + roomImgNo + ", roomImgName=" + roomImgName + ", roomImgPath=" + roomImgPath
				+ ", roomImgLevel=" + roomImgLevel + ", parentRoomNo=" + parentRoomNo + "]";
	}
	
	
}
