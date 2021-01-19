package com.project.recoder.board.model.vo;

public class BoardImg {

	private int BoardImgNo;
	private String BoardImgPath;
	private String BoardImgName;
	private int BoardImgLevel;
	private int boardNo;
	
	public BoardImg() {
		// TODO Auto-generated constructor stub
	}

	public BoardImg(int boardImgNo, String boardImgName, int boardImgLevel) {
		super();
		BoardImgNo = boardImgNo;
		BoardImgName = boardImgName;
		BoardImgLevel = boardImgLevel;
	}

	public BoardImg(int boardImgNo, String boardImgPath, String boardImgName, int boardImgLevel, int boardNo) {
		super();
		BoardImgNo = boardImgNo;
		BoardImgPath = boardImgPath;
		BoardImgName = boardImgName;
		BoardImgLevel = boardImgLevel;
		this.boardNo = boardNo;
	}

	public int getBoardImgNo() {
		return BoardImgNo;
	}

	public void setBoardImgNo(int boardImgNo) {
		BoardImgNo = boardImgNo;
	}

	public String getBoardImgPath() {
		return BoardImgPath;
	}

	public void setBoardImgPath(String boardImgPath) {
		BoardImgPath = boardImgPath;
	}

	public String getBoardImgName() {
		return BoardImgName;
	}

	public void setBoardImgName(String boardImgName) {
		BoardImgName = boardImgName;
	}

	public int getBoardImgLevel() {
		return BoardImgLevel;
	}

	public void setBoardImgLevel(int boardImgLevel) {
		BoardImgLevel = boardImgLevel;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "BoardImg [BoardImgNo=" + BoardImgNo + ", BoardImgPath=" + BoardImgPath + ", BoardImgName="
				+ BoardImgName + ", BoardImgLevel=" + BoardImgLevel + ", boardNo=" + boardNo + "]";
	}
	
	
	
}

