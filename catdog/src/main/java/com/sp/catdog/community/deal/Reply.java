package com.sp.catdog.community.deal;

public class Reply {
	private int dealNum;
	private int dealReplyNum;
	private String dealReplyContent;
	private String dealReplyCreated;
	private int dealReplyType;
	private int dealReplySecret;
	
	private String userId;
	private String userNick;
	private String writeUser;

	private int answerCount;

	public int getDealNum() {
		return dealNum;
	}

	public void setDealNum(int dealNum) {
		this.dealNum = dealNum;
	}

	public int getDealReplyNum() {
		return dealReplyNum;
	}

	public void setDealReplyNum(int dealReplyNum) {
		this.dealReplyNum = dealReplyNum;
	}

	public String getDealReplyContent() {
		return dealReplyContent;
	}

	public void setDealReplyContent(String dealReplyContent) {
		this.dealReplyContent = dealReplyContent;
	}

	public String getDealReplyCreated() {
		return dealReplyCreated;
	}

	public void setDealReplyCreated(String dealReplyCreated) {
		this.dealReplyCreated = dealReplyCreated;
	}

	public int getDealReplyType() {
		return dealReplyType;
	}

	public void setDealReplyType(int dealReplyType) {
		this.dealReplyType = dealReplyType;
	}

	public int getDealReplySecret() {
		return dealReplySecret;
	}

	public void setDealReplySecret(int dealReplySecret) {
		this.dealReplySecret = dealReplySecret;
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

	public int getAnswerCount() {
		return answerCount;
	}

	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}

	public String getWriteUser() {
		return writeUser;
	}

	public void setWriteUser(String writeUser) {
		this.writeUser = writeUser;
	}
	
}
