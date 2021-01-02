package com.sp.catdog.admin.storeManage;

public class Store {
	private int listNum;
	private int prdNum;
	private String prdName;
	private Integer prdPet;
	private Integer prdState;
	private String created;
	private String userId;
	
	private int prdCategoryNum;
	private String prdCategoryName;
	private int enabled;
	private int orderNo;
	
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
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPrdCategoryNum() {
		return prdCategoryNum;
	}
	public void setPrdCategoryNum(int prdCategoryNum) {
		this.prdCategoryNum = prdCategoryNum;
	}
	public String getPrdCategoryName() {
		return prdCategoryName;
	}
	public void setPrdCategoryName(String prdCategoryName) {
		this.prdCategoryName = prdCategoryName;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public void setPrdPet(Integer prdPet) {
		this.prdPet = prdPet;
	}
	public void setPrdState(Integer prdState) {
		this.prdState = prdState;
	}
	public Integer getPrdPet() {
		return prdPet;
	}
	public Integer getPrdState() {
		return prdState;
	}
	
	
}
