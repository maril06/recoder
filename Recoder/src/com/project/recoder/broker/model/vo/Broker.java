package com.project.recoder.broker.model.vo;

public class Broker {
	private int memNo;
	private String memId;
	private String memPw;
	private String memNick;
	private String memTel;
	private String memEmail;
	private String memStateFl;
	private String memGrade;
	private int memNo2; // 회원번호
	private String brokderCreti;
	private String brokderAddr;
	private String approveFl;
	
	public Broker() {
		// TODO Auto-generated constructor stub
	}

	
	
	public Broker(int memNo, String memId, String memPw, String memNick, String memTel, String memEmail,
			String memStateFl, String memGrade, int memNo2, String brokderCreti, String brokderAddr, String approveFl) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPw = memPw;
		this.memNick = memNick;
		this.memTel = memTel;
		this.memEmail = memEmail;
		this.memStateFl = memStateFl;
		this.memGrade = memGrade;
		this.memNo2 = memNo2;
		this.brokderCreti = brokderCreti;
		this.brokderAddr = brokderAddr;
		this.approveFl = approveFl;
	}

	//로그인용 생성자
	
	public Broker(int memNo, String memId, String memNick, String memTel, String memEmail, String memGrade,
			String brokderCreti, String brokderAddr, String approveFl) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memNick = memNick;
		this.memTel = memTel;
		this.memEmail = memEmail;
		this.memGrade = memGrade;
		this.brokderCreti = brokderCreti;
		this.brokderAddr = brokderAddr;
		this.approveFl = approveFl;
	}
	

	public int getMemNo() {
		return memNo;
	}



	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	public String getMemTel() {
		return memTel;
	}

	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemStateFl() {
		return memStateFl;
	}

	public void setMemStateFl(String memStateFl) {
		this.memStateFl = memStateFl;
	}

	public String getMemGrade() {
		return memGrade;
	}

	public void setMemGrade(String memGrade) {
		this.memGrade = memGrade;
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
		return "Broker [memNo=" + memNo + ", memId=" + memId + ", memPw=" + memPw + ", memNick=" + memNick + ", memTel="
				+ memTel + ", memEmail=" + memEmail + ", memStateFl=" + memStateFl + ", memGrade=" + memGrade
				+ ", memNo2=" + memNo2 + ", brokderCreti=" + brokderCreti + ", brokderAddr=" + brokderAddr
				+ ", approveFl=" + approveFl + "]";
	}

	
}
