package com.sp.catdog.buyer;

public class Ord {
	private int orderNum; //주문번호
	private String orderDate; //주문일
	private int orderPrice; //상품가격
	private String userId; //회원아이디
	private int prdNum; //상품번호
	
	private int loNum; //배송번호
	private String loName; //수령자
	private String loTel,loTel1,loTel2,loTel3; //전화번호
	private String loZip; //우편번호
	private String loAddr1; //주소1
	private String loAddr2; //주소2 
	private String loMsg; //배송메시지
	
	public String getLoMsg() {
		return loMsg;
	}

	public void setLoMsg(String loMsg) {
		this.loMsg = loMsg;
	}

	public int getOrderNum() {
		return orderNum;
	}
	
	public String getLoTel1() {
		return loTel1;
	}

	public void setLoTel1(String loTel1) {
		this.loTel1 = loTel1;
	}

	public String getLoTel2() {
		return loTel2;
	}

	public void setLoTel2(String loTel2) {
		this.loTel2 = loTel2;
	}

	public String getLoTel3() {
		return loTel3;
	}

	public void setLoTel3(String loTel3) {
		this.loTel3 = loTel3;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPrdNum() {
		return prdNum;
	}
	public void setPrdNum(int prdNum) {
		this.prdNum = prdNum;
	}
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
	
	
}
