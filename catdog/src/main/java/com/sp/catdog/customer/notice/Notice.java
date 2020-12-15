package com.sp.catdog.customer.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int listNum;
	private int noNum;
	private String noSubject;
	private String noContent;
	private String noCreated;
	private int noHitCount;
	private int noType;
	private String userId;
	private String userNick;
	
	private int noFileNum;
	private String noSaveFileName;
	private String noOriginalFileName;
	private long noFileSize;
	private int noFileCount;
	
	private List<MultipartFile> upload; 
	
	private long gap;

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getNoNum() {
		return noNum;
	}

	public void setNoNum(int noNum) {
		this.noNum = noNum;
	}

	public String getNoSubject() {
		return noSubject;
	}

	public void setNoSubject(String noSubject) {
		this.noSubject = noSubject;
	}

	public String getNoContent() {
		return noContent;
	}

	public void setNoContent(String noContent) {
		this.noContent = noContent;
	}

	public String getNoCreated() {
		return noCreated;
	}

	public void setNoCreated(String noCreated) {
		this.noCreated = noCreated;
	}

	public int getNoHitCount() {
		return noHitCount;
	}

	public void setNoHitCount(int noHitCount) {
		this.noHitCount = noHitCount;
	}

	public int getNoType() {
		return noType;
	}

	public void setNoType(int noType) {
		this.noType = noType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getNoFileNum() {
		return noFileNum;
	}

	public void setNoFileNum(int noFileNum) {
		this.noFileNum = noFileNum;
	}

	public String getNoSaveFileName() {
		return noSaveFileName;
	}

	public void setNoSaveFileName(String noSaveFileName) {
		this.noSaveFileName = noSaveFileName;
	}

	public String getNoOriginalFileName() {
		return noOriginalFileName;
	}

	public void setNoOriginalFileName(String noOriginalFileName) {
		this.noOriginalFileName = noOriginalFileName;
	}

	public long getNoFileSize() {
		return noFileSize;
	}

	public void setNoFileSize(long noFileSize) {
		this.noFileSize = noFileSize;
	}

	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}

	public long getGap() {
		return gap;
	}

	public void setGap(long gap) {
		this.gap = gap;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public int getNoFileCount() {
		return noFileCount;
	}

	public void setNoFileCount(int noFileCount) {
		this.noFileCount = noFileCount;
	}
	
}
