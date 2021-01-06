package com.sp.catdog.community.miss;

public class Reply {
	private int missNum;
	private int missReplyNum;	
	private String userId;
	private String userNick;
	private String missReplyContent;
	private String missReplyCreated;
	
	private int missReplyType;
	private int answerCount;
	
	private int likeUser;
	private int replyLikeCount;
	
	public int getMissNum() {
		return missNum;
	}
	public void setMissNum(int missNum) {
		this.missNum = missNum;
	}
	public int getMissReplyNum() {
		return missReplyNum;
	}
	public void setMissReplyNum(int missReplyNum) {
		this.missReplyNum = missReplyNum;
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
	public String getMissReplyContent() {
		return missReplyContent;
	}
	public void setMissReplyContent(String missReplyContent) {
		this.missReplyContent = missReplyContent;
	}
	public String getMissReplyCreated() {
		return missReplyCreated;
	}
	public void setMissReplyCreated(String missReplyCreated) {
		this.missReplyCreated = missReplyCreated;
	}
	public int getMissReplyType() {
		return missReplyType;
	}
	public void setMissReplyType(int missReplyType) {
		this.missReplyType = missReplyType;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public int getLikeUser() {
		return likeUser;
	}
	public void setLikeUser(int likeUser) {
		this.likeUser = likeUser;
	}
	public int getReplyLikeCount() {
		return replyLikeCount;
	}
	public void setReplyLikeCount(int replyLikeCount) {
		this.replyLikeCount = replyLikeCount;
	}
	
	
}
