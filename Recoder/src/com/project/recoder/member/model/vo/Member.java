package com.project.recoder.member.model.vo;

public class Member {
	private int memNo2; // 회원번호
	private String brokderCreti;
	private String brokderAddr;
	private String approveFl;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(int memNo2, String brokderCreti, String brokderAddr, String approveFl) {
		super();
		this.memNo2 = memNo2;
		this.brokderCreti = brokderCreti;
		this.brokderAddr = brokderAddr;
		this.approveFl = approveFl;
	}

	public int getMemNo2() {
		return memNo2;
	}

	public void setMemNo2(int memNo2) {
		this.memNo2 = memNo2;
	}

	public String getBrokderCreti() {
		return brokderCreti;
	}

	public void setBrokderCreti(String brokderCreti) {
		this.brokderCreti = brokderCreti;
	}

	public String getBrokderAddr() {
		return brokderAddr;
	}

	public void setBrokderAddr(String brokderAddr) {
		this.brokderAddr = brokderAddr;
	}

	public String getApproveFl() {
		return approveFl;
	}

	public void setApproveFl(String approveFl) {
		this.approveFl = approveFl;
	}

	@Override
	public String toString() {
		return "Member [memNo2=" + memNo2 + ", brokderCreti=" + brokderCreti + ", brokderAddr=" + brokderAddr
				+ ", approveFl=" + approveFl + "]";
	}
}
