package com.sp.catdog.seller.qna;

public class StoreQna {
	private int listNum, prdNum;
	private String prdName;
	
	private int qnaNum; //문의글번호
	private String qnaContent; //문의글 내용
	private String qnaImgFilename;//문의글 첨부
	private int qnaSecret; //비밀글여부
	private int qnaCategory;//카테고리 번호

	private String userId, userName; //회원아이디
	private String qnaCreated; //등록일
	
	private String qnaansContent; //답글 내용
	private String answerCreated; //등록일
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getPrdNum() {
		return prdNum;
	}
	public void setPrdNum(int prdNum) {
		this.prdNum = prdNum;
	}
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaImgFilename() {
		return qnaImgFilename;
	}
	public void setQnaImgFilename(String qnaImgFilename) {
		this.qnaImgFilename = qnaImgFilename;
	}
	public int getQnaSecret() {
		return qnaSecret;
	}
	public void setQnaSecret(int qnaSecret) {
		this.qnaSecret = qnaSecret;
	}
	public int getQnaCategory() {
		return qnaCategory;
	}
	public void setQnaCategory(int qnaCategory) {
		this.qnaCategory = qnaCategory;
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
	public String getQnaansContent() {
		return qnaansContent;
	}
	public void setQnaansContent(String qnaansContent) {
		this.qnaansContent = qnaansContent;
	}
	public String getAnswerCreated() {
		return answerCreated;
	}
	public void setAnswerCreated(String answerCreated) {
		this.answerCreated = answerCreated;
	}


	
}
