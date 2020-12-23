package com.sp.catdog.seller;

import org.springframework.web.multipart.MultipartFile;

public class StoreProduct {
	private int listNum, prdNum;
	private String prdName;
	private String prdIntro;
	private String prdContent;
	private int prdPrice;
	private int prdDisCount;
	private int prdShip;
	private int prdPoint;
	private int prdPet;
	private int prdState;
	private int prdHitCount;
	private int prdSellCount;
	private String prdCreated;
	private int prdCategoryNum;
	private String category;
	
	private String userId;
	
	private int imgFileNum;
	private String imgFilename;
	
	private MultipartFile upload;

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

	public String getPrdIntro() {
		return prdIntro;
	}

	public void setPrdIntro(String prdIntro) {
		this.prdIntro = prdIntro;
	}

	public String getPrdContent() {
		return prdContent;
	}

	public void setPrdContent(String prdContent) {
		this.prdContent = prdContent;
	}

	public int getPrdPrice() {
		return prdPrice;
	}

	public void setPrdPrice(int prdPrice) {
		this.prdPrice = prdPrice;
	}

	public int getPrdDisCount() {
		return prdDisCount;
	}

	public void setPrdDisCount(int prdDisCount) {
		this.prdDisCount = prdDisCount;
	}

	public int getPrdShip() {
		return prdShip;
	}

	public void setPrdShip(int prdShip) {
		this.prdShip = prdShip;
	}

	public int getPrdPoint() {
		return prdPoint;
	}

	public void setPrdPoint(int prdPoint) {
		this.prdPoint = prdPoint;
	}

	public int getPrdPet() {
		return prdPet;
	}

	public void setPrdPet(int prdPet) {
		this.prdPet = prdPet;
	}

	public int getPrdState() {
		return prdState;
	}

	public void setPrdState(int prdState) {
		this.prdState = prdState;
	}

	public int getPrdHitCount() {
		return prdHitCount;
	}

	public void setPrdHitCount(int prdHitCount) {
		this.prdHitCount = prdHitCount;
	}

	public int getPrdSellCount() {
		return prdSellCount;
	}

	public void setPrdSellCount(int prdSellCount) {
		this.prdSellCount = prdSellCount;
	}

	public String getPrdCreated() {
		return prdCreated;
	}

	public void setPrdCreated(String prdCreated) {
		this.prdCreated = prdCreated;
	}

	public int getPrdCategoryNum() {
		return prdCategoryNum;
	}

	public void setPrdCategoryNum(int prdCategoryNum) {
		this.prdCategoryNum = prdCategoryNum;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getImgFileNum() {
		return imgFileNum;
	}

	public void setImgFileNum(int imgFileNum) {
		this.imgFileNum = imgFileNum;
	}

	public String getImgFilename() {
		return imgFilename;
	}

	public void setImgFilename(String imgFilename) {
		this.imgFilename = imgFilename;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	} 
	
	
	
		
}
