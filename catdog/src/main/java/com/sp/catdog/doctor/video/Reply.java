package com.sp.catdog.doctor.video;

public class Reply {
	private int vidReplyNum;
	private int vidNum;
	private String userId;
	private String userName;
	private String vidReplyContent;
	private String vidReplyCreated;
	private int vidReplyType;
	
	private int answerCount;
	private int likeCount;
	
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getVidReplyNum() {
		return vidReplyNum;
	}
	public void setVidReplyNum(int vidReplyNum) {
		this.vidReplyNum = vidReplyNum;
	}
	public int getVidNum() {
		return vidNum;
	}
	public void setVidNum(int vidNum) {
		this.vidNum = vidNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getVidReplyContent() {
		return vidReplyContent;
	}
	public void setVidReplyContent(String vidReplyContent) {
		this.vidReplyContent = vidReplyContent;
	}
	public String getVidReplyCreated() {
		return vidReplyCreated;
	}
	public void setVidReplyCreated(String vidReplyCreated) {
		this.vidReplyCreated = vidReplyCreated;
	}
	public int getVidReplyType() {
		return vidReplyType;
	}
	public void setVidReplyType(int vidReplyType) {
		this.vidReplyType = vidReplyType;
	}


}
