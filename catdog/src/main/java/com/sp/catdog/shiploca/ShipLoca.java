package com.sp.catdog.shiploca;

public class ShipLoca {
	private int loNum;
	private String loName; //수령자
	private String loTel; //전화번호
	private String loZip; //우편번호
	private String loAddr1; //주소1
	private String loAddr2; //주소2
	private int orderNum; //주문번호
	private String userId; //회원아이디
	public int getLoNum() {
		return loNum;
	}
	public void setLoNum(int loNum) {
		this.loNum = loNum;
	}
	public String getLoName() {
		return loName;
	}
	public void setLoName(String loName) {
		this.loName = loName;
	}
	public String getLoTel() {
		return loTel;
	}
	public void setLoTel(String loTel) {
		this.loTel = loTel;
	}
	public String getLoZip() {
		return loZip;
	}
	public void setLoZip(String loZip) {
		this.loZip = loZip;
	}
	public String getLoAddr1() {
		return loAddr1;
	}
	public void setLoAddr1(String loAddr1) {
		this.loAddr1 = loAddr1;
	}
	public String getLoAddr2() {
		return loAddr2;
	}
	public void setLoAddr2(String loAddr2) {
		this.loAddr2 = loAddr2;
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
