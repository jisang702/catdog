package com.sp.catdog.store.review;

public class Review {

	private int reNum; //후기글 번호
	private int reStar; //평점
	private String reSubject; //후기글 제목
	private String reContent; //후기글 내용
	private String reImgFileName; //후기이미지파일이름
	private String reCreated; //후기등록일
	private int reHitCount; //후기조회수
	private int prdNum; //상품번호
	private int orderNum; //주문번호
	private String userId; //회원아이디
	public int getReNum() {
		return reNum;
	}
	public void setReNum(int reNum) {
		this.reNum = reNum;
	}
	public int getReStar() {
		return reStar;
	}
	public void setReStar(int reStar) {
		this.reStar = reStar;
	}
	public String getReSubject() {
		return reSubject;
	}
	public void setReSubject(String reSubject) {
		this.reSubject = reSubject;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public String getReImgFileName() {
		return reImgFileName;
	}
	public void setReImgFileName(String reImgFileName) {
		this.reImgFileName = reImgFileName;
	}
	public String getReCreated() {
		return reCreated;
	}
	public void setReCreated(String reCreated) {
		this.reCreated = reCreated;
	}
	public int getReHitCount() {
		return reHitCount;
	}
	public void setReHitCount(int reHitCount) {
		this.reHitCount = reHitCount;
	}
	public int getPrdNum() {
		return prdNum;
	}
	public void setPrdNum(int prdNum) {
		this.prdNum = prdNum;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
