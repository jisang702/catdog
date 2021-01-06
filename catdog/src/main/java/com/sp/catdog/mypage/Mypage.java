package com.sp.catdog.mypage;

import org.springframework.web.multipart.MultipartFile;

public class Mypage {
	private String userId;
	
	private String pointCreated;
	private String pointContent;
	private String pointType;
	private String pointQuantity;
	
	private String boardType;
	private String num;
	private String subject;
	private String created;
	private String hitCount;
	private String dataCount;
	
	private String petName;
	private String petBirth, year, month, day;
	private String PetGender;
	private String petKind;
	private String petImgName;
	private String petContent;
	
	private MultipartFile upload; 
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPointCreated() {
		return pointCreated;
	}
	public void setPointCreated(String pointCreated) {
		this.pointCreated = pointCreated;
	}
	public String getPointContent() {
		return pointContent;
	}
	public void setPointContent(String pointContent) {
		this.pointContent = pointContent;
	}
	public String getPointType() {
		return pointType;
	}
	public void setPointType(String pointType) {
		this.pointType = pointType;
	}
	public String getPointQuantity() {
		return pointQuantity;
	}
	public void setPointQuantity(String pointQuantity) {
		this.pointQuantity = pointQuantity;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getHitCount() {
		return hitCount;
	}
	public void setHitCount(String hitCount) {
		this.hitCount = hitCount;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getDataCount() {
		return dataCount;
	}
	public void setDataCount(String dataCount) {
		this.dataCount = dataCount;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getPetBirth() {
		return petBirth;
	}
	public void setPetBirth(String petBirth) {
		this.petBirth = petBirth;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getPetGender() {
		return PetGender;
	}
	public void setPetGender(String petGender) {
		PetGender = petGender;
	}
	public String getPetKind() {
		return petKind;
	}
	public void setPetKind(String petKind) {
		this.petKind = petKind;
	}
	public String getPetImgName() {
		return petImgName;
	}
	public void setPetImgName(String petImgName) {
		this.petImgName = petImgName;
	}
	public String getPetContent() {
		return petContent;
	}
	public void setPetContent(String petContent) {
		this.petContent = petContent;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
}
