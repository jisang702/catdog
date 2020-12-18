package com.sp.catdog.customer.qna;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int listNum;
	private int qnaNum;
	private String qnaSubject;
	private String qnaContent;
	private String qnaCreated;
	private int qnaSecret;
	private Integer qnaParent;
	private int isAnswer;
	
	private String userId;
	private String userNick;
	private int userType;
	
	private int qnaCategoryNum;
	private String qnaCategoryName;
	
	private int qnaFileNum;
	private String qnaSaveFileName;
	private String qnaOriginalFileName;
	private long qnaFileSize;
	private int qnaFileCount;
	
	private List<MultipartFile> upload;
	
	private long gap;
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getQnaSubject() {
		return qnaSubject;
	}
	public void setQnaSubject(String qnaSubject) {
		this.qnaSubject = qnaSubject;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaCreated() {
		return qnaCreated;
	}
	public void setQnaCreated(String qnaCreated) {
		this.qnaCreated = qnaCreated;
	}
	public int getQnaSecret() {
		return qnaSecret;
	}
	public void setQnaSecret(int qnaSecret) {
		this.qnaSecret = qnaSecret;
	}
	public Integer getQnaParent() {
		return qnaParent;
	}
	public void setQnaParent(Integer qnaParent) {
		this.qnaParent = qnaParent;
	}
	public int getIsAnswer() {
		return isAnswer;
	}
	public void setIsAnswer(int isAnswer) {
		this.isAnswer = isAnswer;
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
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getQnaCategoryNum() {
		return qnaCategoryNum;
	}
	public void setQnaCategoryNum(int qnaCategoryNum) {
		this.qnaCategoryNum = qnaCategoryNum;
	}
	public String getQnaCategoryName() {
		return qnaCategoryName;
	}
	public void setQnaCategoryName(String qnaCategoryName) {
		this.qnaCategoryName = qnaCategoryName;
	}
	public int getQnaFileNum() {
		return qnaFileNum;
	}
	public void setQnaFileNum(int qnaFileNum) {
		this.qnaFileNum = qnaFileNum;
	}
	public String getQnaSaveFileName() {
		return qnaSaveFileName;
	}
	public void setQnaSaveFileName(String qnaSaveFileName) {
		this.qnaSaveFileName = qnaSaveFileName;
	}
	public String getQnaOriginalFileName() {
		return qnaOriginalFileName;
	}
	public void setQnaOriginalFileName(String qnaOriginalFileName) {
		this.qnaOriginalFileName = qnaOriginalFileName;
	}
	public long getQnaFileSize() {
		return qnaFileSize;
	}
	public void setQnaFileSize(long qnaFileSize) {
		this.qnaFileSize = qnaFileSize;
	}
	public int getQnaFileCount() {
		return qnaFileCount;
	}
	public void setQnaFileCount(int qnaFileCount) {
		this.qnaFileCount = qnaFileCount;
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
	
}
