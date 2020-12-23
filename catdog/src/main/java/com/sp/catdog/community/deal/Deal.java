package com.sp.catdog.community.deal;

import org.springframework.web.multipart.MultipartFile;

public class Deal {
	private int dealNum, num;
	
	private String userId;
	private String userNick;
	
	private String dealSubject;
	private String dealCreated;
	private String dealContent;
	private int dealHitCount;
	
	private String dealPrice;
	private int dealWay;
	private int dealType;
	private int dealState;
	private String dealZone;

	private String imgFileName;
	private MultipartFile upload;

	private int replyCount;

	public int getDealNum() {
		return dealNum;
	}

	public void setDealNum(int dealNum) {
		this.dealNum = dealNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getDealSubject() {
		return dealSubject;
	}

	public void setDealSubject(String dealSubject) {
		this.dealSubject = dealSubject;
	}

	public String getDealCreated() {
		return dealCreated;
	}

	public void setDealCreated(String dealCreated) {
		this.dealCreated = dealCreated;
	}

	public String getDealContent() {
		return dealContent;
	}

	public void setDealContent(String dealContent) {
		this.dealContent = dealContent;
	}

	public int getDealHitCount() {
		return dealHitCount;
	}

	public void setDealHitCount(int dealHitCount) {
		this.dealHitCount = dealHitCount;
	}

	public String getDealPrice() {
		return dealPrice;
	}

	public void setDealPrice(String dealPrice) {
		this.dealPrice = dealPrice;
	}

	public int getDealWay() {
		return dealWay;
	}

	public void setDealWay(int dealWay) {
		this.dealWay = dealWay;
	}

	public int getDealType() {
		return dealType;
	}

	public void setDealType(int dealType) {
		this.dealType = dealType;
	}

	public int getDealState() {
		return dealState;
	}

	public void setDealState(int dealState) {
		this.dealState = dealState;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	
	public String getImgFileName() {
		return imgFileName;
	}

	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getDealZone() {
		return dealZone;
	}

	public void setDealZone(String dealZone) {
		this.dealZone = dealZone;
	}
	
}
