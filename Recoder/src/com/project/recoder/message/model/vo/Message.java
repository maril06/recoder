package com.project.recoder.message.model.vo;

import java.sql.Timestamp;

public class Message {
	private int msgNo;
	private String msgContent;
	private Timestamp createDate;
	private int memReceive;
	private int memSend;
	
	public Message() {

	}

	public Message(int msgNo, String msgContent, Timestamp createDate, int memReceive, int memSend) {
		super();
		this.msgNo = msgNo;
		this.msgContent = msgContent;
		this.createDate = createDate;
		this.memReceive = memReceive;
		this.memSend = memSend;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public int getMemReceive() {
		return memReceive;
	}

	public void setMemReceive(int memReceive) {
		this.memReceive = memReceive;
	}

	public int getMemSend() {
		return memSend;
	}

	public void setMemSend(int memSend) {
		this.memSend = memSend;
	}

	@Override
	public String toString() {
		return "Message [msgNo=" + msgNo + ", msgContent=" + msgContent + ", createDate=" + createDate + ", memReceive="
				+ memReceive + ", memSend=" + memSend + "]";
	}
	
}
