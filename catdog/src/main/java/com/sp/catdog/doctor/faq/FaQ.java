package com.sp.catdog.doctor.faq;

public class FaQ {
	private int faqNum, listNum;
	private String userId, userName;
	private String faqQuestion;//제목
	private String faqAnswer;//내용
	
	private int faqCategoryNum;
	private String faqCategoryName;
	private int faqEnabled;
	private int faqOrderNum;
	
	public int getFaqNum() {
		return faqNum;
	}
	public void setFaqNum(int faqNum) {
		this.faqNum = faqNum;
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
	public String getFaqQuestion() {
		return faqQuestion;
	}
	public void setFaqQuestion(String faqQuestion) {
		this.faqQuestion = faqQuestion;
	}
	public String getFaqAnswer() {
		return faqAnswer;
	}
	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
	}
	public int getFaqCategoryNum() {
		return faqCategoryNum;
	}
	public void setFaqCategoryNum(int faqCategoryNum) {
		this.faqCategoryNum = faqCategoryNum;
	}
	public String getFaqCategoryName() {
		return faqCategoryName;
	}
	public void setFaqCategoryName(String faqCategoryName) {
		this.faqCategoryName = faqCategoryName;
	}
	public int getFaqEnabled() {
		return faqEnabled;
	}
	public void setFaqEnabled(int faqEnabled) {
		this.faqEnabled = faqEnabled;
	}
	public int getFaqOrderNum() {
		return faqOrderNum;
	}
	public void setFaqOrderNum(int faqOrderNum) {
		this.faqOrderNum = faqOrderNum;
	}
	
}
