package com.sp.catdog.community.freeboard;

public class Board {
	private int num;
	private int freeNum;
	private String freeSubject;
	private String freeCreated;
	private String freeContent;
	private int freeHitCount;
	private int freePet;
	
	private String userId;
	private String userNick;
	
	private int replyCount;
	private int boardLikeCount;
	
	public int getFreeNum() {
		return freeNum;
	}
	public void setFreeNum(int freeNum) {
		this.freeNum = freeNum;
	}
	public String getFreeSubject() {
		return freeSubject;
	}
	public void setFreeSubject(String freeSubject) {
		this.freeSubject = freeSubject;
	}
	public String getFreeCreated() {
		return freeCreated;
	}
	public void setFreeCreated(String freeCreated) {
		this.freeCreated = freeCreated;
	}
	public String getFreeContent() {
		return freeContent;
	}
	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}
	public int getFreeHitCount() {
		return freeHitCount;
	}
	public void setFreeHitCount(int freeHitCount) {
		this.freeHitCount = freeHitCount;
	}
	public int getFreePet() {
		return freePet;
	}
	public void setFreePet(int freePet) {
		this.freePet = freePet;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getBoardLikeCount() {
		return boardLikeCount;
	}
	public void setBoardLikeCount(int boardLikeCount) {
		this.boardLikeCount = boardLikeCount;
	}
	
	
}
