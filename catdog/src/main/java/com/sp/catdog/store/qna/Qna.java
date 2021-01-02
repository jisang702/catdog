package com.sp.catdog.store.qna;



public class Qna {
	private int qnaNum; //문의글번호
	private String qnaSubject; //문의글제목
	private String qnaContent; //문의글 내용
	private String qnaImgFilename;//문의글 첨부
	private int qnaSecret; //비밀글여부
	private int qnaCategory;//카테고리 번호
	private int prdNum; //상품번호
	private String userId; //회원아이디
	private Integer parent;
	private int isAnswer;
	private String created; //등록일
	private String qnaAnswer; //문의글 내용
	
	
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public Integer getParent() {
		return parent;
	}
	public void setParent(Integer parent) {
		this.parent = parent;
	}
	public int getIsAnswer() {
		return isAnswer;
	}
	public void setIsAnswer(int isAnswer) {
		this.isAnswer = isAnswer;
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
	public int getPrdNum() {
		return prdNum;
	}
	public void setPrdNum(int prdNum) {
		this.prdNum = prdNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	
	
}
