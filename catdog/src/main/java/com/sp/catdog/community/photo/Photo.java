package com.sp.catdog.community.photo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Photo {
	private int num, photoNum;
	private String userId, userNick;
	
	private String photoSubject;
	private String photoContent;
	private int photoPet;
	private int photoHitCount;
	private String photoCreated;
	
	private int replyCount;
	private int photoLikeCount;
	
	private int imgNum;
	private String photoImgOriginalname;
	private String photoImgSavename;
	private List<MultipartFile> upload;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getPhotoNum() {
		return photoNum;
	}

	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
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

	public String getPhotoSubject() {
		return photoSubject;
	}

	public void setPhotoSubject(String photoSubject) {
		this.photoSubject = photoSubject;
	}

	public String getPhotoContent() {
		return photoContent;
	}

	public void setPhotoContent(String photoContent) {
		this.photoContent = photoContent;
	}

	public int getPhotoPet() {
		return photoPet;
	}

	public void setPhotoPet(int photoPet) {
		this.photoPet = photoPet;
	}

	public int getPhotoHitCount() {
		return photoHitCount;
	}

	public void setPhotoHitCount(int photoHitCount) {
		this.photoHitCount = photoHitCount;
	}

	public String getPhotoCreated() {
		return photoCreated;
	}

	public void setPhotoCreated(String photoCreated) {
		this.photoCreated = photoCreated;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getPhotoLikeCount() {
		return photoLikeCount;
	}

	public void setPhotoLikeCount(int photoLikeCount) {
		this.photoLikeCount = photoLikeCount;
	}

	public String getPhotoImgOriginalname() {
		return photoImgOriginalname;
	}

	public void setPhotoImgOriginalname(String photoImgOriginalname) {
		this.photoImgOriginalname = photoImgOriginalname;
	}

	public String getPhotoImgSavename() {
		return photoImgSavename;
	}

	public void setPhotoImgSavename(String photoImgSavename) {
		this.photoImgSavename = photoImgSavename;
	}

	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}

	public int getImgNum() {
		return imgNum;
	}

	public void setImgNum(int imgNum) {
		this.imgNum = imgNum;
	}
	
}
