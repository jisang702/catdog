package com.sp.catdog.customer.faq;

public class Faq {
	private int faqNum;
	private String faqQuestion;
	private String faqAnswer;
	private int faqCateNum;
	private String faqCateName;
	private int faqEnabled;
	private int faqOrderNum;
	private int updateHitCount;
	private String userId;
	private int userType;
	
	
	
	public int getUpdateHitCount() {
		return updateHitCount;
	}
	public void setUpdateHitCount(int updateHitCount) {
		this.updateHitCount = updateHitCount;
	}
	public int getFaqNum() {
		return faqNum;
	}
	public void setFaqNum(int faqNum) {
		this.faqNum = faqNum;
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
	public int getFaqCateNum() {
		return faqCateNum;
	}
	public void setFaqCateNum(int faqCateNum) {
		this.faqCateNum = faqCateNum;
	}
	public String getFaqCateName() {
		return faqCateName;
	}
	public void setFaqCateName(String faqCateName) {
		this.faqCateName = faqCateName;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	
}
