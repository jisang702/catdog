package com.sp.catdog.doctor.qna;

public class QnA {
	private int listNum, qnaNum;
	
	private int qnaSecret;
	private String qnaSubject;
	private String qnaContent;
	private String userId, userName;
	private String qnaCreated;
	private Integer qnaAnc;
	private int isAnswer;
	
	private int qnaCategoryNum;
	private String qnaCategoryName;
	
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
	public int getQnaSecret() {
		return qnaSecret;
	}
	public void setQnaSecret(int qnaSecret) {
		this.qnaSecret = qnaSecret;
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
	public String getQnaCreated() {
		return qnaCreated;
	}
	public void setQnaCreated(String qnaCreated) {
		this.qnaCreated = qnaCreated;
	}
	public Integer getQnaAnc() {
		return qnaAnc;
	}
	public void setQnaAnc(Integer qnaAnc) {
		this.qnaAnc = qnaAnc;
	}
	public int getIsAnswer() {
		return isAnswer;
	}
	public void setIsAnswer(int isAnswer) {
		this.isAnswer = isAnswer;
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

}