package com.sp.catdog.doctor.video;

import org.springframework.web.multipart.MultipartFile;

public class Video {
	private int vidNum, listNum;	
	private String userId, userName;
	private String vidSubject;
	private String vidCreated;
	private String vidContent;
	private String vidUrl;
	private String vidThumb;
	private int vidHitCount;
	
	private MultipartFile upload;//썸네일 역할
	
	private int vidReplyCount;
	private int videoLikeCount;
	
	
	public int getVidNum() {
		return vidNum;
	}
	public void setVidNum(int vidNum) {
		this.vidNum = vidNum;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
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
	public String getVidSubject() {
		return vidSubject;
	}
	public void setVidSubject(String vidSubject) {
		this.vidSubject = vidSubject;
	}
	public String getVidCreated() {
		return vidCreated;
	}
	public void setVidCreated(String vidCreated) {
		this.vidCreated = vidCreated;
	}
	public String getVidContent() {
		return vidContent;
	}
	public void setVidContent(String vidContent) {
		this.vidContent = vidContent;
	}
	public String getVidUrl() {
		return vidUrl;
	}
	public void setVidUrl(String vidUrl) {
		this.vidUrl = vidUrl;
	}
	public String getVidThumb() {
		return vidThumb;
	}
	public void setVidThumb(String vidThumb) {
		this.vidThumb = vidThumb;
	}
	public int getVidHitCount() {
		return vidHitCount;
	}
	public void setVidHitCount(int vidHitCount) {
		this.vidHitCount = vidHitCount;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getVidReplyCount() {
		return vidReplyCount;
	}
	public void setVidReplyCount(int vidReplyCount) {
		this.vidReplyCount = vidReplyCount;
	}
	public int getVideoLikeCount() {
		return videoLikeCount;
	}
	public void setVideoLikeCount(int videoLikeCount) {
		this.videoLikeCount = videoLikeCount;
	}
	
	
}
