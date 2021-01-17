package com.project.recoder.visit.model.vo;

import java.sql.Timestamp;

public class Visit {
	private int memNo;
	private int roomNo;
	private Timestamp visitDt;
	private int visitCd;
	
	public Visit() {
	}

	public Visit(int memNo, int roomNo, Timestamp visitDt, int visitCd) {
		super();
		this.memNo = memNo;
		this.roomNo = roomNo;
		this.visitDt = visitDt;
		this.visitCd = visitCd;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public Timestamp getVisitDt() {
		return visitDt;
	}

	public void setVisitDt(Timestamp visitDt) {
		this.visitDt = visitDt;
	}

	public int getVisitCd() {
		return visitCd;
	}

	public void setVisitCd(int visitCd) {
		this.visitCd = visitCd;
	}

	@Override
	public String toString() {
		return "Visit [memNo=" + memNo + ", roomNo=" + roomNo + ", visitDt=" + visitDt + ", visitCd=" + visitCd + "]";
	}
	
}
