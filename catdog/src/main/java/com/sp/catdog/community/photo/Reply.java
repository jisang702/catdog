package com.sp.catdog.community.photo;

public class Reply {
	private int photoNum;
	private int photoReplyNum;	
	private String userId;
	private String userNick;
	private String photoReplyContent;
	private String photoReplyCreated;
	
	private int photoReplyType;
	private int answerCount;
	
	private int likeUser;
	private int replyLikeCount;
	
	public int getPhotoNum() {
		return photoNum;
	}
	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}
	public int getPhotoReplyNum() {
		return photoReplyNum;
	}
	public void setPhotoReplyNum(int photoReplyNum) {
		this.photoReplyNum = photoReplyNum;
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
	public String getPhotoReplyContent() {
		return photoReplyContent;
	}
	public void setPhotoReplyContent(String photoReplyContent) {
		this.photoReplyContent = photoReplyContent;
	}
	public String getPhotoReplyCreated() {
		return photoReplyCreated;
	}
	public void setPhotoReplyCreated(String photoReplyCreated) {
		this.photoReplyCreated = photoReplyCreated;
	}
	public int getPhotoReplyType() {
		return photoReplyType;
	}
	public void setPhotoReplyType(int photoReplyType) {
		this.photoReplyType = photoReplyType;
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
