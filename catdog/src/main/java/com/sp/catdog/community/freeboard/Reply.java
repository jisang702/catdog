package com.sp.catdog.community.freeboard;

public class Reply {
	private int freeNum;
	private int freeReplyNum;	
	private String userId;
	private String userNick;
	private String freeReplyContent;
	private String freeReplyCreated;
	
	private int freeReplyType;
	private int answerCount;
	
	
	public int getFreeNum() {
		return freeNum;
	}
	public void setFreeNum(int freeNum) {
		this.freeNum = freeNum;
	}
	public int getFreeReplyNum() {
		return freeReplyNum;
	}
	public void setFreeReplyNum(int freeReplyNum) {
		this.freeReplyNum = freeReplyNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getFreeReplyContent() {
		return freeReplyContent;
	}
	public void setFreeReplyContent(String freeReplyContent) {
		this.freeReplyContent = freeReplyContent;
	}
	public String getFreeReplyCreated() {
		return freeReplyCreated;
	}
	public void setFreeReplyCreated(String freeReplyCreated) {
		this.freeReplyCreated = freeReplyCreated;
	}
	public int getFreeReplyType() {
		return freeReplyType;
	}
	public void setFreeReplyType(int freeReplyType) {
		this.freeReplyType = freeReplyType;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	
	
	
}
